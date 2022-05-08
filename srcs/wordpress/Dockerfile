FROM debian:buster

#curl and lsof are for debugging
#libfcgi0ldbl to check if php-fpm is running
#vim to edit wp config
#everybody thinks you should not use apt to install wordpress
#mariadb to check if it can connect
RUN apt-get update && apt-get -y install php-fpm php-mysql curl lsof libfcgi0ldbl vim wget mariadb-client 
#it actually complained about sendmail, I don't know why it cares about emails so much. Maybe it was just a warning
RUN apt-get -y install sendmail
# to prevent ERROR: unable to bind listening socket for address '/run/php/php7.3-fpm.sock': No such file or directory (2)
#config is necessary to let it listen to the right port
COPY www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir /run/php

#https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/
#get the wp command line interface
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/
RUN mkdir -p /var/www/html

COPY wp.sh /tmp/
#Rest needs to be done in a script, because it requires the mariadb container to run
ENTRYPOINT /tmp/wp.sh
