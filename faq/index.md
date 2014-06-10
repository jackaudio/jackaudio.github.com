---
layout: page
title:  "FAQ"
menu_item: true
---

#FAQ List
<ul>
{% for p in site.pages %}
  {% if p.faq_entry == true %}
  <li>
  <a href="{{site.baseurl}}{{p.url}}"> {{ p.title }} </a>
  </li>
  {% endif %}
{% endfor %}
</ul>
