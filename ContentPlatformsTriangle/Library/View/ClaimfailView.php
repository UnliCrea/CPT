<?php

namespace View;

class ClaimfailView extends GenericView implements ClaimfailViewInterface {
	
	public function __construct() {

		$this->addCSS('Claimfail');
		$this->setPageName('ClaimFail');

	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                Hmm, Something went wrong
            </span>
            <br/>
            <span id="joe_subtitle_text">
                But don\'t panic, let\'s fix it!
            </span>
</div>

     <br/><br/>

<div class="container">
            <div class="left_section">
	    <span class="regulartext">
	    <p>
	        It seems that you couldn\'t claim your Early Access license, this could be because of 2 possible reasons.
	        </p>
	        </span>
	        <br>
	        <span class="redtext">
	        <p>Your account email probably isn\'t the same with your PayPal one.</p>
	    </span>
	    <span class="disclaimer">
	        <p>In which case you can simply fix it by going to your <a href="http://concernedjoe.com/user" target="_blank">account page</a> and changing your email so it matches your paypal one, then click the claim button again.</p>
	        </span>
	        <span class="redtext">
	        <p>
	        If you are sure the emails match, it means the payment wasn\'t completed.
	    </p>
	    </span>
	    <span class="disclaimer">
	        <p>In which case you can go back to the <a href="http://concernedjoe.com/earlyaccess" target="_blank">early access page</a> and purchase a license by clicking the buy button again.</p>
	        </span>
	     <br><br>
	      <span class="regulartext">
	        <p>
	        Hope this was helpful, in case you still can\'t claim your license, <a href="http://concernedjoe.com/contact" target="_blank">contact us.</a>
	    </p>
	    </span>
	    
	    <br><br><br>
</div>
		<div class="image_block_right">
                <img src="' . $this->basePath . 'Theme/Images/Early Access/claim.jpg">
            </div>  
</div>
');

	}
}