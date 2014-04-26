<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class GenericController implements GenericControllerInterface {

	protected $AvatarLink;

	public function __construct() {

		$referrer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : null;

		$sessionsModel = new \Model\SessionsModel();
		
		$renewPost = false;

		if(isset($_SESSION['Username'])) {
			$UserID = \Model\UserOperationsModel::IDFromUsername($_SESSION['Username']);
			$this->AvatarLink = \Model\UserOperationsModel::getUserAvatarLinkFromUserID($UserID);	}
		else { $this->AvatarLink = \Model\UserOperationsModel::getUserAvatarLinkFromUserID(); }

		//Start Registration

		if(isset($_POST['RegistrationSubmitVar'])) {
		
			if(isset($_POST['RegistrationUsernameField'])
			&& isset($_POST['RegistrationEmailField'])
			&& isset($_POST['RegistrationPasswordField'])

			&& $_POST['RegistrationUsernameField'] != ""
			&& $_POST['RegistrationEmailField'] != ""
			&& $_POST['RegistrationPasswordField'] != ""

			&& $_POST['RegistrationUsernameField'] != null
			&& $_POST['RegistrationEmailField'] != null
			&& $_POST['RegistrationPasswordField'] != null) {

				$isEmailTaken = \Model\UserOperationsModel::IDFromEmail(stripslashes($_POST['RegistrationEmailField']));
				$isUsernameTaken = \Model\UserOperationsModel::IDFromUsername(stripslashes($_POST['RegistrationUsernameField']));
				$isEmailValid = \Model\UserOperationsModel::ValidateEmail(stripslashes($_POST['RegistrationEmailField']));
				$userState = \Model\UserOperationsModel::ValidateUsername($_POST['RegistrationUsernameField']);
	
				$captcha = \Controller\FancycaptchaController::checkCaptcha();
				
				if($isUsernameTaken == false && $isEmailTaken == false && $isEmailValid == true && $captcha && $userState == "AllGood") {
					$UserID = \Model\UserOperationsModel::registerMainUser(stripslashes($_POST['RegistrationUsernameField']), stripslashes($_POST['RegistrationPasswordField']), stripslashes($_POST['RegistrationEmailField']));
					\Model\UserOperationsModel::registerWordPressUser(stripslashes($_POST['RegistrationUsernameField']), stripslashes($_POST['RegistrationPasswordField']), stripslashes($_POST['RegistrationEmailField']));
					\Model\UserOperationsModel::registerphpBBUser(stripslashes($_POST['RegistrationUsernameField']), stripslashes($_POST['RegistrationPasswordField']), stripslashes($_POST['RegistrationEmailField']));

					header('Location:/login/send/' . $UserID);
				} else {

					if($userState == "NoSymbols"){
						$_SESSION['UserNoSymbols'] = true;
					}
					if($userState == "TooLong"){
						$_SESSION['UserTooLong'] = true;
					}
					if($isEmailTaken == true){
						$_SESSION['RegistrationEmailFound'] = true;
					}
					if($isUsernameTaken == true){
						$_SESSION['RegistrationUsernameFound'] = true;
					}
					if(!$captcha){
						$_SESSION['IncorrectCaptcha'] = true;
					}
					if($isEmailValid == false){
						$_SESSION['InvalidEmail'] = true;
					}
				}
			}
			
		}

		//End Registration

		//Start Login

		if(isset($_POST['LoginSubmitVar'])) {
		
			$userID = \Model\UserOperationsModel::IDFromUsername($_POST['LoginUsernameField']);
			$attempts = \Model\UserOperationsModel::getFailedAttempts($userID);
			$needCaptcha = false;
			if((int)$attempts > 5) {
				$needCaptcha = true;
				header( "Location:/Login" );
			} else {

				if(isset($_POST['LoginUsernameField'])
				&& isset($_POST['LoginPasswordField'])

				&& $_POST['LoginUsernameField'] != ""
				&& $_POST['LoginPasswordField'] != ""

				&& $_POST['LoginUsernameField'] != null
				&& $_POST['LoginPasswordField'] != null) {

					$UserID = \Model\UserOperationsModel::IDFromUsername($_POST['LoginUsernameField']);

					if($UserID != false) {

						if(\Model\UserOperationsModel::isVerified($UserID)) {
							$result = \Model\UserOperationsModel::loginUser($_POST['LoginUsernameField'], $_POST['LoginPasswordField']);
							$renewPost = true;
							if(!$result) { 
								$_SESSION['LoginWrongCreds'] = true;
								
								$userID = \Model\UserOperationsModel::IDFromUsername($_POST['LoginUsernameField']);
								\Model\UserOperationsModel::increaseFailedAttempts($userID);
							}

						} else { $_SESSION['NotVerifiedUserLogin'] = true; $_SESSION['NotVerifiedUserID'] = $UserID; header( "Location:/Login" ); }
					} else {
						$_SESSION['LoginWrongCreds'] = true;
					}
				}
			}
			
		} else {
			if(isset($_SESSION['WordPressLoggingIn'])) { $_SESSION['WordPressLoggingIn'] = false; }
		}
		

		//End Login

		if($renewPost) {
			$_POST = array();
			if(!is_null($referrer)) {
				header('Location:' . $referrer);
			} else { header('Location:./'); }

			die();
		}

		//Start phpBB include for PMs support

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template, $auth;

		if(!isset($user->data) || empty($user->data)) {
			$sessionStartVal = true;
		} else { $sessionStartVal = false; }

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		define('IN_PHPBB', true);
		if(!defined('PHBB_ROOT_PATH')) { define('PHPBB_ROOT_PATH', './'); }
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');

		if($sessionStartVal) {
			$user->session_begin();
			$auth->acl($user->data);
			$user->setup();
		}
		
		$_SESSION['NewPM'] = $user->data['user_new_privmsg'];

		//End phpBB include for PMs support

		return true;
	}

	public function index() {
		die('Index method not overriden.');
	}

	public function phpBBHeader() {
		$myView = new \View\GenericView();
		$myView->setAvatarLink($this->AvatarLink);
		return $myView->pureHeader('Community');
	}

	public function wordPressHeader() {
		$myView = new \View\GenericView();
		$myView->setAvatarLink($this->AvatarLink);
		return $myView->pureHeader('Devblog');
	}

	public function pureFooter() {
		$myView = new \View\GenericView();
		$myView->setAvatarLink($this->AvatarLink);
		return $myView->Footer();
	}

}