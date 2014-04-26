<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class LoginController extends GenericController implements LoginControllerInterface {

	private $myView;

	public function __construct() {

		$this->myView = new \View\LoginView();

		parent::__construct();

		if(isset($_SESSION['Username']) && !empty($_SESSION['Username'])) {
			header('Location:/');
		}
	}

	public function index() {
			
		if(isset($_POST['LoginSubmitVar'])) {
			$UserID = \Model\UserOperationsModel::IDFromUsername($_POST['Username']);
			$attempts = \Model\UserOperationsModel::getFailedAttempts($UserID);
			$needCaptcha = false;
			if((int)$attempts > 5){
				$this->myView->addCaptcha();
				$needCaptcha = true;
			}
			
			/*require_once(dirname(__FILE__) . '/../Model/recaptchalib.php');
				$privatekey = "6LfeW-4SAAAAABRJXJLy0Ixkk0HJAGOPaZO8rUbv";
				$resp = recaptcha_check_answer ($privatekey,
                                $_SERVER["REMOTE_ADDR"],
                                $_POST["recaptcha_challenge_field"],
                                $_POST["recaptcha_response_field"]);*/

			$captcha = \Controller\FancycaptchaController::checkCaptcha();
		
			$correct = \Model\UserOperationsModel::checkCredentials(stripslashes($_POST['Username']), stripslashes($_POST['Password']));
			
			if ($needCaptcha == true && !$captcha) {
				$correct = false;
			}
			
			if($correct == true) {
				if(\Model\UserOperationsModel::isVerified($UserID)) {
					\Model\UserOperationsModel::loginUser(stripslashes($_POST['Username']), stripslashes($_POST['Password']));
					$UserID = \Model\UserOperationsModel::IDFromUsername(stripslashes($_POST['Username']));
					\Model\UserOperationsModel::clearFailedAttempts($UserID);
					$_SESSION['IncorrectCaptcha'] = null;
					header( "Location:/" );
				} else {
					$_SESSION['NotVerifiedUserLogin'] = true; $_SESSION['NotVerifiedUserID'] = $UserID;
				}
			}
			else{
				
				if ($needCaptcha == true && !$captcha) {
					$this->myView->addError("Captcha was not entered correctly!");
				} else {
					$this->myView->addError("Username and password don't match.");
				}
				
				if($UserID != false) { \Model\UserOperationsModel::increaseFailedAttempts($UserID); }
				
			}
		}
		
		$this->myView->setAvatarLink($this->AvatarLink);
		if(isset($_SESSION['NotVerifiedUserLogin']) && $_SESSION['NotVerifiedUserLogin'] == true
			&& isset($_SESSION['NotVerifiedUserID']) && $_SESSION['NotVerifiedUserID'] != false) {
			$this->myView->notValidUser($_SESSION['NotVerifiedUserID']); $_SESSION['NotVerifiedUserLogin'] = false; $_SESSION['NotVerifiedUserID'] = false; }

		$this->myView->initContent();
		echo $this->myView->run();
	}

	public function send() {
		if(@func_get_arg(0) !== false) { $UserID = func_get_arg(0); }
		else { header('/'); }

		if(isset($_GET['mode']) && $_GET['mode'] == 'error') {
			$this->myView->addError('The link has either expired or has already been used, <a href="/login/send/' . $UserID . '">click here re-send email verification</a>');
		} else {
			\Model\UserOperationsModel::sendEmailVerification($UserID);
			$this->myView->addError("<span class='green'>E-mail validation sent successfully, please check your mail</span>");
		}

		$this->index();
	}
}