<?php

define( 'DB_NAME', 'WP' );
/*define( 'DB_USER', 'justauser' );*/
/*define( 'DB_PASSWORD', 'userpw' );*/ /*TODO take from envirnonment*/
define( 'DB_USER', 'boss' );
define( 'DB_PASSWORD', 'bosspw' ); /*TODO take from envirnonment*/
define( 'DB_HOST', 'mariadb' );
define( 'WP_DEBUG', true); /*TODO remove */
define( 'WP_DEBUG_LOG', true ); /*TODO remove */

define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'a' );
define( 'SECURE_AUTH_KEY',  'b' );
define( 'LOGGED_IN_KEY',    'c' );
define( 'NONCE_KEY',        'd' );
define( 'AUTH_SALT',        'e' );
define( 'SECURE_AUTH_SALT', 'f' );
define( 'LOGGED_IN_SALT',   'g' );
define( 'NONCE_SALT',       'h' );

/*https://gist.github.com/franz-josef-kaiser/4063197*/
define( 'DS',                   DIRECTORY_SEPARATOR );
error_reporting( 
	  E_ALL | E_STRICT | E_CORE_ERROR | E_CORE_WARNING 
	    | E_COMPILE_ERROR | E_ERROR | E_WARNING | E_PARSE 
		  | E_USER_ERROR | E_USER_WARNING | E_RECOVERABLE_ERROR
);
@ini_set( 'display_errors',     1 );
@ini_set( 'log_errors',         1 );
define( 'WP_DEBUG_DISPLAY',     true );
define( 'SAVEQUERIES',          true );
define( 'DIEONDBERROR',         true );
define( 'ERRORLOGFILE',         '/var/log/mu_error.log' );
@ini_set( 'error_log',          '/var/log/php_error.log' );
/*-----------------------------------------------------------------------------*/


$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}
/*to remove warning */
define('WP_CORE_UPDATE', false);
/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
