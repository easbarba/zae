FROM ruby:3.1.2-alpine3.15
WORKDIR /app
COPY Gemfile* zae.gemspec ./
RUN bundle
COPY examples /root/.config/zae
COPY . .
