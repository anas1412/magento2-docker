#!/bin/bash
php bin/magento module:enable --all
chown -R www-data: /var/www/
chmod u+x bin/magento
update-alternatives --set php /usr/bin/php7.2
composer self-update --1
composer install
bin/magento setup:install --base-url=http://127.0.0.1/backend-magento --db-host=mysql_db --db-name=kamioun --db-user=magento2 --db-password=magento2 --admin-firstname=admin --admin-lastname=admin --admin-email=admin@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1
bin/magento cron:install

rm -rf var/cache/* var/page_cache/* var/generation/*
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
bin/magento cache:clean
php bin/magento cache:flush

find . -type f -exec chmod 644 {} \;            
find . -type d -exec chmod 755 {} \;        
chmod -Rf 777 var pub
chmod 777 ./app/etc
chmod 644 ./app/etc/*.xml
chmod -Rf 775 bin

#php bin/magento setup:store-config:set --base-url="http://backend-magento.magento.local"
#php bin/magento setup:store-config:set --base-url-secure="https://backend-magento.magento.local"

chown -R kamiounusr:kamiounusr .
bin/magento cache:clean

#supervisorctl stop deploy_magento && supervisorctl remove deploy_magento
echo "Magento Deployed"
