---
layout: page
title: Projects
subtitle: Why you'd want to go on a date with me
cover-img: https://images.unsplash.com/photo-1712741042337-124ff2469441?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D
---

<style>
.gallery {
  --size: 100px;
  display: grid;
  grid-template-columns: repeat(6, var(--size));
  grid-auto-rows: var(--size);
  margin-bottom: var(--size);
  place-items: start center;
  gap: 5px;
  
  &:has(:hover) img:not(:hover),
  &:has(:focus) img:not(:focus){
    filter: brightness(0.5) contrast(0.5);
  }

  & img {
    object-fit: cover;
    width: calc(var(--size) * 2);
    height: calc(var(--size) * 2);
    clip-path: path("M90,10 C100,0 100,0 110,10 190,90 190,90 190,90 200,100 200,100 190,110 190,110 110,190 110,190 100,200 100,200 90,190 90,190 10,110 10,110 0,100 0,100 10,90Z");
    transition: clip-path 0.25s, filter 0.75s;
    grid-column: auto / span 2;
    border-radius: 5px;

    &:nth-child(5n - 1) { 
      grid-column: 2 / span 2 
    }

    &:hover,
    &:focus {
      clip-path: path("M0,0 C0,0 200,0 200,0 200,0 200,100 200,100 200,100 200,200 200,200 200,200 100,200 100,200 100,200 100,200 0,200 0,200 0,100 0,100 0,100 0,100 0,100Z");
      z-index: 1;
      transition: clip-path 0.25s, filter 0.25s;
    }
    
    &:focus {
      outline: 1px dashed black;
      outline-offset: -5px;
    }
  }
}
    </style>

<article class="gallery">
  <img src="https://assets.codepen.io/1506195/unsplash-music-0.avif" alt="guitar player at concert" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-1.avif" alt="duo singing" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-2.avif" alt="crowd cheering" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-3.avif" alt="singer performing" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-4.avif" alt="singer fistbumping crowd" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-5.avif" alt="man with a guitar singing" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-6.avif" alt="crowd looking at a lighted stage" />
  <img src="https://assets.codepen.io/1506195/unsplash-music-7.avif" alt="woman singing on stage" />
</article>
