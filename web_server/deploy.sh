#!/bin/bash

chown -R www-data: /var/www/
chmod u+x bin/magento
update-alternatives --set php /usr/bin/php7.2
composer self-update --1
composer install --ignore-platform-reqs
php bin/magento setup:config:set --db-host "mysql_db" --db-user="magento2" --db-password="$MYSQL_ROOT_PASSWORD" --db-name="$MYSQL_DATABASE"
#php bin/magento setup:config:set --db-host "mysql_db" --db-user="magento2" --db-password="magento2" --db-name="kamioun"
echo "Magento Installed"

rm -rf var/cache/* var/page_cache/* var/generation/*
bin/magento setup:upgrade
bin/magento setup:di:compile
bin/magento cache:clean
php bin/magento cache:flush
php bin/magento setup:static-content:deploy -f
chown -R kamiounusr:kamiounusr .
#mysql -u "magento2" -p"magento2" kamioun -e "UPDATE core_config_data SET value = 'http://127.0.0.1/backend-magento/' WHERE path = 'web/secure/base_url';"
#mysql -u "magento2" -p"magento2" kamioun -e "UPDATE core_config_data SET value = 'http://127.0.0.1/backend-magento/' WHERE path = 'web/unsecure/base_url';"
bin/magento cache:clean
#supervisorctl stop deploy_magento && supervisorctl remove deploy_magento
echo "Magento Deployed"
