# Use Node.js as the base image
FROM node:16

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

# Expose the port for Node.js
EXPOSE 3000

# Start the application (update this according to your entry point)
CMD ["npm", "start"]