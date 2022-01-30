.DEFAULT_GOAL := build

fmt:
	rufo lib/*
.PHONY:fmt

lint: fmt
	reek lib/*

install:
	gem build distro.gemspec
	gem install ./distro-*.gem

clean:
	rm -rf "$PWD/.gems"
	rm -rf "$PWD/.cache"
.PHONY:clean

deps:
	gem install bundler --no-document
	bundle check || bin/setup

audit:
	bundle exec bundle audit check --update # refresh the database, analyze our Gemfile.lock after any vulnerable versions.

c-build:
	docker-compose build

c-run:
	docker-compose run --rm --service-ports ruby_dev

c-down:
	docker-compose stop
