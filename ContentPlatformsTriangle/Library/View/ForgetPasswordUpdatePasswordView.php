<?php

namespace View;

class ForgetPasswordUpdatePasswordView extends GenericView implements ForgetPasswordUpdatePasswordViewInterface {
	
	public $PasswordsCollide = false;

	public function __construct() {

		$this->addCSS('Fields');
		$this->setPageName('Reset Password');
	}

	public function initContent() {

		$content =
'<div id="joe_title">
            <span id="title_red">One step left</span><br>
            <span id="joe_subtitle_text">Time to get a new password</span>
</div>

     <br/>

<div class="centerform">
    </span>
    <span class="awesome_review_text">
	    <p>
	    Make sure it\'s an awesome password that you will remember this time. 
	    </p>
	    <span class="disclaimer">
	    <p>
	    Type the password in the fields below, twice.
	    </p>
	    '; if($this->PasswordsCollide == true) { $content .= '<p class="textred">Passwords don\'t match</p>
	    '; }
	    $content .= '<br>
		<form method="POST">
			<input type="password"" name="PasswordOne" placeholder="Password"><br>
			<input type="password"" name="PasswordTwo" placeholder="Password"><br>
			<input type="submit" class="GreenSubmitButton" name="ForgetSubmitButton" value="Recover">
			<input type="hidden" name="ForgetPasswordSubmitVar">
		</form>
</div>
';

		$this->setContent($content);

	}

}