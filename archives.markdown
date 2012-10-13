---
layout: default
title: Arkiv
---

<div id="home">
	<h1 class="post_title">Posteringer</h1>
	<ul class="posts">
	{% for post in site.posts %}
		<li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endfor %}
	</ul>
</div>