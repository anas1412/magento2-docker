#!/bin/bash

chown -R www-data: /var/www/
chmod u+x bin/magento
update-alternatives --set php /usr/bin/php7.2
composer self-update --1
composer install --ignore-platform-reqs
sudo -u www-data bin/magento setup:install --base-url=http://127.0.0.1/backend-magento --db-host=mysql_db --db-name=kamioun --db-user=magento2 --db-password=magento2 --admin-firstname=admin --admin-lastname=admin --admin-email=admin@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1

echo "Magento Installed"
bin/magento cron:install
#ADD CRON TO WEB SERVER
rm -rf var/cache/* var/page_cache/* var/generation/*
bin/magento setup:upgrade
bin/magento setup:di:compile
bin/magento cache:clean
php bin/magento cache:flush
php bin/magento setup:static-content:deploy -f

php bin/magento setup:store-config:set --base-url="http://backend-magento.magento.local"
php bin/magento setup:store-config:set --base-url-secure="https://backend-magento.magento.local"

chown -R kamiounusr:kamiounusr .
#mysql -u "magento2" -p"magento2" kamioun -e "UPDATE core_config_data SET value = 'http://127.0.0.1/backend-magento/' WHERE path = 'web/secure/base_url';"
#mysql -u "magento2" -p"magento2" kamioun -e "UPDATE core_config_data SET value = 'http://127.0.0.1/backend-magento/' WHERE path = 'web/unsecure/base_url';"
bin/magento cache:clean
#supervisorctl stop deploy_magento && supervisorctl remove deploy_magento
echo "Magento Deployed"
