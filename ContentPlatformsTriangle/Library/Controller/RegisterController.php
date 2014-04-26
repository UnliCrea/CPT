<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class RegisterController extends GenericController implements RegisterControllerInterface {

	public function __construct() {

		parent::__construct();

		if(isset($_SESSION['Username']) && !empty($_SESSION['Username'])) {
			header('Location:/');
		}
	}

	public function index() {
	
		$myView = new \View\RegisterView();

		if(isset($_POST['RegistrationSubmitButton'])) {
		
		if(isset($_POST['RegistrationUsernameField'])
			&& isset($_POST['RegistrationEmailField'])
			&& isset($_POST['RegistrationPasswordField'])

			&& $_POST['RegistrationUsernameField'] != ""
			&& $_POST['RegistrationEmailField'] != ""
			&& $_POST['RegistrationPasswordField'] != ""

			&& $_POST['RegistrationUsernameField'] != null
			&& $_POST['RegistrationEmailField'] != null
			&& $_POST['RegistrationPasswordField'] != null
			
			&& $_POST['RegistrationPasswordField'] == $_POST['RegistrationConfirmPasswordField']) {
			
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
				}
				else{
					if($isEmailTaken == true) {
						$myView->addError("This Email is already in use");
					}
					if($isUsernameTaken == true) {
						$myView->addError("This username is already in use");
					}
					if($isEmailValid == false) {
						$myView->addError("Invalid Email");
					}
					if(!$captcha){
						$myView->addError("Captcha was not entered correctly!");
					}
					if($userState == "NoSymbols") {
						$myView->addError("Username cannot contain the following symbols: ~`!@#)(*&^%$\/");
					}
					if($userState == "TooLong") {
						$myView->addError("Username can be a maximum of 15 characters");
					}
				}
			
			} else {
				if($_POST['RegistrationPasswordField'] != $_POST['RegistrationConfirmPasswordField']) {
					$myView->addError("Passwords don't match");
				}
				else {
					$myView->addError('Please out fill out missing fields');
				}
			}	
		}

		$myView->initContent();
		echo $myView->run();

		return true;
	}
}