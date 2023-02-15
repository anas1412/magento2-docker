#!/bin/bash

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