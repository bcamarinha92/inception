NAME			= inception
DATABASE_DIR	= /home/bde-sous/data/mariadb_data
WORDPRESS_DIR	= /home/bde-sous/data/wordpress_data

CONTAINERS = wordpress mariadb nginx
IMAGES = wordpress mariadb nginx
VOLUMES = wordpress_data mariadb_data
NETWORK = inception

all: create-dir build up

# Create the database directory
create-dir:
	@echo "Creating directory $(DATABASE_DIR)..."
	@mkdir -p $(DATABASE_DIR)
	@mkdir -p $(WORDPRESS_DIR)

# Build the Docker Compose setup
build:
	@echo "Building Docker Compose setup..."
	@docker compose -f ./srcs/docker-compose.yml -p $(NAME) build

# Run the Docker Compose setup
up:
	@echo "Running Docker Compose setup..."
	@docker compose -f ./srcs/docker-compose.yml up -d

# Stop the Docker Compose setup
down:
	@echo "Stopping Docker Compose setup..."
	@docker compose -f ./srcs/docker-compose.yml down

# Remove the database directory (use with caution)
clean:
	@echo "Stopping and removing containers..."
	@for container in $(CONTAINERS); do \
		docker stop $$container || true; \
		docker rm $$container || true; \
	done
	@echo "Removing images..."
	@for image in $(IMAGES); do \
		docker rmi $$image || true; \
	done

fclean: clean
	@echo "Removing volumes..."
	@for volume in $(VOLUMES); do \
		docker volume rm $$volume || true; \
	done
	@echo "Removing network..."
	@docker network rm $(NETWORK) || true
	@sudo rm -rf $(DATABASE_DIR)
	@sudo rm -rf $(WORDPRESS_DIR)

re: fclean all
