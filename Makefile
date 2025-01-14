all: up

# Rule for lifting services/containers
up:
	docker compose -f srcs/docker-compose.yml --env-file srcs/.env up

# Rule to stop services/containers
down:
	docker compose -f srcs/docker-compose.yml --env-file srcs/.env down

.PHONY: up down