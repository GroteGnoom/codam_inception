--this site: https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/ also covers this part
CREATE DATABASE IF NOT EXISTS WP;
--DROP USER IF EXISTS 'justauser'
--TODO use environment
CREATE USER 'justauser' IDENTIFIED BY 'userpw';
--TODO use environment
CREATE USER 'boss'@'%' IDENTIFIED BY 'bosspw';
--https://stackoverflow.com/questions/1559955/host-xxx-xx-xxx-xxx-is-not-allowed-to-connect-to-this-mysql-server
GRANT ALL PRIVILEGES ON *.* TO 'justauser'@'%' WITH GRANT OPTION; --probably don't want to give this one all privileges
GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
