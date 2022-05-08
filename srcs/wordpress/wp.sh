#!/bin/bash
set -x
if [ ! -f "/var/www/html/index.php" ]; then 
	cd /var/www/html/
	#you could do the core download in the building process, but this is more flexible, because now you can remove the volume
	#wp core download doesn't seem to just download. it also sets some config which makes the current folder the wordpress root folder. Very confusing :(
	wp core download --allow-root;
	while ! echo "SHOW DATABASES;" | mariadb -hmariadb -uboss -p${WP_BOSS_PASSWORD}; do sleep 1; done
	wp config create --dbname=WP --dbuser=boss --dbpass=${WP_BOSS_PASSWORD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root 
	wp core install --allow-root --url=${WP_URL} --admin_user=${WP_BOSS_LOGIN} --admin_password=${WP_BOSS_PASSWORD} --title=mywordpresssite --admin_email=pleasedonotemailme@hopefullydoesnotexist.example.com
	wp user create justauser pleasedonotemailme2@hopefullydoesnotexist.example.com --allow-root --user_pass=userpw;
fi
/usr/sbin/php-fpm7.3 --nodaemonize
