---
title: Locations
permalink: /locations/index.html
---

This is a list of all locations in your campaign.

{% for item in site.locations %}
    {% if item.title != "Locations" %}
* [{{ item.title }}]({{ item.url }})
    {% endif %}
{% endfor %}
