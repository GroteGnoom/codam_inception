FROM debian:buster

#comment!
#curl and lsof are for debugging
RUN apt-get update && apt-get -y install wordpress && apt-get -y install php-fpm curl lsof
#check if php-fpm is running
RUN apt-get -y install libfcgi0ldbl
#edit wp config
RUN apt-get -y install vim
# to prevent ERROR: unable to bind listening socket for address '/run/php/php7.3-fpm.sock': No such file or directory (2)
#config is necessary to let it listen to the right port
COPY www.conf /etc/php/7.3/fpm/pool.d
COPY wp_conf.php /etc/wordpress/config-127.0.0.1.php
RUN mkdir /run/php

ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
