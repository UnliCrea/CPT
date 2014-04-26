<?php

namespace View;

class AboutView extends GenericView implements AboutViewInterface
{

	public function __construct() {

		$this->addCSS('About');
		$this->addJS('About');
		$this->addJS('jquery.tools.min');
		$this->setPageName('About');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
			<span id="joe_title_text">
				About us
			</span>
			<br/>
			<span id="joe_subtitle_text">
				And what we had for breakfast
			</span>
		</div>

		<br/>

		<div class="container">
			<div class="left_section">
				<span class="section_title">
					Who are you guys?
				</span>

				<span class="section_text">
					<p>
						We\'re just two guys a continent apart from each other who love to make interesting games.
					</p>
					<p>
						Our goal in life is to elevate the cultural significance of games and improve on already established genres in order to create diversity and promote originality...
					</p>
					<p>
						... is the bull$*#t answer. We really just love to watch random people play our games on <a href="http://www.youtube.com/watch?v=yxTpk-rG1-I" target="_blank">Youtube</a> and laugh at our jokes!
					</p>
				</span>
			</div>

			<div class="image_block_right">
				<img src="' . $this->basePath . 'Theme/Images/About/whoarewe.jpg" style="padding-top: 25px;">
			</div>
		</div>
		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>

		<!-- <div id="coming_sometime">
			<span id="coming_sometime_text">
				Sneak peak of Nick\'s living room that he likes to call "studio"
			</span>
		</div> -->

		<br/>
		<br/>

		<div class="image_block">
				<img src="' . $this->basePath . 'Theme/Images/About/whatdo.jpg" style="padding-top: 25px">
			</div>
		<div class="container">

			<div class="right_section">
				<span class="section_title">
					What do you do?
				</span>

				<span class="section_text">
					<p>
						I\'m Nicolae Berbece (Xelu) and I\'m from Romania. I am the game designer, artist & animator. This means I come up with the ideas for the game and levels, I make the graphics and animations and I also manage the whole team making sure the game is AWESOME!
					</p>
					<p>
						I\'m Omar Shehata, and I\'m from Egypt. I am the programmer for Concerned Joe. This means I take all the inanimate bits and pieces of art and assets, and write the code that makes them come to life.
					</p>
					<p>
						Because we are the only two guys on the team, we have to wear a lot of hats and take care of a lot of things. We work with various people from around the world that help us with many things like music, level design, translations, etc. Please <a href="/contact"  target="_blank">contact us</a> if you think you can help!
					</p>
					<p>
						We probably stressed this enough by now, but you can check out what we do on our <a href="/devblog"  target="_blank">Devblog</a> where we document all the problems we tackle while working on Joe.
					</p>
				</span>
			</div>
		</div>
		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>
		<br/>

		<div class="awesome_review_single">
			<span class="awesome_review_text_container">
				<span class="awesome_review_text">
					History time: This is the very first flash version of Joe that started everything.
				</span>
				<br/>
				<br/>
				<div id="FlashPrototype">
					<img id="FlashPrototypePlaceholder" src="' . $this->basePath . 'Theme/Images/About/flashplayN.jpg"
					onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/About/flashplayO.jpg\'"
					onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/About/flashplayN.jpg\'">
				</div>
				<br/>
				<span class="awesome_review_text_author">
					<p>NOTE: This is NOT the Concerned Joe we are currently developing.
					</p>
					<p>
					This is just an old flash prototype.
					</p>
				</span>
			</span>
		</div>

		<br/>
		<br/>

		<div class="container">
			<div class="left_section">
				<span class="section_title">
					How did it all start?
				</span>

				<span class="section_text">
				   <p>
					Joe started as a <a href="http://www.youtube.com/watch?v=h8nt0r56-HE" target="_blank">quick flash game</a> in late 2010. We thought it would be really cool if there was a game where the player\'s life constantly drained unless he kept moving, but there weren\'t any games like that... So we made one!
				   </p>
				   <p>
					It was made as a small flash prototype and released in late 2011. A year later, after being <a href="/Theme/Images/About/success.jpg" target="_blank">met with much success</a>, we decided to re-make it from scratch as a non-flash, downloadable title and bring it to it\'s full potential.
				   </p>
				   <p>
					The new version of Joe still has the awesomeness of the flash prototype, but 1000 times bigger and more polished! The new engine is built with <a href="https://love2d.org/"  target="_blank">Love</a>! (seriously)
				</p>
				</span>
			</div>

			<div class="image_block">
				<img src="' . $this->basePath . 'Theme/Images/About/history.jpg" style="padding-top: 25px">
			</div>
		</div>
		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>
		<br/>

		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>
');

	}

}