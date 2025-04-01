.PHONY: all update up down restart
all: update up

update:
	@echo "Updating repository"
	git pull

up:
	@echo "Creating docker containers"
	docker compose -p docker-registry up -d

down:
	@echo "Stopping and removing docker containers"
	docker compose -p docker-registry down

restart: down build up
	@echo "Restarted docker containers"
