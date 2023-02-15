#!/bin/bash

echo "Checking Database"

if [ ! -f "../kamioun.sql" ]; then
    echo "Error: File kamioun.sql not found"
    echo "Please make sure that a database exist in current directory"
    exit 1
fi

echo "Database exist!"

echo "Applying Database"

if ! docker exec -ti mysql_db bash -c 'mysql -u root -p"magento2" kamioun < /var/lib/kamioun.sql'; then
    echo "Error: Failed to access mysql container to apply database"
    exit 1
fi
echo "Database applied!"