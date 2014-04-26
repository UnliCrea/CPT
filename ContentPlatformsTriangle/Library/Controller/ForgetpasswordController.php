<?php

namespace Controller;

class ForgetpasswordController extends GenericController implements ForgetpasswordControllerInterface {

	public function __construct() {

		parent::__construct();

		if(isset($_SESSION['Username']) && !empty($_SESSION['Username'])) {
			header('Location:/');
		}
	}
	
	public function index() {

		$myView = new \View\ForgetPasswordView();

		if(isset($_POST['ForgetPasswordPageSubmitVar'])) {

			$myModel = new \Model\ForgetPasswordModel();

			$UserID = false; $Email = false;

			if(isset($_POST['Email']) && !empty($_POST['Email'])) {
				$UserID = \Model\UserOperationsModel::IDFromEmail($_POST['Email']);
				$Email = $_POST['Email'];
			}

			if($UserID == false || $Email == false) {
				$myView->PageContent = '<p class="textred">Oops, we couldn\'t find any account linked to that email, try again.</p>';
			}
			else {

				$Username = \Model\UserOperationsModel::UsernameFromID($UserID);

				$Key = $myModel->GenerateKey($UserID);

				$Link = 'http://concernedjoe.com/forgetpassword/UpdatePassword?key=' . $Key;

				$Subject = 'Forgot Password';
				$Body =

	'<img src="http://concernedjoe.com/Theme/Images/Email%20Headers/header_password.png">

	<br><br>

	Hello there dear ' . $Username . '.

	<br><br>

	Looks like you forgot your password, but fear not! We got you covered.

	<br><br>

	Click on the link below to open a page from which you will be able to reset the password on your account.

	<br><br>

	<a href="' . $Link . '">' . $Link . '</a>

	<br><br>

	In case you didn\'t request a password reset, just ignore this email.';

				\Model\GenericOperationsModel::sendEmailTo($Email, $Subject, $Body);

				$myView->PageContent = '<p class="textgreen">Check your e-mail, you\'ve got a surprise there!</p>';

			}

		} else {

			$myView->PageContent = 
	'<p class="awesome_review_text">
		    This will send you an email with a custom link, from there you will be able to reset your password.
		    </p>
		    <p class="disclaimer">
		    All we need is the email you used when you registered your account.
		    </p>
		    <br>
			<form method="POST">
				<input type="text" name="Email" placeholder="Email"><br>
				<input type="submit" class="GreenSubmitButton" name="ForgetSubmitButton" value="Recover">
				<input type="hidden" name="ForgetPasswordPageSubmitVar">
			</form>';
		}

		$myView->initContent();
		echo $myView->run();
	}

	public function UpdatePassword() {

		$myView = new \View\ForgetPasswordView();

		$Key = $_GET['key'];
		$myModel = new \Model\ForgetPasswordModel();
		$UserID = $myModel->ValidateKey($Key);

		if(!$UserID) {
			$myView->PageContent = '<p class="textred">Oops, Looks like the link you clicked on has expired, <a href="/forgetpassword/">click here to retry resetting password.</a></p>';
		} else {

			if(isset($_POST['ForgetPasswordSubmitVar'])) {

				if( isset($_POST['PasswordOne']) && !empty($_POST['PasswordOne'])
					&& isset($_POST['PasswordTwo']) && !empty($_POST['PasswordTwo']) ) {

					if($_POST['PasswordOne'] != $_POST['PasswordTwo']) {
						$myView = new \View\ForgetPasswordUpdatePasswordView();
						$myView->PasswordsCollide = true;
					}
					else {
						$myModel->UpdatePasswordForUserWithKey(stripslashes($_POST['PasswordOne']), $Key);
						$myView->PageContent = '<p class="textgreen">Password succesfully changed!</p>';
					}
				}

				$myView->initContent();
			}

			else {
				$myView = new \View\ForgetPasswordUpdatePasswordView();
			}
		}

		$myView->initContent();
		echo $myView->run();
	}

}