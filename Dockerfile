FROM ruby:3.1.1

WORKDIR /usr/src/app

COPY Gemfile pak.gemspec ./

ENV BUNDLER_VERSION 2.3.12
RUN gem install bundler -v $BUNDLER_VERSION && bundle

COPY examples /root/.config/pak
COPY . .
