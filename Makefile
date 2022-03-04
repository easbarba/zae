.DEFAULT_GOAL := install

fmt:
	bundle exec rufo lib/*
.PHONY:fmt

lint:
	bundle exec reek lib/*

test:
	bundle exec rspec spec
.PHONY:test

deps:
	gem install bundler --no-document
	bundle check || bin/setup

install: deps
	bundle exec rake install
