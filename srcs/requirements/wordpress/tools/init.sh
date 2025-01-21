#!/bin/bash

# Create the config file with the env variables
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DB' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '$MYSQL_HOST' );/g" /var/www/html/wp-config.php

sleep infinity