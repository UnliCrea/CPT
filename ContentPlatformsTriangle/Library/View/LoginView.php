<?php

namespace View;

class LoginView extends GenericView implements LoginViewInterface {

	private $Errors = array();
	private $viewCaptcha = false;
	
	public function __construct() {
		$this->addCSS('Fields');
		$this->addJS('FancyCaptcha');
		$this->setPageName('Login');
	}

	public function notValidUser($UserID) {
		array_push($this->Errors, 'This account is not verified, <a href="/login/send/' . $UserID . '">re-send verification email</a>');
	}

	public function initContent() {

		$captchaHTML =  '<div class="ajax-fc-container"></div>';
	
		$content = 
'<div id="joe_title">
            <span id="joe_title_text">Log in</span><br>
            <span id="joe_subtitle_text">It\'s about time.</span>
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

     <br/>

<div class="centerform">
    </span>
		<form id="FormWithCaptcha" method="POST">
			<input type="text" name="Username" placeholder="Username"> <input type="password" name="Password" placeholder="Password"><input type="submit" class="GreenSubmitButton" name="LoginSubmitButton" value="Log In">
			<input type="hidden" name="LoginSubmitVar"><center>
			'; if($this->viewCaptcha || $_SESSION['IncorrectCaptcha']) { $content .= $captchaHTML; } 
$content .= '</center>
		</form>
		
		

		<span class="disclaimer">
	    <p>
	    <a href="/forgetpassword">Forgot Password?</a> || <a href="/register">No account? Sign Up!</a>
	    </p>
	    <br><br>
	    <p>
	        You can use your account to unlock Early Access. You can also use it to post comments on the devblog and the forums.
	    </p>
</div>

';

	$this->setContent($content);

	}
	
	
	public function addError($Error) {
		return array_push($this->Errors, $Error);
	}
	
	public function addCaptcha(){
		$this->viewCaptcha = true;
	}
}
