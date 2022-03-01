FROM ruby:2.7.5

COPY Gemfile Gemfile.lock pak.gemspec /app/
WORKDIR /app/

RUN gem install bundler -v 2.3.3 && bundle install

COPY examples/ /root/.config/pak
COPY . /app/
