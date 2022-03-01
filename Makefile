init-site:
	mkdir -p ${PWD}/src/app
	mkdir -p ${PWD}/src/vendor/bundle
	docker run -it -d --rm --name www --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 jekyll new .

generate-site:
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 jekyll build 

update-bundler:
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 gem install bundler

dockerize:
	docker build --rm --no-cache -t repasscloud/www .

build:
	docker build -t repasscloud/www .

serve:
	docker run -it -d --rm --name www -p 4002:4000 repasscloud/www

publish:
	docker stop www
	make update-bundler
	make generate-site
	make dockerize
	make serve
