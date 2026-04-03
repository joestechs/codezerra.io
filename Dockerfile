# Use Node.js as the base image
FROM node:16

# Install PHP and necessary extensions
RUN apt-get update && apt-get install -y \
    php \
    php-cli \
    php-mbstring \
    php-xml \
    php-mysql \
    php-curl \
    php-zip \
    && apt-get clean

# Set the working directory
WORKDIR /app

# Copy package.json and install Node.js dependencies
COPY package*.json ./
RUN npm install

# Copy PHP composer.json and install PHP dependencies (if using Composer)
# COPY composer.json ./
# RUN composer install

# Copy the rest of the application files
COPY . .

# Expose the ports (example: 3000 for Node.js and 80 for PHP)
EXPOSE 3000
EXPOSE 80

# Start the application (update this according to your entry point)
CMD ["npm", "start"]