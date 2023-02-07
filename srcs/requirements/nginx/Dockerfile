FROM debian:buster

# Install nginx, openssl #
RUN apt update; apt install -y nginx; apt install -y openssl;

COPY conf/dhparam.pem /etc/nginx/

# Set nginx configuration #
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
COPY conf/default /home/default
COPY conf/self-signed.conf /etc/nginx/snippets/
COPY conf/ssl-params.conf /etc/nginx/snippets/


RUN mkdir /var/www/wordpress; chmod 777 /var/www/wordpress

# Expose port for access #
EXPOSE 443

# forward request and error logs to docker log collector #
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY tools/install.sh /home/install.sh
# A command from source sugested to start nginx on start-up of container #
CMD bash /home/install.sh
