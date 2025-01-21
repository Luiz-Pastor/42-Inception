#!/bin/bash

# Download all the wordpress files, and save it correctly
wget http://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz

mkdir -p /var/www/html/
mv wordpress/* /var/www/html/
rm -rf latest.tar.gz wordpress/

chown -R www-data:www-data /var/www/html/
chmod -R 777 /var/www/html
