#!/bin/bash

# Detect if data was saved before
if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Data not found, creating the database..."
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
else
	echo "Data detected, ommited the database creation..."
fi

# Start mariadb temporarily to configure the organization
mysqld_safe --skip-networking &
while ! mysqladmin ping --silent; do
	sleep 1
done

if [ ! -f "/var/lib/mysql/.db_initialized" ]; then
	echo "Configuring the database..."
	mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

	mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB\`;
GRANT ALL PRIVILEGES ON \`$MYSQL_DB\`.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOF

	touch /var/lib/mysql/.db_initialized
else
	echo "Provided database applied..."
fi

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

echo "Initializing mariadb!"
exec mysqld