IMAGE_NAME=worship-planner

.PHONY: all shell test build build-dev clean

run: build
	docker run --rm -p 3000:3000 ${IMAGE_NAME}

shell: build-dev
	docker run --rm -it -p 3000:3000 \
		-v $(shell pwd):/home/node/app ${IMAGE_NAME} bash

test: build-dev

build:
	docker build -t ${IMAGE_NAME} .

build-dev:
	docker build --target dev -t ${IMAGE_NAME} .
