---
title: Rules
permalink: /rules/index.html
---

{% for rule in site.rules %}
    {% if rule.title != page.title %}
* [{{ rule.title }}]({{ rule.url | absolute_url }})
    {% endif %}
{% endfor %}
