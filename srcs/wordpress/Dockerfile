FROM debian:buster

#comment!
RUN apt-get update && apt-get -y install wordpress && apt-get -y install php-fpm
# to prevent ERROR: unable to bind listening socket for address '/run/php/php7.3-fpm.sock': No such file or directory (2)
RUN mkdir /run/php
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
