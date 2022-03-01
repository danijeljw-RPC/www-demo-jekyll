build:
	docker build -t repasscloud/www .

serve:
	docker run -it -d --rm --name www -p 4002:4000 repasscloud/www

gensite:
	docker run -it --rm --name builder --volume="${PWD}/src/app:/srv/jekyll" --volume="${PWD}/src/vendor/bundle:/usr/local/bundle" jekyll/jekyll:3.8.6 jekyll build 
