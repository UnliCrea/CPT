<?php

namespace View;

class IndexView extends GenericView implements IndexViewInterface
{

	public function __construct() {

		$this->addCSS('Index');
		$this->addJS('Index');
		$this->setPageName('Home');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
   <img src="/Theme/Images/Index/title.png">
</div>

<br/>
	
<div id="joe_movie">
	<img src="image/home/videobutton.png" />
</div>

<br/>

<!--<div id="buy_area">
	<a href="/earlyaccess" target="_blank"><input type="image" src="' . $this->basePath . 'Theme/Images/Index/playjoenowN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Index/playjoenowO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Index/playjoenowN.png\'"></a>
</div>-->

<br/>
<br/>
<br/>

<div class="awesome_review">

	<span class="awesome_review_text_container">

		<span class="awesome_review_text">
			"Starring a collection of blue pixels capable of infinitely more facial<br/>
			expressions than Keanu Reeves."
		</span>

		<br/>

		<span class="awesome_review_text_author">
			Rock paper shotgun
		</span>

	</span>

</div>

<br/>
<br/>

<div class="container">

	<div class="left_section">

		<span class="section_title">
			What is Concerned Joe?
		</span>

		<span class="section_text">

			<p>
				A puzzle platformer about Joe, a video game character who is concerned about his life. If he stops moving he will explode, so he has be in constant motion - ALL - the time!
			</p>

			<p>
				That\'s because of a disease called "I have to move or I\'ll die", I.H.T.M.O.I.D. for short, inflicted upon him by the creator of the game, the evil, mysterious and sarcastic programmer.
			</p>

			<p>
				His identity remains unknown but one thing is for sure...He is a d*#k! He created a virtual underground facility in his video game just so he could fill it with cruel puzzles awaiting to be solved by Joe. All this while fiddling around with the code, changing the environment around Joe in real time as he tries not to internally combust.
			</p>

			<p>
				Will Joe escape the programmer\'s evil clutches or will he be forever trapped in this video game?
			</p>

			<p>
				Find out the answer to this cheesy question and many more once the game is released!
			</p>

		</span>
	</div>

	<div class="image_block">
		<img src="' . $this->basePath . 'Theme/Images/Index/whatisjoe.jpg" style="padding-top: 25px">
	</div>
</div>

		<br/>
		<br/>

		<div id="coming_sometime">
			<span id="coming_sometime_text">
				Coming sometime in 2014 to a distribution platform near you!
			</span>
		</div>

		<br/>
		<br/>

		<div class="image_block">
				<img src="' . $this->basePath . 'Theme/Images/Index/wherecaniplay.jpg" style="padding-top: 25px">
			</div>
		<div class="container">

			<div class="right_section">
				<span class="section_title">
					Where can I play it?
				</span>

				<span class="section_text">
					<p>
						You can get your hands on the alpha version of the game right now through the <a href="/earlyaccess" target="_blank">Early Access pass</a>. This gives you instant access to the game as it\'s developed.
					</p>
					<p>
						You also get constant updates and the final game on Steam once it\'s released, you get to be part of the development process, how cool is that!
					</p>
					<p>
						We document all our work on our <a href="/devblog" target="_blank">Devblog</a>, we make weekly posts about the problems we encounter and how we fix them. Check it out if you are interested in how a game is made.
					</p>
					<p>
						The game works on PC, Mac, and Linux, check out the Early Access page for more information!
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
				<span class="awesome_review_text_single">
					"Best surprise of the 2013 Game Developers Conference."
				</span>
				<br/>
				<span class="awesome_review_text_author">
					Venture Beat
				</span>
			</span>
		</div>

		<br/>
		<br/>

		<div class="container">
			<div class="left_section">
				<span class="section_title">
					What does it feature?
				</span>

				<span class="section_text">
					<ul>
						<li>
							Unintuitive puzzles that will make you shout at your monitor.
						</li>
						<br/>
						<li>
							Dynamic narration by <span class="jeffbutton" id="jeff"><a>Johnny Utah</a></span> throughout the whole experience playing the malefic programmer and creator of Joe. If you try to break the game, he\'ll know, and he\'ll call you out on it!
						</li>
						<br/>
						<li>
							Short & funny story campaign that presents the  game mechanics and politely ends without  unnecessary fillers. No cinematics, no achievements, pure gameplay!
						</li>
						<br/>
						<li>
							User friendly level editor that allows you to quickly create levels with your own voice lines  and graphics. Full modding support including tutorials and documentation!
						</li>
						<br/>
						<li>
							Humor darker than #000000.
						</li>
						<br/>
						<li>
							Experimental game modes including some multiplayer ones. More reasons to rage with your friends, remember Mario Party and Uther Party from War3? We got that!
						</li>
						<br/>
						<li>
							A story that will make you question the meaning of life!
						</li>
					</ul>
				</span>
			</div>

			<div class="image_block">
				<img src="' . $this->basePath . 'Theme/Images/Index/whatdoesitfeature.jpg" style="padding-top: 25px">
			</div>
		</div>
		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>
		<br/>

		<div class="awesome_review_single">
			<span class="awesome_review_text_container">
				<span class="awesome_review_text_single">
					"That\'s very sweet dear."
				</span>
				<br/>
				<span class="awesome_review_text_author">
					Developer\'s Mom
				</span>
			</span>
		</div>

		<br/>
		<br/>

		<div class="container" style="text-align: center;">
			<span class="section_title">
				Why am I asking so many questions?
			</span>
			<br/>
			<br/>
			<span class="section_text">
				We don\'t know... But we can tell you that the game is going to come out sometime in 2014.<br/>
				Until then, check out the <a href="\earlyaccess" target="_blank">Early Access</a> page and the <a href="\devblog" target="_blank">Devblog</a> to see what happens behind the scenes!<br/>
				Also, come say hi on the <a href="\community" target="_blank">Forums</a>.<br/><br/>
				And don\'t forget to be awesome!
			</span>
		</div>

		<br/>
		<br/>

		<span id="share_area">
					<a href="https://www.facebook.com/concernedjoe" target="_blank"><input type="image" class="multi_line_image"
		 src="' . $this->basePath . 'Theme/Images/Index/facebookN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Index/facebookO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Index/facebookN.png\'"></a>
					<a href="https://twitter.com/concernedjoe" target="_blank"><input type="image" class="multi_line_image"
		src="' . $this->basePath . 'Theme/Images/Index/twitterN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Index/twitterO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Index/twitterN.png\'"></a>
					<a href="http://www.indiedb.com/games/concerned-joe" target="_blank"><input type="image" class="multi_line_image"
		src="' . $this->basePath . 'Theme/Images/Index/indiedbN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Index/indiedbO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Index/indiedbN.png\'"></a>
					<a href="/contact" target="_blank"><input type="image" class="multi_line_image"
		 src="' . $this->basePath . 'Theme/Images/Index/mailN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Index/mailO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Index/mailN.png\'"></a>
		</span>	

		<br/><br/><br/>
');

	}

}