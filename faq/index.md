---
layout: default
title:  "FAQ"
---
<ul>
{% for p in site.pages %}
  {% if p.faq_entry == true %}
  <li>
  <a href="{{p.url}}"> {{ p.title }} </a>
  </li>
  {% endif %}
{% endfor %}
</ul>
