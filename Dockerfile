FROM ruby:3.1.2-alpine3.15
WORKDIR /app
COPY Gemfile* pak.gemspec ./
RUN bundle
COPY examples /root/.config/pak
COPY . .
