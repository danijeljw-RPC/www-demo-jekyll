clean:
	rm -rf app
	rm -rf vendor
	mkdir app
	mkdir -p vendor/bundle
serve:
	docker run --rm -it -p 4003:4000 --volume="${PWD}/app:/srv/jekyll" --volume="${PWD}/vendor/bundle:/usr/local/bundle" j2 jekyll serve
