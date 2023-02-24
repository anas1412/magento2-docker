#!/bin/bash

echo "Checking Existing Magento Backend"

if [ -d "backend-magento" ]; then
    echo "Folder exists"
    echo "Deleting Existing Magento Backend"
    sudo rm -rf backend-magento
    echo "Existing Magento Backend Deleted"
fi

echo "Downloading Magento Backend"

# Download the Magento Backend from GitLab

git clone git@gitlab.com:kamioun/internal/backend-magento.git || exit 1
echo "Magento Backend Downloaded"



