#!/bin/bash
set -x
chown -R www-data:www-data /var/www
chmod -R 755 /var/www/
mkdir -p /var/www/html
cp /tmp/wp-config.php /var/www/html/
cd /var/www/html/
while ! echo "SHOW DATABASES;" | mariadb -hmariadb -uboss -pbosspw; do sleep 1; done
wp core install --allow-root --url=${WP_URL} --admin_user=${WP_BOSS_LOGIN} --admin_password=${WP_BOSS_PASSWORD} --title=mywordpresssite --admin_email=pleasedonotemailme@hopefullydoesnotexist.example.com
wp user create justauser pleasedonotemailme2@hopefullydoesnotexist.example.com --allow-root --user_pass=userpw;
/usr/sbin/php-fpm7.3 --nodaemonize
