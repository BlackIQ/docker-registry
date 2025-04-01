.PHONY: all up down restart
all: up

up:
	@echo "Creating docker containers"
	docker compose -p docker-registry up -d --build

down:
	@echo "Stopping and removing docker containers"
	docker compose -p docker-registry down

restart: down build up
	@echo "Restarted docker containers"
