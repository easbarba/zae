.DEFAULT_GOAL := build

NAME = distro
IMAGE_NAME = $(USER)/$(NAME)
CONTAINER_NAME = $(NAME)_dev

# set to docker, if you dare.
RUNNER = podman
COMPOSER = podman-compose

cbuild:
	$(COMPOSER) build

crun:
	$(COMPOSER) up --detach --build --force-recreate

cshell:
	$(COMPOSER) run --rm distro sh

cstop:
	$(COMPOSER) stop

build:
	$(RUNNER) build --tag $(IMAGE_NAME) .

run:
	$(RUNNER) run -p 3000:3000 -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

shell:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

unit:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run test

coverage:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run coverage

purge:
	$(RUNNER) rm $(CONTAINER_NAME)
	$(RUNNER) stop $(CONTAINER_NAME)
