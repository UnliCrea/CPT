<?php

namespace Model;

class DBConnectionModel implements DBConnectionModelInterface {

	private static $dblink;
	private static $phpbblink;

	public static $saltPrepend = 'SALT';

	public static function mainDBLink() {
		if(isset(self::$dblink)) { return self::$dblink; }
		else {

			/* Database config */

			$db_host		= 'localhost';	//Hostname
			$db_database	= 'MainDB';	//Database name
			$db_user		= 'root';
			$db_pass		= 'DATABASEPASSWORD';

			/* End config */

			try {
				$link = new \PDO("mysql:host=$db_host;dbname=$db_database", $db_user, $db_pass);	}
			catch (\PDOException $e) {
				echo $e->getMessage();
				exit;
			}

			$link->setAttribute( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_WARNING );	//Setting PDO Error attribute to raise warnings and log them at the error log file

			self::$dblink = $link;

			return self::$dblink;
		}
	}

	public static function phpBBDBLink() {
		if(isset(self::$phpbblink)) { return self::$phpbblink; }
		else {

			/* Database config */

			$db_host		= 'localhost';	//Hostname
			$db_database	= 'COMMUNITYDB';	//Database name
			$db_user		= 'root';
			$db_pass		= 'DATABASEPASSWORD';

			/* End config */

			try {
				$link = new \PDO("mysql:host=$db_host;dbname=$db_database", $db_user, $db_pass);	}
			catch (\PDOException $e) {
				echo $e->getMessage();
				exit;
			}

			$link->setAttribute( \PDO::ATTR_ERRMODE, \PDO::ERRMODE_WARNING );	//Setting PDO Error attribute to raise warnings and log them at the error log file

			self::$phpbblink = $link;

			return self::$phpbblink;
		}
	}

}