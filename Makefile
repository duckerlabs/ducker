.DEFAULT_GOAL := run

DUCKDB_VERSION=v0.7.1
PRQL_VERSION=latest
IMAGE_NAME := duckerlabs/ducker:$(DUCKDB_VERSION)
LATEST_IMAGE_NAME := duckerlabs/ducker:latest

build:
	@docker build --build-arg DUCKDB_VERSION=$(DUCKDB_VERSION) --build-arg PRQL_VERSION=$(PRQL_VERSION) -t $(IMAGE_NAME) -t $(LATEST_IMAGE_NAME) .

run:
	@docker run --rm -it $(IMAGE_NAME)

push: build
	docker push $(IMAGE_NAME)
	docker push $(LATEST_IMAGE_NAME)
