#!/bin/bash

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