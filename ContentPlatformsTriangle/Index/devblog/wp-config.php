<?php

/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'BLOGDB');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'DATABASEPASSWORD');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'f4?+{t9~gIco,RMrt.W/HQ,@V(8$a+w`CDxeb!yf:-.(ld>]3vm7)^+3HR-9|M9u');
define('SECURE_AUTH_KEY',  ']qfK6^Uqh~V%Y4eoF&DKn6Xhz(rvX@KR9avjiLvUS_}T.wKs|~eq#!F1^?_I>tx=');
define('LOGGED_IN_KEY',    'f!&j?;lo>3%%pKTbF+nn-Q_]|-^*OQ*u#|_23qiE*+/6m=mme4f0zg1.A+87Z5NX');
define('NONCE_KEY',        '8r2dDD`7%5fM0ch+%uat|OQJ8;sW6c,8X(m[-2%2|i(a0tB#{S|Pi^akpL%(b`z6');
define('AUTH_SALT',        '&3o25:uI7EB;hhhwp(=hag-R`jfw+MJ9B6xj{V[/YO.Arv6Dl,C:k<[71_YmYmg=');
define('SECURE_AUTH_SALT', '~T?P^/9z-7-QsD`?s75oP#_:qeKE`0%DTH&RO#T_904xn-l|c9{#wf[5H?A=vE|U');
define('LOGGED_IN_SALT',   '{]/,IAZU]0JED}=?8xa%a :jRwh.v62O(VR-x?C/vRbPr)n0lK-,JfZ&m}xgGfZZ');
define('NONCE_SALT',       '2L+9z0 S-E;!6=S@|Rxti_F<~`M3*<^-~yED$PT~h!_q5tt%-bUu1Ahp/3$k&7b+');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

define('FS_METHOD', 'direct');