---
layout: page
---
{% capture site_tags %}{% for tag in site.tags %}{{tag | first}}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}
<h2>Tags</h2>
{% assign tag_words = site_tags | split:',' | sort %}
{% for tag in tag_words %}
  * [{{tag}}](/blog/tags/{{tag | slugify}}/ "Posts tagged '{{tag}}'")
{% endfor %}