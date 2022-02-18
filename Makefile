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

# Runner

rbuild:
	$(RUNNER) build --tag $(IMAGE_NAME) .

rrun:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

rshell:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

runit:
	$(RUNNER) run --name $(CONTAINER_NAME) $(IMAGE_NAME) go test -race -v $(go list ./...)

rpurge:
	$(RUNNER) rm $(CONTAINER_NAME)
	$(RUNNER) stop $(CONTAINER_NAME)
