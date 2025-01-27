all: up

# Rule for lifting services/containers
up: env
	@mkdir -p srcs/volumes
	@docker compose -f srcs/docker-compose.yml up -d --build

# Rule to stop services/containers
down:
	@docker compose -f srcs/docker-compose.yml --env-file srcs/.env down

# Rule to copy the env template
env:
	@if [ ! -f srcs/.env ]; then \
		cp srcs/.env_example srcs/.env; \
	fi

clean: down
	@rm -rf srcs/.env

.PHONY: all up down env clean