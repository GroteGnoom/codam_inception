SHELL := /bin/bash

all:
	# without --build it just runs it, but doesn't do the
	# latest additions to the Dockerfile
	docker-compose -f srcs/docker-compose.yml up --build
