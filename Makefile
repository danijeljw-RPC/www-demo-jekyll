init-site:
	docker stop www
	rm -rf ${PWD}/src
	mkdir -p ${PWD}/src/app
	mkdir -p ${PWD}/src/vendor/bundle
	docker run -it -d --rm --name www --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 jekyll new .
	rm -rf ${PWD}/src/app/index.md

generate-site:
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 jekyll build 

update-bundler:
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 gem install bundler

dockerize:
	docker build --rm --no-cache -t repasscloud/www .

serve:
	docker run -it -d --rm --name www -p 4002:4000 repasscloud/www

publish-new:
	make update-bundler
	make generate-site
	make dockerize
	make serve

publish:
	docker stop www
	make update-bundler
	make generate-site
	make dockerize
	make serve

init-site-4.2.0:
	rm -rf ${PWD}/src
	mkdir -p ${PWD}/src/app
	mkdir -p ${PWD}/src/vendor/bundle
	docker run -it -d --rm --name www --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:4.2.0 jekyll new .
	rm -rf ${PWD}/src/app/index.md

serve-4.2.0:
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:4.2.0 gem install bundler
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:4.2.0 jekyll build
	docker build --rm --no-cache -t repasscloud/www:4.2.0 .
	docker run -it -d --rm --name www -p 4002:4000 repasscloud/www:4.2.0