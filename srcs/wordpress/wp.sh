set -x
mkdir -p /var/www/html
cp /tmp/wp-config.php /var/www/html/
cd /var/www/html/
wp core install --allow-root --url=${WP_URL} --admin_user=${WP_BOSS_LOGIN} --admin_password=${WP_BOSS_PASSWORD} 
wp user create --allow-root ${WP_USER_LOGIN} --user_pass=${WP_USER_PASSWORD};
