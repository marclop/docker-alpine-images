DOCKER_REPO = marclop/alpine
COMPONENT ?= elasticsearch
VERSION ?= $(shell ls -r1 $(COMPONENT) | head -1)


.PHONY: build clean run

build:
	-docker images | grep $(COMPONENT) | grep $(VERSION) > /dev/null 2>&1 && docker rmi $(DOCKER_REPO)-$(COMPONENT):$(VERSION)
	docker build --no-cache --force-rm -t $(DOCKER_REPO)-$(COMPONENT):$(VERSION) $(COMPONENT)/$(VERSION)

clean:
	docker rmi $(DOCKER_REPO)-$(COMPONENT):$(VERSION)

enter:
	docker run -P -ti $(DOCKER_REPO)-$(COMPONENT):$(VERSION) /bin/sh
