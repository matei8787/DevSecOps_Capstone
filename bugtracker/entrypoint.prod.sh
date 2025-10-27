#!/bin/bash

if [ "$DATABASE" = "postgres" ]; then

    echo "Waiting for connection..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL up and ready!"
fi

exec "$@"