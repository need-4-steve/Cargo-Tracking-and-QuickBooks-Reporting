<?php

/**

 * The base configuration for WordPress

 *

 * The wp-config.php creation script uses this file during the

 * installation. You don't have to use the web site, you can

 * copy this file to "wp-config.php" and fill in the values.

 *

 * This file contains the following configurations:

 *

 * * MySQL settings

 * * Secret keys

 * * Database table prefix

 * * ABSPATH

 *

 * @link https://codex.wordpress.org/Editing_wp-config.php

 *

 * @package WordPress

 */



// ** MySQL settings - You can get this info from your web host ** //

/** The name of the database for WordPress */

define('DB_NAME', 'realevn1_wordpress');


/** MySQL database username */

define('DB_USER', 'realevn1_root');


/** MySQL database password */

define('DB_PASSWORD', 'S@y@j1N87');


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

define('AUTH_KEY', 'Pc(vBge_iSP^*mY<I$&d<ZMQ]A!X?mW!}yasd|KrrZ-/eh+xu*rmneq$BZ=X{qmESrOc%cVlzefFw-s_|VABpltDvvOf)UGbbjZMS{(o@RDCQlGnN*psQm^QTxVp$DlZ');
define('SECURE_AUTH_KEY', 'PrhKIzbm!Fn{=_mJ+ymTLt&m*-t_<-?ClzuI+gFNHp=Fr|cdT+=ucr*KqvnkKtZOnx-YD/sumA;bJLfhViRlg$HRZuKo-bdBcTNgKqfdbHTTGd[Huv-sNxpjlAQo*RPo');
define('LOGGED_IN_KEY', 'YeNxcA_eVo|g*DLQO)D{UiR*ldX!w)AZcZ|J;%woXIdFQk(zhOevWIEvNOJ/rhh?qG&<Jubd]yyH[q(BwuHrZ}XpbxYZ|v<MIqBy_f+WZ)dr?+yo)I[b^<mkZEL$L@dt');
define('NONCE_KEY', 's{D;huqaOKxy_!Tx;kdT*PJaNDX&XdV)(;I*((I>VSXD/<Unz(s<>o=f{q&c%?le-;cl$KqFsed!IgXHYri*Qr!m;&{?PiHJiEtFtute+d?M(cIlzvJMB%^]Xk*itib}');
define('AUTH_SALT', 'fRPftitjDj_v&M%Lk!{fQ)Fa*(G<CSFMlCYVzWinHc_>NH|BN%DjHU^z=$bUJ?T^?{ISbifGC{Z(JF/]!qt/a*y_SCpnjnyYQh}SaBSvC|c@_oE]BQb}H]/n&XuDjcXz');
define('SECURE_AUTH_SALT', 'wHhlrbRi>@MuH-<QCydpJU&V/N/aq?@[EBP{$XmKCAWIhqte^EijTxR<cI^DKWXjcSjLOu+^AgEwa*f?(enSoL=r/cqj$sGW]^MsQ?d@lCbmINF&Q?{ceR-qYLRMQfPm');
define('LOGGED_IN_SALT', 'b;Nm<fF<ovmFvvvQGH-lSFjcc?N!FmV>u*ZIi&Wtjk*Wj]e_y)UDCHuyACSxwGKUAQub@h}=gnUw?ME)P-xtW@@IN*B-u$eqli^(|rz>k/Pxh]z(lHdorAG?PJ>h]u%+');
define('NONCE_SALT', '+w[J*q@rvXbDU@Dhxuj|<QYgLmJyd@ddm=]yCBSjUs}pUxf)]RS]?V}@%S!fYf?LyICD>Z<M-DGaaUD(=Pb%{&W&omXZX==bh)HY$A/{z/DQaDqadqVFUfP[B_$h^[$O');


/**#@-*/



/**

 * WordPress Database Table prefix.

 *

 * You can have multiple installations in one database if you give each

 * a unique prefix. Only numbers, letters, and underscores please!

 */

$table_prefix = 'wp_uqad_';


/**

 * For developers: WordPress debugging mode.

 *

 * Change this to true to enable the display of notices during development.

 * It is strongly recommended that plugin and theme developers use WP_DEBUG

 * in their development environments.

 *

 * For information on other constants that can be used for debugging,

 * visit the Codex.

 *

 * @link https://codex.wordpress.org/Debugging_in_WordPress

 */

define('WP_DEBUG', false);



/* That's all, stop editing! Happy blogging. */



/** Absolute path to the WordPress directory. */

if ( !defined('ABSPATH') )

	define('ABSPATH', dirname(__FILE__) . '/');



/** Sets up WordPress vars and included files. */

require_once(ABSPATH . 'wp-settings.php');

