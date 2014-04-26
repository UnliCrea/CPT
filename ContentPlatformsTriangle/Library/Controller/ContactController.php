<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class ContactController extends GenericController implements ContactControllerInterface {

	public function index() {
	
		$myView = new \View\ContactView();

		if(isset($_POST['ContactSubmitVar'])) {
			$isEmailValid = \Model\UserOperationsModel::ValidateEmail($_POST['email']);
			$allGood = true;
			
			if($isEmailValid == false && $_POST['email'] != '') {
				$allGood = false;
				$myView->addError("Invalid Email");
			}
			
			if($_POST['message'] == '' || $_POST['subject'] == '' || $_POST['name'] == '' || $_POST['email'] == ''){
				$allGood = false;
				$myView->addError("Missing fields");
			}
			
			 $captcha = \Controller\FancycaptchaController::checkCaptcha();
								
			if (!$captcha) {
				$allGood = false;
				$myView->addError("Captcha was not entered correctly!");
			}
			
			if($allGood == true) {
				$name = $_POST['name']; $name = stripslashes($name);
				$subject = $_POST['subject']; $subject = stripslashes($subject);
				$body = 'Name: ' . $_POST['name'] . '<br>';
				$body .= 'E-mail: ' . $_POST['email'] . '<br><br>';
				

				$body .= $_POST['message'];
				$body = stripslashes($body);
				\Model\GenericOperationsModel::sendEmailTo('contact@thoseawesomeguys.com', 'Concerned Joe | ' . $_POST['subject'] . ' | ' . $_POST['name'], $body);
				$myView->addGreat("Message sent!");
			}
		}

		
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>