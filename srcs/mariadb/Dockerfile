FROM debian:buster

#comment!
RUN apt-get update && apt-get -y install mariadb-server
#RUN service mysql status > /tmp/before
#ARG CACHE_BREAK=bli
#ARG test=$WP_USER_PASSWORD
#ENV banaan $WP_USER_PASSWORD
COPY wpdbscript.sql /tmp/
COPY wpdbscript /tmp/
#RUN echo $WP_USER_PASSWORD > /tmp/pwtest1
#RUN ["/tmp/wpdbscript"]
#RUN bash -c "env > tmp/envtest2"
#RUN env > /tmp/envtest3
ENTRYPOINT ["sh", "/tmp/wpdbscript"]
#RUN ["bash", "-c", "/tmp/wpdbscript"]
#ENTRYPOINT bash
#CMD env > /tmp/envtest2
#ENTRYPOINT ["bash", "/tmp/wpdbscript"]
#after the restart, a single command works, or I can do it all in one go with &&
##RUN service mysql restart && mysql < /tmp/wpdbscript.sql
#RUN service mysql status > /tmp/after
#RUN mariadb
##CMD ["mysqld"]
#CMD ["mariadb"]
