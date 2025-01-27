#!/bin/bash

# Create the config file with the env variables
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DB' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );/g" /var/www/html/wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '$MYSQL_HOST_NAME:$MYSQL_HOST_PORT' );/g" /var/www/html/wp-config.php

# Check the connection to the database
echo "Checking the connection with the database"
while true; do
	if mysql -h"$MYSQL_HOST_NAME" -u"$MYSQL_USER" -p$MYSQL_PASSWORD -e "SHOW DATABASES;" >/dev/null 2>/dev/null; then
		break
	fi
	sleep 1
done
echo "Connection confirmed!"

# Execute the php controller
php-fpm7.4 -F
