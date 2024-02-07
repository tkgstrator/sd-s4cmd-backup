include .secrets

PHONY: buildx
buildx:
	docker buildx build --push --build-arg ALPINE_VERSION=3.19.1 --platform=linux/amd64,linux/arm64 -t tkgling/s4cmd-docker:latest .

PHONY: build
build:
	docker build --build-arg ALPINE_VERSION=3.19.1 --platform=linux/arm64 -t tkgling/s4cmd-docker:latest .