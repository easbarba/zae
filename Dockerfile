FROM ruby:3.1.1-alpine3.15

WORKDIR /usr/src/app

COPY Gemfile pak.gemspec ./

ENV BUNDLER_VERSION 2.3.8
RUN gem install bundler -v $BUNDLER_VERSION && bundle install

COPY docs/config_examples/*.yaml /root/.config/pak/
COPY . .


CMD ["exe/pak"]

