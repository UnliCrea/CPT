<?php

namespace View;

class WelcomeView extends GenericView implements WelcomeViewInterface {
	
	public function __construct() {

		$this->addCSS('Welcome');
		$this->setPageName('Welcome');

	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                Welcome aboard
            </span>
            <br/>
            <span id="joe_subtitle_text">
                It\'s not really a ship but it sounds good to say that
            </span>
</div>

     <br/>
<center>
<div>
		<span class="headline">
	    <p>
	    Your account has been succesfully created!
	    </p>
	    </span>
	    <span class="regulartext">
	    <p>
	        Welcome to the community, you are super awesome for making an account.
	    </p>
	    <p>
	        Now you can get your hands on the game if you visit the <a href="/earlyaccess">Early Access page</a>, post on the <a href="/community">Forums</a> and the <a href="/devblog">Devblog</a>!	        </p>
	        <p>
	        If you have any question, check out the <a href="/faq">FAQ page</a> or <a href="/contact">contact us</a> directly.
	        </p>
	        </span>
	        <span class="crazy">
	        <p>
	        GO CRAZY!
	    </p>
	    </span>
	    <br>
	    <hr>
	    <br>
	    <p>
	    Also here is a photo of Joe to represent how happy he is that you joined the site.
	    </p>
	    </span>
	    <br>
	    <img src="/Theme/Images/Welcome/joe.gif">

	    <br><br><br>
</div>
</center>
');

	}
}