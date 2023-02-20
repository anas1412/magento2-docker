#!/bin/bash

# Make scripts executable
#sudo a+x /scripts/*

# Define menu options
options=("Install Docker & Docker Compose"
         "Download Magento Backend and Database, run docker and apply database and Magento Store"
         "Upgrade and deploy magento store"
         "Set URL"
         "Run Docker Compose"
         "Stop Docker Compose"
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
            echo "//Updating packages//"
            apt update -y
            echo "//Installing Docker//"
            apt install docker.io docker-compose -y
            echo "//Docker installed//"
            ;;
        2)
            echo "//Downloading Magento Backend and Database//"
            chmod a+x ./scripts/download_magento.sh && ./scripts/download_magento.sh
            chmod a+x ./scripts/download_db.sh && ./scripts/download_db.sh
            echo "//Run Docker Compose//"
            docker-compose up -d
            echo "//use docker ps to check if containers are running//"
            echo "//Install Database//"
            chmod a+x ./scripts/install_db.sh && ./scripts/install_db.sh
            echo "//Installing composer and necessary dependencies//"
            chmod a+x ./scripts/install_composer.sh && ./scripts/install_composer.sh
            echo "//Installing magento store//"
            chmod a+x ./scripts/install_magento.sh && ./scripts/install_magento.sh
            echo "//Cleaning cache//"
            chmod a+x ./scripts/clean_cache.sh && ./scripts/clean_cache.sh
            echo "//Setting permissions//"
            chmod a+x ./scripts/set_permissions.sh && ./scripts/set_permissions.sh
            echo "//Setting URL//"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh
            echo "//Visit your magento admin dashboard at: http://127.0.0.1/backend-magento/ //"
            ;;
        3)  
            echo "//Run Docker Compose//"
            docker-compose up -d
            echo "//use docker ps to check if containers are running//"
            echo "//Installing composer and necessary dependencies//"
            chmod a+x ./scripts/install_composer.sh && ./scripts/install_composer.sh
            echo "//Upgrading and deploying magento store//"
            chmod a+x ./scripts/upgrade_magento.sh && ./scripts/upgrade_magento.sh
            echo "//Cleaning cache//"
            chmod a+x ./scripts/clean_cache.sh && ./scripts/clean_cache.sh
            echo "//Setting permissions//"
            chmod a+x ./scripts/set_permissions.sh && ./scripts/set_permissions.sh
            echo "//Setting URL//"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh
            echo "//Visit your magento admin dashboard at: http://127.0.0.1/backend-magento/ //"
            ;;
        4)
            echo "//Setting URL//"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh
            echo "//Visit your magento admin dashboard at: http://127.0.0.1/backend-magento/ //"
            ;;
        5)
            echo "//Run Docker Compose//"
            docker-compose up -d
            echo "//use docker ps to check if containers are running//"
            ;;
        6)
            echo "//Stop Docker Compose//"
            docker-compose down
            ;;
        7)
            echo "//Exiting//"
            exit 0
            ;;
        *)
            echo "//Invalid option//"
            ;;
    esac
done