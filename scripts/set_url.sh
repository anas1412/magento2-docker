#!/bin/bash

if ! docker exec -ti mysql_db bash -c 'mysql -u "root" -p"magento2" kamioun -e "UPDATE core_config_data SET value = '\''http://127.0.0.1/backend-magento/'\'' WHERE path = '\''web/unsecure/base_url'\''";'; then
    echo "Error: Failed to set base url"
    exit 1
fi

echo "Setting base url"

if ! docker exec -ti mysql_db bash -c 'mysql -u "root" -p"magento2" kamioun -e "UPDATE core_config_data SET value = '\''http://127.0.0.1/backend-magento/'\'' WHERE path = '\''web/secure/base_url'\''";'; then
    echo "Error: Failed to set base url"
    exit 1
fi

echo "Setting base url secure"

echo "Please visit http://127.0.0.1/backend-magento to access your store"