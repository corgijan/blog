---
layout: page
title: Recipes
subtitle: Things worth cooking twice
permalink: /recipes/
---

Seventeen recipes that used to live in their own little Flask app behind
`rezepte.corgijan.dev`. They are hand-written Markdown now — one file per recipe
in `_recipes/`, no database behind it — and in German, because that is how they
were written down in the kitchen.

{% assign groups = "Brot & Backen|Hauptgerichte|Suppen & Salate|Dips & Dressings" | split: "|" %}
{% for group in groups %}
## {{ group }}

<ul class="recipe-list">
{% assign items = site.recipes | where: "group", group | sort: "title" %}
{% for recipe in items %}
  <li>
    <a href="{{ recipe.url }}">{{ recipe.title }}</a>
    <span>{{ recipe.subtitle }}</span>
  </li>
{% endfor %}
</ul>
{% endfor %}
