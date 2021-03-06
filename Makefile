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
snatch:
	rm -rf "${PWD}/app/_site"
	docker run --rm -it -d -p 4003:4000 --name="zen_archimedes" --volume="${PWD}/app:/srv/jekyll" --volume="${PWD}/vendor/bundle:/usr/local/bundle" j2 jekyll build
catch:
	docker stop zen_archimedes
	git add .
	git commit -m 'catch commit'
	docker run --rm -it -d -p 4003:4000 --name="zen_archimedes" --volume="${PWD}/app:/srv/jekyll" --volume="${PWD}/vendor/bundle:/usr/local/bundle" j2 jekyll serve
publish:
	ssh admin-rpc@repasscloud.com "rm  -rf /data/nginx/html/*"
	scp -r ${PWD}/app/_site/ admin-rpc@repasscloud.com:/data/nginx/html/
