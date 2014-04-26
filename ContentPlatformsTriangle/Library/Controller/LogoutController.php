<?php

namespace Controller;

class LogoutController implements LogoutControllerInterface {
	
	public function __construct() {

		session_start();

		$UserID = isset($_SESSION['Username']) ? \Model\UserOperationsModel::IDFromUsername($_SESSION['Username']) : false;

		session_destroy();
		$_SESSION = array();

		//Start WordPress Logout

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		wp_logout();

		//End Wordpress Logout

		//Start phpBB Logout

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);
		$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : $phpBBDirectory;
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');

		$user->session_kill();
		$user->session_begin();

		//End phpBB Logout

		if($UserID !== false) { \Model\UserOperationsModel::destroyTokensForUserID($UserID); }

		if(isset($_GET['redirect'])) { header("Location:" . urldecode($_GET['redirect'])); }
		else { header("Location:./"); }

		return true;
	}

}

?>