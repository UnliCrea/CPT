<?php

namespace Model;

class SessionsModel implements SessionsModelInterface {
	
	public function __construct() {

		if (\session_status() == PHP_SESSION_NONE) {
    		\ini_set("session.cookie_lifetime", 31536000);
			\session_start();
		}

		$RedirectVar = false;
		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template, $auth;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);

		if(file_exists('common.php')) { $phpbb_root_path = './'; }
		else if(file_exists('wp-login.php')) { $phpbb_root_path = './../community/'; }
		else if(file_exists('swatch.php')) { $phpbb_root_path = './../'; }
		else { $phpbb_root_path = './community/'; }
		
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');

		if(!isset($user->data) || empty($user->data)) {
			$sessionStartVal = true;
		} else { $sessionStartVal = false; }

		if($sessionStartVal) {
			$user->session_begin();
			$auth->acl($user->data);
			$user->setup();
		}

		if(!isset($_SESSION['Username']) || empty($_SESSION['Username'])) {

			if(!$this->checkTokenAndLoginAccordingly()) {

				if(!isset($_SESSION['WordPressLoggingIn']) || $_SESSION['WordPressLoggingIn'] == false) {
					$result = is_user_logged_in();
					$_SESSION['WordPressLoggingIn'] = false;
				}
				else { $result = true; }

				if($result == true) {
					$RedirectVar = true;
				}

				if(!empty($user->data) && $user->data['user_id'] != 1) {
					$RedirectVar = true;
				}

				if($RedirectVar) { header('Location:/logout/');	}

			} else {

				$_POST = array();
				$referrer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : null;

				if(!is_null($referrer)) {
					header('Location:' . $referrer);
				} else { header('Location:./'); }

				die();
			}

		} else {

			if( ( !isset($_SESSION['WordPressLoggingIn']) || $_SESSION['WordPressLoggingIn'] == false ) && !isset($_POST['LoginSubmitVar']) ) {

				if(isset($user->data['user_id']) && $user->data['user_id'] == 1) {
					$RedirectVar = true;
				}

				$result = is_user_logged_in();

				if($result == false) {
					$RedirectVar = true;
				}

				if($RedirectVar == true) {
					if(!$this->checkTokenAndLoginAccordingly()) { header('Location:/logout/'); }
					else {
						$referrer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : null;

						if(!is_null($referrer)) {
							header('Location:' . $referrer);
						} else { header('Location:./'); }
					}
				}

			}

		}

	}

	public function generateTokenForUserID($UserID) {

		$link = DBConnectionModel::mainDBLink();

		while(true) {
			$Token = \Model\GenericOperationsModel::generateRandomString(50);

			$databaseStatement = $link->prepare("SELECT * FROM RememberUserTokens WHERE UserID = ? AND Token = ?");
			$databaseStatement->bindParam(1, $UserID); $databaseStatement->bindParam(2, $Token);
			$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
			$databaseStatement->execute();

			$row = $databaseStatement->fetch();

			if(!$row) { break; }
		}

		$databaseStatement = $link->prepare("INSERT INTO RememberUserTokens (UserID, Token) VALUES(?, ?);");
		$databaseStatement->bindParam(1, $UserID); $databaseStatement->bindParam(2, $Token);
		$databaseStatement->execute();

		$CookieData = array($UserID, $Token);
		
		$CookieData = implode(';', $CookieData);

		setcookie("Token", $CookieData, time() + 31536000, '/');

		return true;
	}

	private function checkTokenAndLoginAccordingly() {

		$link = DBConnectionModel::mainDBLink();

		if(isset($_COOKIE['Token'])) {

			$TokenData = explode(';', $_COOKIE['Token']);

			$databaseStatement = $link->prepare("SELECT * FROM RememberUserTokens WHERE UserID = ? AND Token = ?");
			$databaseStatement->bindParam(1, $TokenData[0]); $databaseStatement->bindParam(2, $TokenData[1]);
			$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
			$databaseStatement->execute();

			$row = $databaseStatement->fetch();

			if(isset($row['TokenTimeStamp'])) {

				$TimeNumberThing = strtotime($row['TokenTimeStamp']);

				if($TimeNumberThing > (time() - 31536000)) {

					\Model\UserOperationsModel::setCurrentUser($row['UserID']);

					\Model\UserOperationsModel::destroyTokensForUserID($row['UserID']);

					$this->generateTokenForUserID($row['UserID']);
					return true;
				}
			}
		}

		return false;
	}

}