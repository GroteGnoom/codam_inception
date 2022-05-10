SHELL := /bin/bash

all:
	# without --build it just runs it, but doesn't do the
	# latest additions to the Dockerfile
	echo "127.0.0.1 dnoom.42.fr" > /etc/hosts
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

kill:
	docker-compose -f srcs/docker-compose.yml kill

rmv:
	docker volume rm $(docker volume ls -q) || true

purge:
	yes | docker system prune -a 


re: kill all
renovolume: kill rmv all
recomplete: kill purge rmv all
