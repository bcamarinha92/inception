NAME			= inception
DATABASE_DIR	= /home/bde-sous/data/mariadb_data
WORDPRESS_DIR	= /home/bde-sous/data/wordpress_data

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
	@echo "Removing directory $(DATABASE_DIR)..."
	@rm -rf $(DATABASE_DIR)
	@echo "Removing directory $(WORDPRESS_DIR)..."
	@rm -rf $(WORDPRESS_DIR)
