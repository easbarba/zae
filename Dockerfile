FROM ruby:3.1.2-alpine3.15
WORKDIR /app
COPY examples /root/.config/zae
COPY . . ./
RUN bundle
