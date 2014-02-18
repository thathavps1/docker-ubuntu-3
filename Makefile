TAG = $(shell git rev-parse --abbrev-ref HEAD 2>/dev/null)
ifeq ($(TAG), master)
	TAG = latest
else ifeq ($(TAG), HEAD)
	TAG = latest
endif

all: release

release: test build
	docker login -u aptible+build -p $$QUAY_TOKEN -e docker@aptible.com quay.io
	docker push quay.io/aptible/ubuntu

build:
	docker build -t quay.io/aptible/ubuntu:$(TAG) .
