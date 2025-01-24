#!/bin/bash

# Create the folder to the execution temporal files
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chmod -R 755 /var/run/mysqld

# Create the folder where the data will be saved
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
chmod -R 750 /var/lib/mysql

# Create the logs folder
mkdir -p /var/log/mysql
chown -R mysql:mysql /var/log/mysql
chmod -R 750 /var/log/mysql
