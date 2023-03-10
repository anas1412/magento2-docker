#!/bin/bash

# Make scripts executable
#a+x /scripts/*

# Define menu options
options=("Install Docker & Docker Compose"
         "Run docker and apply database and Magento Store"
         "Upgrade and deploy magento store"
         "Set URL"
         "Run Docker Compose"
         "Stop Docker Compose"
         "Remove Persistent Files"
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

            if [ $? -ne 0 ]; then
            echo "Error: Failed to update packages."
            exit 1
            fi

            echo "//Installing Docker//"
            apt install docker.io docker-compose -y

            if [ $? -ne 0 ]; then
            echo "Error: Failed to install docker.io and docker-compose."
            exit 1
            fi

            echo "//Docker installed//"
            ;;
        2)
            #echo "//Downloading Database//"

            #chmod a+x ./scripts/download_db.sh && ./scripts/download_db.sh

            #if [ $? -ne 0 ]; then
            #echo "Error: Failed to execute download_db.sh script."
            #exit 1
            #fi

            echo "//Run Docker Compose//"
            docker-compose up -d

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute docker-compose command."
            exit 1
            fi

            echo "//use docker ps to check if containers are running//"
            echo "//Install Database//"
            chmod a+x ./scripts/install_db.sh && ./scripts/install_db.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute install_db.sh script."
            exit 1
            fi

            echo "//Installing composer and necessary dependencies//"
            chmod a+x ./scripts/install_composer.sh && ./scripts/install_composer.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute install_composer.sh script."
            exit 1
            fi

            echo "//Installing magento store//"
            chmod a+x ./scripts/install_magento.sh && ./scripts/install_magento.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute install_magento.sh script."
            exit 1
            fi

            echo "//Cleaning cache//"
            chmod a+x ./scripts/clean_cache.sh && ./scripts/clean_cache.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute clean_cache.sh script."
            exit 1
            fi

            echo "//Setting permissions//"
            chmod a+x ./scripts/set_permissions.sh && ./scripts/set_permissions.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute set_permissions.sh script."
            exit 1
            fi

            echo "//Setting URL//"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute set_url.sh script."
            exit 1
            fi

            echo "Admin Dashboard is in:"
            grep -o "admin_.*" ./backend-magento/app/etc/env.php | sed "s/'//g"
            echo "Admin user: admin"
            echo "Admin password: admin123"
            ;;
        3)  
            echo "//Run Docker Compose//"
            docker-compose up -d

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute docker-compose command."
            exit 1
            fi

            echo "//use docker ps to check if containers are running//"
            echo "//Installing composer and necessary dependencies//"
            chmod a+x ./scripts/install_composer.sh && ./scripts/install_composer.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute install_composer.sh script."
            exit 1
            fi

            echo "//Upgrading and deploying magento store//"
            chmod a+x ./scripts/upgrade_magento.sh && ./scripts/upgrade_magento.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute upgrade_magento.sh script."
            exit 1
            fi

            echo "//Cleaning cache//"
            chmod a+x ./scripts/clean_cache.sh && ./scripts/clean_cache.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute clean_cache.sh script."
            exit 1
            fi

            echo "//Setting permissions//"
            chmod a+x ./scripts/set_permissions.sh && ./scripts/set_permissions.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute set_permissions.sh script."
            exit 1
            fi

            echo "//Setting URL//"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute set_url.sh script."
            exit 1
            fi

            echo "//Visit your magento url at: http://127.0.0.1/backend-magento/ //"

            echo "Admin Dashboard is in:"
            grep -o "admin_.*" ./backend-magento/app/etc/env.php | sed "s/'//g"
            echo "Admin user: admin"
            echo "Admin password: admin123"
            ;;
        4)
            echo "//Setting URL//"
            chmod a+x ./scripts/set_url.sh && ./scripts/set_url.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute set_url.sh script."
            exit 1
            fi

            echo "//Visit your magento admin dashboard at: http://127.0.0.1/backend-magento/ //"

            echo "Admin Dashboard is in:"
            grep -o "admin_.*" ./backend-magento/app/etc/env.php | sed "s/'//g"
            echo "Admin user: admin"
            echo "Admin password: admin123"
            ;;
        5)
            echo "//Run Docker Compose//"
            docker-compose up -d

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute docker-compose command."
            exit 1
            fi

            echo "//use docker ps to check if containers are running//"
            ;;
        6)
            echo "//Stop Docker Compose//"
            docker-compose down

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute docker-compose command."
            exit 1
            fi

            ;;
        7)
            chmod a+x ./scripts/remove.sh && ./scripts/remove.sh

            if [ $? -ne 0 ]; then
            echo "Error: Failed to execute remove.sh script."
            exit 1
            fi
            ;;
        8)
            echo "//Exiting//"
            exit 0
            ;;
        *)
            echo "//Invalid option//"
            ;;
    esac
done