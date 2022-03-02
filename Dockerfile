FROM jekyll/jekyll:3.8.6
RUN gem install bundler




# FROM jekyll/jekyll:4.2.0
# WORKDIR /srv/jekyll
# COPY ./src/app /srv/jekyll
# COPY ./src/vendor/bundle /usr/local/bundle
# EXPOSE 4000
# CMD ["jekyll", "serve"]





















# ~/jekyll-site/Dockerfile
# FROM jekyll/jekyll:3.8.6 AS base
# WORKDIR /srv/jekyll
# EXPOSE 4000

# FROM jekyll/jekyll:3.8.6 AS build
# WORKDIR /srv/jekyll
# RUN jekyll new .

# FROM base AS final
# WORKDIR /srv/jekyll
# COPY --from=build /usr/local/bundle /usr/local/bundle
# COPY --from=build /srv/jekyll .
# ENTRYPOINT ["jekyll", "serve"]



