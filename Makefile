# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rmarceau <rmarceau@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/10 12:05:54 by rmarceau          #+#    #+#              #
#    Updated: 2024/02/12 11:04:27 by rmarceau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DC = docker compose
# USER = rmarceau
PDIR = ./srcs/docker-compose.yml

all: up

install:
	@sudo sh ./srcs/requirements/tools/init_docker.sh 
	@sudo sh ./srcs/requirements/tools/init_domain.sh

build: volumes
	@$(DC) -f $(PDIR) build

up: build
	@$(DC) -f $(PDIR) up -d
	
start:
	@$(DC) -f $(PDIR) start

down: stop
	@$(DC) -f $(PDIR) down

stop:
	@$(DC) -f $(PDIR) stop

status:
	@$(DC) -f $(PDIR) ps
	
volumes:
	@sudo mkdir -p /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	@sudo chown -R $(USER) /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	@sudo chmod -R 777 /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	
clean: down stop
	@$(DC) -f $(PDIR) rm -f
	@docker system prune -af --volumes
	@sudo rm -rf /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	@docker volume rm $(shell docker volume ls -q)

re: clean all

.PHONY: all install build up start down stop status volumes clean re