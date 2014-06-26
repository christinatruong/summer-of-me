---
layout: default
---


{% for post in site.posts %}
<h3><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }} Project</a></h3>
{{ post.excerpt }}

<a href="{{ site.baseurl }}{{ post.url }}">Read more</a> &rarr;
{% endfor %}
