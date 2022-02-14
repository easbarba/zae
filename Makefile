.DEFAULT_GOAL := build

NAME = pak
IMAGE_NAME = $(USER)/$(NAME)
CONTAINER_NAME = $(NAME)_dev

# you may set to your favorite container manager
RUNNER := docker
COMPOSER := docker-compose

# Project

fmt:
	go fmt $(go list ./...)
.PHONY:fmt

lint: fmt
	golint $(go list ./...)
.PHONY:lint

vet: fmt
	go vet $(go list ./...)
.PHONY:vet

test:
	go test -race -v $(go list ./...)
.PHONY:test

clean:
	rm $(NAME)

build: vet
	go build -race -ldflags "-extldflags '-static'" -o pak cmd/pak/main.go
.PHONY:build

install:
	go install

# Compose

cbuild:
	$(COMPOSER) build

crun:
	$(COMPOSER) up --detach --build --force-recreate

cshell:
	$(COMPOSER) run --rm pak sh

cstop:
	$(COMPOSER) stop

dbuild:
	$(RUNNER) build --tag $(IMAGE_NAME) .

# Docker

drun:
	$(RUNNER) run -p 3000:3000 -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

dshell:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

dunit:
	$(RUNNER) run --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run test

dcoverage:
	$(RUNNER) run --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run coverage

dpurge:
	$(RUNNER) rm $(CONTAINER_NAME)
	$(RUNNER) stop $(CONTAINER_NAME)
