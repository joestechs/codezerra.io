#!/bin/sh

# docker-entrypoint.sh

set -e

# Install Composer dependencies
if [ ! -f vendor/autoload.php ]; then
    composer install --no-interaction --prefer-dist
fi

# Start the application using php
php -S 0.0.0.0:8000 -t public
