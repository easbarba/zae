.DEFAULT_GOAL := install

fmt:
	npx prettier --write src/*
.PHONY:fmt

lint:
	npx eslint src/*

deps:
	npm install

install: deps
	npm link
.PHONY:install

clean:
	rm -rf "$PWD/node_modules"
.PHONY:clean

audit:
	npm audit

build:
	docker-compose build

run:
	docker-compose run --rm --name distro --service-ports

attach:
	docker exec -it distro

down:
	docker-compose stop
