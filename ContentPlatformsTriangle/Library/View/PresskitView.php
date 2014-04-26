<?php

namespace View;

class PresskitView extends GenericView implements PresskitViewInterface {
	
	public function __construct() {

		$this->addCSS('Presskit');
		$this->setPageName('Presskit');

	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                Presskit
            </span>
            <br/>
            <span id="joe_subtitle_text">
                Making your job easier
            </span>
</div>

     <br/>
<center>
<div>
		<span class="headline">
	    <p>
	    There is no presskit here yet.
	    </p>
	    </span>
	    <span class="regulartext">
	    <p>
	        We apologize for that, however we are not trying to get people hyped about the game just yet.
	    </p>
	    <p>
	        We are trying to keep the review count to a minimum right now since the game is still very early in development,
	        </p>
	        <p>
	        and seeing that it\'s not a finished product, it wouldn\'t be fair to review it in it\'s current state.
	    </p>
	    <br>
	    <hr>
	    <br>
	    <p>
	    That being said, this page will be updated once the game is in a respectable shape and ready for reviews.
	    </p>
	    <p>
	    Until then, we\'re trying to keep the player base small and dedicated. For more of that, check the <a href="/community">community page</a>.
	    </p>
	    <br>
	    <p>
	    Thanks for understanding and sorry again. :)
		</p>
	    </span>
	    <br><br><br>
</div>
</center>
');

	}
}