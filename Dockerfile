FROM ruby:3.1.1
WORKDIR /app
COPY Gemfile* pak.gemspec ./
RUN bundle
COPY examples /root/.config/pak
COPY . .
