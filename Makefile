.PHONY: default check test build image

IMAGE_NAME := whoami

default: check test build

build:
	CGO_ENABLED=0 go build -a --trimpath --installsuffix cgo --ldflags="-s" -o whoami

test:
	go test -v -cover ./...

check:
	golangci-lint run

image:
	docker build --build-arg VERSION=1 -t $(IMAGE_NAME) .
