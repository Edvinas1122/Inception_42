FROM debian:buster

# install php and wordpress
RUN apt update; apt install -y php php-mysqli php-fpm;
RUN apt install -y unzip curl mariadb-client;

# create dir for mounted volume
RUN mkdir -p /var/www/html/inside; chmod 777 /var/www/html/inside

# php requirament
RUN mkdir -p /run/php/


# php smart install
COPY tools/install.sh /install.sh
COPY conf/www.conf /home/www.conf

# backup & restore features
COPY tools/backup.sh /backup.sh
COPY tools/backup.sql /backup.sql

# install wordpress
RUN curl -o /var/www/latest.zip https://wordpress.org/latest.zip
RUN unzip /var/www/latest.zip -d /var/www/

# install WP-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# 	# grant permissions to php / wp
RUN chown  -R www-data:www-data /var/www/wordpress

CMD bash install.sh

