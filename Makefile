.DEFAULT_GOAL := build

NAME = pak
IMAGE_NAME = $(USER)/$(NAME)
CONTAINER_NAME = $(NAME)_dev

# you may set it to your favorite container manager/builder
RUNNER = docker
COMPOSER = docker-compose

fmt:
	go fmt ./...
.PHONY:fmt

lint: fmt
	golint ./...
.PHONY:lint

vet: fmt
	go vet ./...
.PHONY:vet

build: vet
	go build hello.go
.PHONY:build

test:
	go test ./...
.PHONY:test

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
