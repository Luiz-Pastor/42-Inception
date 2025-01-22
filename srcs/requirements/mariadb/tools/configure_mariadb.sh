#!/bin/bash

# Create the folder to the execution temporal files
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

# Create the folder where the data will be saved
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
