.DEFAULT_GOAL := install

NAME = distro
IMAGE_NAME = $(USER)/$(NAME)
CONTAINER_NAME = $(NAME)_dev

build:
	podman build --tag $(IMAGE_NAME) .

run:
	podman run -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

attach:
	podman run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) sh

unit:
	podman run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run test

coverage:
	podman run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) npm run coverage

purge:
	podman rm $(CONTAINER_NAME)
	podman stop $(CONTAINER_NAME)
