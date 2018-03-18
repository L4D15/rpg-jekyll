---
layout: default
title: Characters
permalink: /characters/index.html
---

This is a list of all characters in your campaign.

{% for item in site.characters %}
    {% if item.title != "Characters" %}
* [{{ item.title }}]({{ item.url }})
    {% endif %}
{% endfor %}
