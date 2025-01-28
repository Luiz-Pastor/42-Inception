#!/bin/bash

# Create the folder where the generated certs are saved
mkdir -p $CERTS_PATH

# Generate the certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $CERTS_PATH/key.pem \
    -out $CERTS_PATH/cert.pem \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=TECHNOLOGY/CN=${PAGE_DOMAIN}"

# Put the domain on the nginx config file
sed -i 's/<DOMAIN>/'$PAGE_DOMAIN'/g' /etc/nginx/conf.d/wordpress_connection.conf
sed -i "s|<CERTIFICATE_PATH>|$CERTS_PATH|g" /etc/nginx/conf.d/wordpress_connection.conf

# Execute the nginx daemon
exec nginx -g "daemon off;"
