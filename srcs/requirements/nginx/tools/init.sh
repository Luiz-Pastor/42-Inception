#!/bin/bash

# Generate the certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/key.pem \
    -out /etc/nginx/certs/cert.pem \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=TECHNOLOGY/CN=${PAGE_DOMAIN}"

# Put the domain on the nginx config file
sed -i 's/<DOMAIN>/'$PAGE_DOMAIN'/g' /etc/nginx/nginx.conf

# Execute the nginx daemon
exec nginx -g "daemon off;"
