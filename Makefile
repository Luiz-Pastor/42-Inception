all: up

# Rule for lifting services/containers
up:
	@docker compose -f srcs/docker-compose.yml up -d --build

# Rule to stop services/containers
down:
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env down

# Rule to copy the env template
env:
	@cp srcs/.env_example srcs/.env

clean: down
	@rm -rf srcs/.env

.PHONY: up down