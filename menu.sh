#!/bin/bash

# Make scripts executable
#sudo a+x /scripts/*

# Define menu options
options=("Install Database" 
         "Install composer and necessary dependencies"
         "Install magento store"
         "Upgrade and deploy magento store"
         "Clean cache"
         "Set permissions"
         "Set URL"
         "Exit")

# Loop to display menu and process user input
while true; do
    echo "Welcome to Magento Kamioun Installation Script"
    echo "Select an option:"
    # Display menu options
    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[$i]}"
    done
    # Read user input
    read -r choice
    case $choice in
        1)
            echo "Installing Database"
            chmod a+x ./scripts/install_db.sh && ./scripts/install_db.sh
            ;;
        2)
            echo "Installing composer and necessary dependencies"
            chmod a+x ./scripts/install_composer.sh && ./scripts/install_composer.sh
            ;;
        3)
            echo "Installing magento store"
            chmod a+x ./scripts/install_magento.sh && ./scripts/install_magento.sh
            ;;
        4)
            echo "Upgrading and deploying magento store"
            chmod a+x ./scripts/upgrade_magento.sh && ./scripts/upgrade_magento.sh
            ;;
        5)
            echo "Cleaning cache"
            chmod a+x ./scripts/clean_cache.sh && ./scripts/clean_cache.sh
            ;;
        6)
            echo "Setting permissions"
            chmod a+x ./scripts/set_permissions.sh && ./scripts/set_permissions.sh
            ;;
        7)
            echo "Setting URL"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh
            ;;
        8)
            echo "Exiting"
            exit 0
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
