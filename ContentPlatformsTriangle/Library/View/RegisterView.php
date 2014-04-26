<?php

namespace View;

class RegisterView extends GenericView implements RegisterViewInterface {
	
	private $Errors = array();
	
	public function __construct() {

		$this->addCSS('Fields');
		$this->addCSS('Registration');
		$this->addJS('FancyCaptcha');
		$this->setPageName('Register');

	}

	public function initContent() {

		
		$captchaHTML =  '<div class="ajax-fc-container"></div>';
		
		$defaultUsername = $_POST['RegistrationUsernameField'];
		$defaultEmail = $_POST['RegistrationEmailField'];
		$defaultPassword = $_POST['RegistrationPasswordField'];
		$defaultPassword2 = $_POST['RegistrationConfirmPasswordField'];
	
		$content = 
'<div id="joe_title">
            <span id="joe_title_text">
                Register a new account
            </span>
            <br/>
            <span id="joe_subtitle_text">
                And join the party!
            </span>
</div>

<div class="ErrorText2">
<center>
		<ul id="ErrorText2">
';

		foreach ($this->Errors as $element) {
			$content .=
'			<li>' . $element . '</li>
';
		}

	$content .=
'		</ul>
</center>
	</div><br/>

<div class="centerform">
    </span>

<form id="FormWithCaptcha" method="POST">
<input id = "RegistrationUsernameField" type="text" name="RegistrationUsernameField" placeholder="Username" value='.$defaultUsername.'><br>
<input id = "RegistrationEmailField" type="text" name="RegistrationEmailField" placeholder="Email" value='.$defaultEmail.'><br><br>

<input id = "RegistrationPasswordField" type="password" name="RegistrationPasswordField" placeholder="Password" value='.$defaultPassword.'><br>
<input id = "RegistrationConfirmPasswordField" type="password" name="RegistrationConfirmPasswordField" placeholder="Password Again" value='.$defaultPassword2.'><br>

<span class="disclaimer">
	    <p>
	    This will create an account that allows you to unlock Early Access. You can also use it to post comments on the devblog and the forums.
	    </p>

	    <div><br/><center>' . $captchaHTML .' </center><input type="submit" class="GreenSubmitButton" name="RegistrationSubmitButton" value="Register"></div>
</form>
</div>
';

$this->setContent($content);

	}
	
	public function addError($Error) {
		return array_push($this->Errors, $Error);
	}
}