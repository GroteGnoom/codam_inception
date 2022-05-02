FROM debian:buster

#comment!
RUN apt-get update && apt-get -y install mariadb-server
#RUN service mysql status > /tmp/before
ARG CACHE_BREAK=bla
RUN service mysql restart
#RUN service mysql status > /tmp/after
#RUN mariadb
CMD ["mysqld"]
#CMD ["mariadb"]
