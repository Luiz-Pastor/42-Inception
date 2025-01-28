FROM	debian:bullseye

# Update the utils installed
RUN		apt update && apt upgrade -y

# Install all the necessary utils
RUN		apt install -y	\
			nginx \
			openssl \
			curl

# Add the nginx config
RUN     sed -i "s/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/" /etc/nginx/nginx.conf
COPY	conf/wordpress_connection.conf /etc/nginx/conf.d/wordpress_connection.conf

# Create the file about fastcgi data
RUN 	touch /etc/nginx/fastcgi_params

# Copy the scripts
RUN		mkdir -p /tools
COPY	tools/init.sh /tools

ENTRYPOINT ["bash", "/tools/init.sh"]
