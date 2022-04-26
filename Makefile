all:
	# without --build it jusr runs it, but doesn't do the
	# latest additions to the Dockerfile
	docker-compose -f srcs/docker-compose.yml up --build
