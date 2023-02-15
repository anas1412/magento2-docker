#!/bin/bash

echo "Checking Backend Magento Folder"

if [ ! -d "backend-magento" ]; then
    echo "Error: Directory backend-magento not found"
    echo "Please make sure that a backend-magento folder exist in current directory"
    exit 1
fi

echo "Backend Magento Folder exist!"


#if ! docker exec -ti web_server bash -c 'php bin/magento module:enable --all'; then
#    echo "Error: Failed to enable modules"
#    exit 1
#fi

#echo "Enabling Modules"

#if ! docker exec -ti web_server bash -c 'chown -R www-data: /var/www/'; then
 #   echo "Error: Failed to change owner of /var/www/"
#    exit 1
#fi

#echo "Changing owner of /var/www/"

if ! docker exec -ti web_server bash -c 'chmod u+x bin/magento'; then
    echo "Error: Failed to change permissions of bin/magento"
    exit 1
fi

echo "Changing permissions of bin/magento"

f ! docker exec -ti web_server bash -c 'update-alternatives --set php /usr/bin/php7.2'; then
    echo "Error: Failed to change php version"
    exit 1
fi

echo "Changing php version"

if ! docker exec -ti web_server bash -c 'composer self-update --1'; then
    echo "Error: Failed to update composer"
    exit 1
fi

echo "Updating composer"

if ! docker exec -ti web_server bash -c 'composer install'; then
    echo "Error: Failed to install composer"
    exit 1
fi

echo "Installing composer"