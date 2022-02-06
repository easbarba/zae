.DEFAULT_GOAL := build

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

test: vet
	go test ./...
.PHONY:test

# NAME = distro
# IMAGE_NAME = $(USER)/$(NAME)
# CONTAINER_NAME = $(NAME)_dev

# # you may set it to your favorite container manager/builder
# RUNNER = docker
# COMPOSER = docker-compose

# cbuild:
# 	$(COMPOSER) build

# crun:
# 	$(COMPOSER) up --detach --build --force-recreate

# cshell:
# 	$(COMPOSER) run --rm distro sh

# cstop:
# 	$(COMPOSER) stop

# build:
# 	$(RUNNER) build --tag $(IMAGE_NAME) .

# run:
# 	$(RUNNER) run -p 3000:3000 -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

# shell:
# 	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

# unit:
# 	$(RUNNER) run --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run test

# coverage:
# 	$(RUNNER) run --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run coverage

# purge:
# 	$(RUNNER) rm $(CONTAINER_NAME)
# 	$(RUNNER) stop $(CONTAINER_NAME)
