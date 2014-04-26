<?php

namespace View;

class ForgetPasswordView extends GenericView implements ForgetPasswordViewInterface {
	
	public $PageContent;

	public function __construct() {

		$this->addCSS('Fields');
		$this->setPageName('Reset Password');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="title_red">Don\'t worry</span><br>
            <span id="joe_subtitle_text">It happens.</span>
</div>

     <br/>

<div class="centerform">
	    ' . $this->PageContent . '
</div>
');

	}
}