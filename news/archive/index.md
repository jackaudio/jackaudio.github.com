---
title: "News Archive"
---
<h2>{{ page.title }}</h2>
<table>
	<thead>
		<tr>
			<th>Post</th>
			<th>Date</th>
			<th>Author</th>
		</tr>
	</thead>
	<tbody>
{% for post in site.posts %}
		<tr>
			<td><a href="{{ post.url }}">{{ post.title | escape }}</a></td>
			<td><time datetime="{{ post.date | datetime | date_to_xmlschema }}" pubdate{% if updated %}
				data-updated="true"{% endif %}>{{ post.date | date: page.date_fmt }}</time></td>
			<td>{{ post.author }}</td>
		</tr>
{% endfor %}
	</tbody>
</table>
