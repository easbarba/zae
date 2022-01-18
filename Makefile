.DEFAULT_GOAL := build

NAME = distro
IMAGE_NAME = $(USER)/$(NAME)
CONTAINER_NAME = $(NAME)_dev

# set to docker, if you dare.
RUNNER = podman

build:
	$(RUNNER) build --tag $(IMAGE_NAME) .

run:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

attach:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

unit:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run test

coverage:
	$(RUNNER) run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run coverage

purge:
	$(RUNNER) rm $(CONTAINER_NAME)
	$(RUNNER) stop $(CONTAINER_NAME)
