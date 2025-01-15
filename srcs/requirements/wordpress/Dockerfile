FROM	debian:bullseye

# Update the utils installed
RUN		apt update && apt upgrade -y

# Install all the necessary utils
RUN		apt install -y	\
			wget \
			php7.4-fpm \
			php7.4-mysql
			# php7.4 \

CMD		["sleep", "infinity"]