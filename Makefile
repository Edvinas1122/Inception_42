FIRST_RUNNING_CONTAINER = $(shell docker ps | grep -Eo "[a-z0-9]{12}")
ALL_IMAGES = $(shell docker images -a -q;)
IMAGE_ID_PHP= $(shell docker container ls | grep srcs_php | cut -d" " -f1)
IMAGE_ID_DB=$(shell docker container ls | grep srcs_mariadb | cut -d" " -f1)
IMAGE_ID_NGINX=$(shell docker container ls | grep srcs_nginx | cut -d" " -f1)
SRC = srcs/docker-compose.yml
ENV_FILE = srcs/.env

all:
	docker-compose --env-file $(ENV_FILE) -f $(SRC) build

start:
	docker-compose -f $(SRC) up -d

stop:
	docker stop $(FIRST_RUNNING_CONTAINER)

delete_all:
	docker rmi -f $(ALL_IMAGES)

delete_volumes:
	docker-compose -f $(SRC) down --volumes
	docker volume prune
	rm -r /home/emomkus/data/wp/*
	rm -r /home/emomkus/data/db/*

# additional info
info:
	docker container ls

# shell environments
php_shell:
	docker exec -it $(IMAGE_ID_PHP) /bin/sh

db_shell:
	docker exec -it $(IMAGE_ID_DB) /bin/sh 

nginx_shell:
	docker exec -it $(IMAGE_ID_NGINX) /bin/sh 

# backup mariadb state feature
backup:
	docker exec -it $(IMAGE_ID_PHP) bash "backup.sh"

requisits:
	apt install docker
	spt install docker-compose

dirs:
	mkdir -p /home/emomkus/data/db
	mkdir -p /home/emomkus/data/wp

hack_network:
	echo $'\n127.0.0.1 emomkus.42.fr' >> /etc/hosts
