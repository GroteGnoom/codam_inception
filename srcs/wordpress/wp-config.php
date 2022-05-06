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

$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
