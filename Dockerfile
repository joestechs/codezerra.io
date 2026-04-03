# Use PHP 8.2 CLI as the base image
FROM php:8.2-cli

# Install system dependencies and Composer
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set the working directory
WORKDIR /app

# Copy the entire application
COPY . .

# Install PHP dependencies if composer.json is present
RUN if [ -f composer.json ]; then composer install --no-interaction --prefer-dist --no-dev; fi

# Make the entrypoint script executable
RUN chmod +x docker-entrypoint.sh

# Expose the PHP built-in server port
EXPOSE 8000

# Use the entrypoint script to start the application
ENTRYPOINT ["./docker-entrypoint.sh"]