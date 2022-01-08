.DEFAULT_GOAL := build

fmt:
	npx prettier --write src/*
.PHONY:fmt

lint:
	npx eslint src/*

install:
	npm link

clean:
	rm -rf "$PWD/node_modules"
.PHONY:clean

deps:
	npm install

audit:
	npm audit

c-build:
	docker-compose build

c-run:
	docker-compose run --rm --service-ports distro_dev

c-down:
	docker-compose stop
