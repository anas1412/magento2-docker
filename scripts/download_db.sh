#!/bin/bash

echo "//Downloading Database//"

# Get today's date in YYYY-MM-DD format
TODAY=$(date +%F)

# Build the filename using today's date
FILENAME="kamioun_prod_${TODAY}.sql"

echo "//Downloading ${FILENAME} from backoffice-staging.kamioun.com//"

# Set the password
PASSWORD=thisissparta

# Install the expect package
apt install sshpass expect -y

if sshpass -p "thisissparta" scp kamiounusr@backoffice-staging.kamioun.com:kamioun_prod_2023-02-20.sql . ; then
    echo "File transfer successful"
else
    echo "File transfer failed"
    exit 1
 fi



# Rename the file to kamioun.sql

if mv ./kamioun*.sql ./kamioun.sql ; then
    echo "Renaming successful"
else
    echo "Renaming failed"
    exit 1
fi

echo "Database downloaded!"