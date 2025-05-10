---
layout: post
title: Caddy Reverse Proxy with Single Instance Anubis (Anti AI Crawler)
subtitle: A better way to have multiple domains protected by anubis
cover-img: /assets/images/landscape11.jpg
thumbnail-img: 
share-img: 
tags: [anubis,tech]
author: Jan Vaorin
---

# Quick setup for anubis with Caddy 
Anubis is a powerful tool, but getting it set up can sometimes be a challenge. This blog post simplifies the process by demonstrating how corgijan can use Caddy for quick and easy deployment. Enjoy automatic HTTPS, simplified configuration, and a hassle-free Anubis setup.

Our Topology is as follows. The Reverse Proxy uses the `X-Forwarded-Host` as an indication where the request came from. This could be set explicitly in the Caddyfile but is set per default.
<img src="/assets/topo.svg" style="max-width:400px" alt="Anubis Topology">
Caddy 1 Config (Both pointing to the anubis instance)
```
# Caddyfile-TLS-Term
anubis1.ex.ample {
        reverse_proxy localhost:8081
}

anubis2.ex.ample {
        reverse_proxy localhost:8081
}
```
The Second Caddy Listens on port 7000 and reverse proxies via the `X-Forwarded-Host` 
```
# Caddyfile-Reverse-Proxy
{
        auto_https off
}

:7000 {
    @valid {
                header X-Forwarded-Host anubis.ex.ample
        }
    route {
          respond @valid "You are IN" # you can reverse_proxy here to your destination
    }
    handle {
          respond "You are Out"
    }
}
```
and the docker-compose as an example
```
version: "3.7"
services:
    reverse-proxy-no-tls:
        image: docker.io/library/caddy:alpine
        network_mode: host
        command: caddy run --config /etc/caddy/Caddyfile
        restart: always
        volumes:
          - ./Caddyfile-Reverse-Proxy:/etc/caddy/Caddyfile:z

    reverse-proxy-tls:
        image: docker.io/library/caddy:alpine
        network_mode: host
        command: caddy run --config /etc/caddy/Caddyfile
        restart: always
        volumes:
          - ./Caddyfile-TLS-Term:/etc/caddy/Caddyfile:z

    anubis-all:
        image: ghcr.io/techarohq/anubis:latest
        environment:
          BIND: ":8081"
          DIFFICULTY: "4"
          METRICS_BIND: ":9091"
          SERVE_ROBOTS_TXT: "true"
          TARGET: "http://localhost:7000"
          POLICY_FNAME: "/data/cfg/botPolicy.yaml"
          OG_PASSTHROUGH: "true"
          OG_EXPIRY_TIME: "24h"
        network_mode: host
        volumes:
          - "./botPolicy.yaml:/data/cfg/botPolicy.yaml:ro"
```
There you go! That was not that hard!


<script>
        document.addEventListener("DOMContentLoaded", function() {
            const images = document.querySelectorAll('img');
            images.forEach((img) => {
                const src = img.getAttribute('src');
                if (src) {
                    img.addEventListener('click', function() {
                        lightbox = new FsLightbox();
                        lightbox.props.sources = [src];
                        lightbox.open();
                        const fullscreenButton = document.querySelector('.fslightbox-toolbar-button.fslightbox-flex-centered[title="Enter fullscreen"]');
                        if (fullscreenButton) {fullscreenButton.style.display = 'none';}})}});});
</script>
<style>
    .fslightbox-source {max-height: 80vh ;height: auto!important;width: auto!important;}
    @media screen and (max-width: 768px) {.fslightbox-source {width: 100vw!important;height: auto}}
    .stayopen[open] summary {display: none;}
</style>