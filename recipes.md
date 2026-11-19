---
layout: page
title: Recipes
subtitle: Things worth cooking twice
permalink: /recipes/
---

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
