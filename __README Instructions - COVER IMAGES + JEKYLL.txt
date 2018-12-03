COVER IMAGES - Instructions

	---
	Place Original Image here:
	    _posts
	        - blog-post.md
	    _cover_image
	        - original.jpg

	---
	Generate cover-images from all "*/_cover_image/original.jpg" by:
	- Going into 'knol' and running ./thumbnail-gen.sh (uses image-magic)

---------------------------------------------

JEKYLL - Instructions

Installation:
	- https://jekyllrb.com/docs/installation/macos/

Run:
	- CD to directory (e.g. "BlogRepo", or the one that contains "_site, _posts, _config.yml, etc.")
	- Run: " jekyll serve --baseurl /blog "

Open:
- By default, site is at (note the /blog dir):
	http://127.0.0.1:4000/blog/