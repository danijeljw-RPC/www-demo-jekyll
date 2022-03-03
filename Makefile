clean:
	rm -rf app
	rm -rf vendor
	mkdir app
	mkdir -p vendor/bundle
serve:
	docker run --rm -it -d -p 4003:4000 --name="zen_archimedes" --volume="${PWD}/app:/srv/jekyll" --volume="${PWD}/vendor/bundle:/usr/local/bundle" j2 jekyll serve
stop:
	docker stop zen_archimedes
rebuild:
	docker stop zen_archimedes
	docker run --rm -it -d -p 4003:4000 --name="zen_archimedes" --volume="${PWD}/app:/srv/jekyll" --volume="${PWD}/vendor/bundle:/usr/local/bundle" j2 jekyll serve
