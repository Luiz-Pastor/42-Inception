FROM	debian:bullseye

# Update the utils installed
RUN		apt update && apt upgrade -y

# Install all the necessary utils
RUN		apt install -y	\
			mariadb-server

# Copy the scripts
RUN		mkdir -p /tools && chmod 777 /tools

COPY	tools/configure_mariadb.sh /tools
RUN		bash /tools/configure_mariadb.sh

COPY	tools/init.sh /tools

# Copy the config
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT	["sleep", "infinity"]