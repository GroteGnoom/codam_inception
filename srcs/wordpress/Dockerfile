FROM debian:buster

#comment!
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
#wp core download doesn't seem to just download. it also sets some config which makes the current folder the wordpress root folder. Very confusing :(
RUN cd /var/www/html && wp core download --allow-root;
COPY wp-config.php /tmp/
#RUN wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
#RUN wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
#


#https://www.inmotionhosting.com/support/edu/wordpress/install-wordpress-debian-10/
#I thought that was everything, but it ends with '.....and now you need to go through the wordpress install process..... so that's why you need wp-cli
#RUN wget http://wordpress.org/latest.tar.gz
#RUN tar xfz latest.tar.gz
#RUN mkdir -p /var/www/html/
#RUN mv wordpress/* /var/www/html/
#RUN rm latest.tar.gz
#
#COPY wp_conf.php /var/www/wp-config.php


#ENTRYPOINT ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
COPY wp.sh /tmp/
ENTRYPOINT /tmp/wp.sh
