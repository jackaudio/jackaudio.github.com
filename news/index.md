---
title: "News"
---
{%-for post in site.posts limit:5-%}
<h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
<h6>On <time datetime="{{ post.date | datetime | date_to_xmlschema }}"{%-if updated-%}
	data-updated="true"{%-endif-%}>{{ post.date | date: page.date_fmt }}</time>
	{% if post.author %}by <i>{{ post.author }}</i>{% endif %}
</h6>
{{ post.content }}
{%-endfor-%}

[ <a href="/news/archive/">News Archive</a> ]
