#!/bin/bash

if ! docker exec -ti web_server bash -c 'find . -type f -exec chmod 644 {} \; '; then
    echo "Error: Failed to change permissions of files"
    exit 1
fi

echo "Changing permissions of files"

if ! docker exec -ti web_server bash -c 'find . -type d -exec chmod 755 {} \; '; then
    echo "Error: Failed to change permissions of directories"
    exit 1
fi

echo "Changing permissions of directories"

if ! docker exec -ti web_server bash -c 'chmod 777 var/ pub/ generated/ app/etc/'; then
    echo "Error: Failed to change permissions of directories"
    exit 1
fi

echo "Changing permissions of directories"

if ! docker exec -ti web_server bash -c 'chmod 644 ./app/etc/*.xml'; then
    echo "Error: Failed to change permissions of xml files"
    exit 1
fi

echo "Changing permissions of xml files"

if ! docker exec -ti web_server bash -c 'chmod -Rf 775 bin'; then
    echo "Error: Failed to change permissions of bin"
    exit 1
fi

echo "Changing permissions of bin"

if ! docker exec -ti web_server bash -c 'chown -R www-data: /var/www/'; then
    echo "Error: Failed to change owner of /var/www/"
    exit 1
fi

echo "Changing owner of /var/www/"