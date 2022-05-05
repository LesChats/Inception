######################################################################
# @author      : abaudot (aimebaudot@gmail.com)
# @file        : Makefile
# @created     : mardi avril 26, 2022 16:37:51 CEST
######################################################################

SRCS 			:= ./srcs
DOCKER			:= sudo docker
COMPOSE 		:= cd srcs/ && sudo docker-compose
DATA_PATH 		:= /home/${USER}/data

all		:	build
	sudo mkdir -p $(DATA_PATH)
	sudo mkdir -p $(DATA_PATH)/monitoring
	sudo mkdir -p $(DATA_PATH)/wordpress
	sudo mkdir -p $(DATA_PATH)/database
ifeq ("$(wildcard .ok)","")
	@ printf "[\033[0;32m+\033[m] Applying DNS redirection\n"
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 abaudot.42.fr" >> /etc/hosts
	touch .ok
endif
	$(COMPOSE) up -d

build	:
	$(COMPOSE) build

clean	:
	$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
	$(DOCKER) system prune --volumes --all --force
	sudo rm -rf $(DATA_PATH)
	$(DOCKER) network prune --force
	$(DOCKER) volume prune --force
	$(DOCKER) image prune --force

re: fclean
	make all
.PHONY	:	all
.PHONY	:	build
.PHONY	:	clean
.PHONY	:	fclean
.PHONY	:	re
