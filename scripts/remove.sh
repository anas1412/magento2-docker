#!/bin/bash

read -p "Are you sure you want to remove the persistent files? (y/n) " CONFIRM

if [ "$CONFIRM" == "y" ]; then
    rm -rf mysql kamioun.sql
    echo "Deleted mysql and kamioun.sql"
else
    echo "Aborted"
    exit 1
fi