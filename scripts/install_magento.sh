#!/bin/bash

if ! docker exec -ti web_server bash -c 'bin/magento setup:install --base-url=http://127.0.0.1/backend-magento --db-host=mysql_db --db-name=kamioun --db-user=magento2 --db-password=magento2 --admin-firstname=admin --admin-lastname=admin --admin-email=admin@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1'
then
    echo "Error: Failed to install magento"
    exit 1
fi

echo "Installing magento"

if ! docker exec -ti web_server bash -c 'chown -R www-data: /var/www/'; then
    echo "Error: Failed to change owner of /var/www/"
    exit 1
fi

echo "Changing owner of /var/www/"

#if ! docker exec -ti web_server bash -c 'bin/magento cron:install'; then
#    echo "Error: Failed to install cron"
#    exit 1
#fi

#echo "Installing cron"