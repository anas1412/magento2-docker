#!/bin/bash

echo "Checking Database"

if [ ! -f "kamioun.sql" ]; then
    echo "Error: File kamioun.sql not found"
    echo "Please make sure that a database exist in current directory"
    exit 1
fi

echo "Database exist!"

echo "Applying Database"

#if docker exec -ti mysql_db bash -c "$(du -m /var/lib/kamioun.sql | awk '{print $1}') -lt 10" ; then
    #if ! docker exec -ti mysql_db bash -c 'mysql -u root -p"magento2" kamioun < /var/lib/kamioun.sql'; then
    #    echo "Error: Failed to access mysql container to apply database"
    #    exit 1
    #fi
    #echo "Database applied!"
    #else
        #echo "Database already applied!"
#fi

echo "Checking Backend Magento Folder"

if [ ! -d "backend-magento" ]; then
    echo "Error: Directory backend-magento not found"
    echo "Please make sure that a backend-magento folder exist in current directory"
    exit 1
fi

echo "Backend Magento Folder exist!"

echo "Installing Magento Store"

#if ! docker exec -ti web_server bash -c 'php bin/magento module:enable --all'; then
#    echo "Error: Failed to enable modules"
#    exit 1
#fi

echo "Enabling Modules"

#if ! docker exec -ti web_server bash -c 'chown -R www-data: /var/www/'; then
 #   echo "Error: Failed to change owner of /var/www/"
#    exit 1
#fi

echo "Changing owner of /var/www/"

if ! docker exec -ti web_server bash -c 'chmod u+x bin/magento'; then
    echo "Error: Failed to change permissions of bin/magento"
    exit 1
fi

echo "Changing permissions of bin/magento"

if ! docker exec -ti web_server bash -c 'update-alternatives --set php /usr/bin/php7.2'; then
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

if ! docker exec -ti web_server bash -c 'bin/magento setup:install --base-url=http://127.0.0.1/backend-magento --db-host=mysql_db --db-name=kamioun --db-user=magento2 --db-password=magento2 --admin-firstname=admin --admin-lastname=admin --admin-email=admin@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1'
then
    echo "Error: Failed to install magento"
    exit 1
fi

echo "Installing magento"

#if ! docker exec -ti web_server bash -c 'bin/magento cron:install'; then
#    echo "Error: Failed to install cron"
#    exit 1
#fi

echo "Installing cron"

if ! docker exec -ti web_server bash -c 'rm -rf var/cache/* var/page_cache/* var/generation/*'; then
    echo "Error: Failed to remove cache"
    exit 1
fi

echo "Removing cache"

if ! docker exec -ti web_server bash -c 'php bin/magento setup:upgrade'; then
    echo "Error: Failed to upgrade magento"
    exit 1
fi

echo "Upgrading magento"

if ! docker exec -ti web_server bash -c 'php bin/magento setup:di:compile'; then
    echo "Error: Failed to compile magento"
    exit 1
fi

echo "Compiling magento"

if ! docker exec -ti web_server bash -c 'php bin/magento setup:static-content:deploy -f'; then
    echo "Error: Failed to deploy static content"
    exit 1
fi

echo "Deploying static content"

if ! docker exec -ti web_server bash -c 'bin/magento cache:clean'; then
    echo "Error: Failed to clean cache"
    exit 1
fi

echo "Cleaning cache"

if ! docker exec -ti web_server bash -c 'bin/magento cache:flush'; then
    echo "Error: Failed to flush cache"
    exit 1
fi

echo "Flushing cache"

echo "Magento Store Installed!"

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

echo "Permissions changed!"

#if ! docker exec -ti web_server bash -c 'chown -R kamiounusr:kamiounusr .'; then
#    echo "Error: Failed to change owner of /var/www/"
#    exit 1
#fi

echo "Changing owner of /var/www/"

if ! docker exec -ti web_server bash -c 'bin/magento cache:clean'; then
    echo "Error: Failed to clean cache"
    exit 1
fi

echo "Cleaning cache"

if ! docker exec -ti web_server bash -c 'bin/magento cache:flush'; then
    echo "Error: Failed to flush cache"
    exit 1
fi

echo "Flushing cache"

#if ! docker exec -ti web_server bash -c 'bin/magento setup:store-config:set --base-url="http://backend-magento.magento.local"'; then
#    echo "Error: Failed to set base url"
#    exit 1
#fi

#echo "Setting base url"

#if ! docker exec -ti web_server bash -c 'bin/magento setup:store-config:set --base-url-secure="https://backend-magento.magento.local"'; then
#    echo "Error: Failed to set base url secure"
#    exit 1
#fi

#echo "Setting base url secure"

echo "Magento Store Installed!"

echo "Please visit http://127.0.0.1/backend-magento to access your store"



