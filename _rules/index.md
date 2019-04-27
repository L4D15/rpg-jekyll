---
title: Rules
permalink: /rules/index.html
---

{% assign all_categories = site.rules | map: "category" | compact | uniq %}

{% for category in all_categories %}

	{% assign articles = site.rules | where: "category", category %}

## {{ category }}

{% include gridlist.html list=articles %}

{% endfor %}
