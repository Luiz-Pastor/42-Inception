FROM	debian:bullseye

# Update the utils installed
RUN		apt update && apt upgrade -y

# Install all the necessary utils
RUN		apt install -y	\
			wget \
			php7.4-fpm \
			php7.4-mysql

# Dir to save used scripts
RUN		mkdir -p /tools && chmod 777 /tools

COPY	tools/download_wordpress.sh /tools
RUN		bash /tools/download_wordpress.sh

COPY	tools/init.sh /tools

# Save the php7.4-fpm config
COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/

ENTRYPOINT		["bash", "tools/init.sh"]