SHELL := /bin/bash

all:
	# without --build it just runs it, but doesn't do the
	# latest additions to the Dockerfile
	mkdir -p /home/dnoom/data/db
	mkdir -p /home/dnoom/data/wp
	chown -R root:root /home/dnoom
	chown -R root:root /home/dnoom
	echo "127.0.0.1 dnoom.42.fr" > /etc/hosts
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

kill:
	docker-compose -f srcs/docker-compose.yml kill

rmv:
	docker volume rm $$(docker volume ls -q) || true
	rm -rf /home/dnoom/data/wp/*
	rm -rf /home/dnoom/data/db/*

purge:
	yes | docker system prune -a 
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) 2>/dev/null || true

re: kill all
renovolume: kill rmv all
recomplete: kill purge rmv all
