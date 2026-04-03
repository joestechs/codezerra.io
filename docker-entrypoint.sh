#!/bin/sh

# docker-entrypoint.sh

set -e

# Start the PHP built-in server from the app root
exec php -S 0.0.0.0:8000 -t /app
