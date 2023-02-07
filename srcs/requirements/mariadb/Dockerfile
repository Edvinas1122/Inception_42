FROM debian:buster

RUN apt update; apt install -y mariadb-server;

# create dirrectories
RUN mkdir -p /data
RUN mkdir -p /var/run/mysqld/

# add configurations
COPY conf/my.cnf /etc/mysql/mariadb.cnf
COPY conf/init.sql /home/init.sql
COPY tools/install.sh /home/install.sh

CMD bash /home/install.sh