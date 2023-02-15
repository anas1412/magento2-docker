#!/bin/bash

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

echo "Please visit http://127.0.0.1/backend-magento to access your store"