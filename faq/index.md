---
layout: page
title:  "FAQ"
---

#FAQ List
<ul>
{% for p in site.pages %}
  {% if p.faq_entry == true %}
  <li>
  <a href="{{p.url}}"> {{ p.title }} </a>
  </li>
  {% endif %}
{% endfor %}
</ul>
