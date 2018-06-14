.DEFAULT_GOAL := build
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: # Build images for python/ipython 3,2
	docker build --build-arg VERSION=3 . -t pedroburon/pyter:latest
	docker tag pedroburon/pyter:latest pedroburon/pyter:3
	docker build --build-arg VERSION=2 . -t pedroburon/pyter:2
	docker build --build-arg VERSION=3 --build-arg REQUIREMENTS_FILE=requirements-ipython.txt . -t pedroburon/pyter:3-ipython
	docker build --build-arg VERSION=2 --build-arg REQUIREMENTS_FILE=requirements-ipython.txt . -t pedroburon/pyter:2-ipython

push: build # push images to docker hub
	docker push pedroburon/pyter:latest
	docker push pedroburon/pyter:3
	docker push pedroburon/pyter:2
	docker push pedroburon/pyter:3-ipython
	docker push pedroburon/pyter:2-ipython
