.PHONY: all build up down restart
all: build up

build:
	@echo "Building docker images"
	docker compose build

up:
	@echo "Creating docker containers"
	docker compose up -d

down:
	@echo "Stopping and removing docker containers"
	docker compose down

restart: down build up
	@echo "Restarted docker containers"
