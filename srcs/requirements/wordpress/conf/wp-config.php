<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */

// define( 'DB_NAME', getenv('thedatabase') );
// define( 'DB_USER', getenv('theuser') );
// define( 'DB_PASSWORD', getenv('abc') );
// define( 'DB_HOST', getenv('mariadb') );
// define( 'WP_HOME', getenv('https://login.42.fr') );
// define( 'WP_SITEURL', getenv('https://login.42.fr') );
//$db_password = shell_exec('cat $DB_PASSWORD_FILE');
define( 'DB_NAME', getenv('DB_NAME') );
define( 'DB_USER', getenv('DB_USER') );
#define( 'DB_PASSWORD', getenv('DB_PASSWORD') );
define('DB_PASSWORD', trim(file_get_contents(getenv('DB_PASSWORD_FILE'))));
define( 'DB_HOST', getenv('DB_HOST') );
define( 'WP_HOME', getenv('WP_SITEURL') );
define( 'WP_SITEURL', getenv('WP_SITEURL') );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'w-VH%$n1,: Y#d)+1+2!PR}v|A+w*onS,E{Wq)w|;-E[X6h;3, {@~6D|@>P:ep2');
define('SECURE_AUTH_KEY',  'Z+yS[aLO</#sJRZ+y(N1 Sm^S7]fZ7>TH*^[r5l~E;TxxQJRdvZ<=|5033bgERtC');
define('LOGGED_IN_KEY',    '<Ka.^BE -`gS+$t:>9oN^ul&>TSy!HkH{hlq$pWw[I6ki*t-/;t:{V7#&%/yz>9!');
define('NONCE_KEY',        '?://.hYd*x-+2p))g#@-:1qNphD>WE]wH8e]18Fb9r],#%qXArN;W/#d1&G{/lvY');
define('AUTH_SALT',        '%w=880wSOJ~8BK6i^N6~Ze>{1K_lw-6!v~?S|BXo^>%Xxj g/n5$xyX_v$1fkrdg');
define('SECURE_AUTH_SALT', 'L:!zir7o#v.)WkWd-gF4*^EV+l[_b;sUz0Y>m0`q1~.:t]dz4`ONFu?lt-q1-|3w');
define('LOGGED_IN_SALT',   ';$Q)1IPI=9G {}D<+FoYEZ5PY_SKZrqMPYw>zv}aZ&OG6]noEA|^ &Gh[#yTH[$@');
define('NONCE_SALT',       'V>!9mk2]&sq5WuR@&3tykUp+2Aln3;em3(-VLg%M;%1Sf!7Sboj]gs46f8c{=-??');
// define( 'AUTH_KEY',         '' );
// define( 'SECURE_AUTH_KEY',  '' );
// define( 'LOGGED_IN_KEY',    '' );
// define( 'NONCE_KEY',        '' );
// define( 'AUTH_SALT',        '' );
// define( 'SECURE_AUTH_SALT', '' );
// define( 'LOGGED_IN_SALT',   '' );
// define( 'NONCE_SALT',       '' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
define('WP_DEBUG', true);
if (WP_DEBUG) {
		@error_reporting(E_ALL);
		@ini_set('log_errors', true);
		@ini_set('log_errors_max_len', '0');
		define('WP_DEBUG_LOG', true);
		define('WP_DEBUG_DISPLAY', false);
		define('CONCATENATE_SCRIPTS', false);
		define('SAVEQUERIES', true);
}

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';