---
layout: post
title: Docker Compose in Production
subtitle: 
cover-img: /assets/images/whale.jpg
thumbnail-img:  
share-img: 
tags: [docker, devops]
author: Jan Vaorin
---

# Docker Compose: Is It Production Ready? 

There’s been an ongoing debate in the tech world over whether Docker Compose is a viable tool for deploying workloads in production. Many argue it’s a clear no, but as with many things in software development, **it depends**.

Saying "it's never a good idea" oversimplifies things. There are many production environments where Docker Compose works exceptionally well if you understand its limitations and match them to your use case.

## The Misunderstood Monolith

Many new developers underestimate the ability of monolithic software stacks to scale effectively. A simple architecture that is easy to deploy and maintain can be invaluable in production. 

When you eventually reach the point where your app outgrows a single machine, scaling is not impossible. In fact, moving to a more advanced orchestrator like Docker Swarm or Kubernetes is relatively straightforward—but that’s a topic for another time. Here, we’ll focus on **keeping things simple (KISS)**.

### Compose vs. Orchestrators

Docker Compose is **not** an orchestrator. It lacks features like in-place updates, automated failover, and no-downtime updates. But the real question is: *Do you actually need those things for your current business case*?

Most applications have scheduled maintenance windows, meaning some downtime is acceptable. Failover can be handled by restarting containers (as long as they restart quickly). Health checks can help automate restarts, and you can even automate updates using tools like Ansible or custom scripts.

This approach offers a stable interface for developing and deploying applications, especially if you don’t have long-running blocking tasks.

## The Cost Factor

Many startups choose a fully cloud-native route, spending huge resources on Kubernetes or managed services. But the truth is, for a lot of small-to-medium workloads, this setup can be **overkill**. 

They may not exceed the capacity of a single large VPS, yet they pay a premium for infinite scalability they don’t yet need. Sometimes “good enough” is all you need to get your app up and running. Simplicity can be cheap, and for many teams, simple deployments with Docker Compose are more than sufficient. 

## When Compose Makes Sense for Production

Docker Compose may be production-worthy if your app meets these criteria:

- **Not critical infrastructure**: Your app doesn’t need to be up 100% of the time.
- **Rare crashes**: If it does crash, it starts up quickly.
- **Single host capacity**: Your app doesn’t exceed the compute, memory, or bandwidth of a single host.
- **Health checks**: You have good ways to monitor the health of your app (via TCP or HTTP endpoints).
- **Reasonable complexity**: Your Compose setup is manageable in terms of the number of services and configuration files.
- **No high-availability demands**.

## Knowing When to Upgrade

When your system outgrows your current capacity, it’s time to look at scaling. Some options include:

- **Move the database**: Shift your database to another server or a managed service.
- **Upgrade Docker**: Moving from Docker Compose to Docker Swarm involves minimal friction as they share many concepts.
- **Move to Kubernetes**: This introduces significant management overhead but is the industry standard for large-scale applications.

Remember, though: **Done is better than perfect.** Getting your product to market is more important than having the perfect deployment strategy. You can always change your deployment method later as your needs evolve.

## Backups Are Crucial

A quick word on backups: **Do them now!** 

I won’t delve into the details, but follow the 3-2-1 rule and always test your backups. I like using disk snapshots, which most cloud providers offer at a low cost. Make sure to store backups offsite or with a different cloud vendor if your data is critical.

It’s easier to back up everything when your app’s stateful files are mounted from the filesystem. A tool like `rdiff` can help you snapshot files at a specific point in time. 

## Docker's Tips for a Production-Ready Compose Setup

Docker itself offers some useful guidelines to help you productionize your Docker Compose setup. These include:

- **Remove volume bindings for application code**: Keep your code inside the container to prevent accidental changes from the host.
- **Bind to different ports**: On production, bind your services to appropriate ports on the host.
- **Set production environment variables**: Reduce logging verbosity and set external service configurations (e.g., email servers).
- **Use a restart policy**: Set `restart: always` to minimize downtime.
- **Add extra services**: Consider a log aggregator or similar production-focused services.
- **Avoid running as root**: For security reasons, don’t use root inside your containers.
- **Secure your reverse-proxy**: Bind your reverse-proxy ports to `127.0.0.1`, since Docker sometimes bypasses firewalls due to the way it binds Ethernet adapters.

To handle these changes, you can define a second Compose file—such as `production.yml`—with production-specific settings. Then use it in combination with your original file:
```bash
docker compose -f compose.yml -f production.yml up -d 
```
This allows you to keep your dev and prod configurations separate while maintaining simplicity.

#Conclusion
Docker Compose can be a perfectly acceptable choice for production environments, especially for simpler, low-maintenance applications. It may not have the power of Kubernetes, but its simplicity, ease of deployment, and low overhead make it a viable option for many use cases. Keep things simple, scalable, and cost-effective, and remember: getting the product out the door is more important than having the perfect setup from day one.
