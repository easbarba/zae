.DEFAULT_GOAL := install

NAME = distro
IMAGE_NAME = $(USER)/$(NAME)
CONTAINER_NAME = $(NAME)_dev

fmt:
	npx prettier --write src/*
.PHONY:fmt

lint:
	npx eslint src/*

tsc:
	npx tsc

deps:
	npm install

install: deps
	npm link
.PHONY:install

clean:
	rm -rf $(PWD)/node_modules
.PHONY:clean

audit:
	npm audit

build:
	docker build --tag $(IMAGE_NAME) .

run:
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

attach:
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

unit:
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm test
coverage:
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run coverage

purge:
	docker rm $(CONTAINER_NAME)
	docker stop $(CONTAINER_NAME)
