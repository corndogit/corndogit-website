FROM ruby:3.3 AS builder
WORKDIR /app
COPY . .
RUN gem install jekyll bundler:4.0.2
RUN bundle install --no-lock
RUN bundle exec jekyll build

FROM nginx:1.29.4-alpine3.23-slim AS runtime
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/_site /var/www/html/
EXPOSE 4000

ENTRYPOINT ["nginx","-g","daemon off;"]