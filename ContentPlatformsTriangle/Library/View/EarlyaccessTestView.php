<?php

namespace View;

class EarlyaccessTestView extends GenericView
{

	public $passesLeft;

	public function __construct() {

		$this->addCSS('EarlyAccess');
		$this->addJS('https://www.paypalobjects.com/js/external/dg.js');
		$this->addJS('EarlyAccess');
		$this->setPageName('Early Access');
	}

	public function setPaymentNotification($mode) {

		if($mode == 1) {

			$this->AdditionalLightBoxContent = 

		'<div id="PaymentSuccessful" class="LightContainerElement GenericLightBox PaymentPopup">

			<div class="BoxContent">

				<div class="ExitButton"></div>

				<div class="Title">Payment Successful!</div>

				<p>Your payment was successful! Early Access is now binded to your account.<br /><br />

				Visit the Early Access page or click on the Awesome button to download the game!</p>

				<div id="LowerHalf">

					<div id="RightSide">
						<a href="./"><input type="submit" value="Awesome" id="PayPalAwesomeButton" name="PayPalAwesomeButton"></a>
					</div>

				</div>

			</div>

		</div>';
		}
		else if($mode == 2) {

			$content =

		'<div id="PaymentError" class="LightContainerElement GenericLightBox PaymentPopup">

			<div class="BoxContent">

				<div class="ExitButton"></div>

				<div class="Title">Oops, something went wrong</div>

				<p>';
				if(isset($_SESSION['PaymentError']) && !is_null($_SESSION['PaymentError'])) { $content .= $_SESSION['PaymentError'];
																								$_SESSION['PaymentError'] = null; }
				else { $content .= 'Unknown error occured. (Oops...)'; } $content .= '</p>

			</div>

		</div>';

			$this->AdditionalLightBoxContent = $content;
		}
	}

	public function initContent() {

		$content =
'<div id="joe_title">
			<span id="joe_title_text">
				Feel like playing Joe right now? BUT YOU\'RE NOT \'CAUSE YOU\'RE XELU AND YOU\'RE TESTING!
			</span>
			<br/>
			<span id="joe_subtitle_text">
				Amjad loves you <3
			</span>
		</div>

		<br/>

		<div class="container">
			<div class="left_section">
				<span class="section_title">
					What do I get?
				</span>

				<span class="section_text">
				   <ul>
						<li>
							Instant access to the game as it\'s developed.
						</li>
						<li>
							Full game once it\'s released. (Steam)
						</li>
						<li>
							Unlock secret "Early Access" forum section.
						</li>
						<li>
							Constant updates as the game is developed.
						</li>
						 <li>
							Real time chat with the developers.
						</li>
						<li>
							Be part of the development process.
						</li>
						<li>
							That fuzzy feeling of helping a small indie team.
						</li>
					</ul>
				</span>
				<br>
				<span class="section_text red">
				   <p>
					Keep in mind, this is NOT a finished product!
				   </p>
				</span>
				<span class="section_text">
				   <p>
					We highly suggest you take a look at the <a href="/state" target="_blank">state of the game</a> and <a href="/faq" target="_blank">FAQ</a> page before going on.
				   </p>
				   <p>
					Once purchased, you will get a download link to the game\'s launcher which will automatically download and keep the game up to date for you.
				   </p>
				</span>
			</div>

			<div class="image_block_right">
				<iframe width="500" height="281" src="//www.youtube.com/embed/L5GiWW5qhko?rel=0&wmode=transparent" frameborder="0" allowfullscreen></iframe>

				<div id="Payment">

					<form id="PaymentForm" action=\'earlyaccess/PayPalInitiate\' METHOD=\'POST\'>
						<a href="/itch/claim/"><div id="ClaimButton"></div></a>
						<input type="submit" id="PaypalButton" value=""'; if($this->passesLeft <= 0) { $content .= ' class="Locked"'; }
																			else if(isset($_SESSION['Username'])) { $content .= ' class="LoggedIn"'; } $content .= '>
						<input type="text" name="PriceField" id="PriceField" value="5" disabled>';
						/* if($this->passesLeft <= 0) { $content .= ' disabled'; } $content .= '> */ $content .= '
					</form>

					<div id="PaymentTextDiv">

						'; if($this->passesLeft <= 0) { $content .= '<p id="ResponseField" class="Red">No Early Access passes left, check again soon</p>'; }

						else { $content .= '<p id="PassesLeft">' . $this->passesLeft; if($this->passesLeft == 1) { $content .= ' Pass left'; } else { $content .= ' Passes left'; } $content .= '.</p>
						<p id="ResponseField"'; if(!isset($_SESSION['Username'])) { $content .= ' class="Black"'; } $content .= '>';
						if(!isset($_SESSION['Username'])) { $content .= 'You have to be logged in.'; }
						$content .= '</p>'; }

						$content .= '

					</div>

				</div>

			</div>

		</div>
		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>

		<div class="TipHover">
		<div class="awesome_review_single">
				<span class="fakelink">
						You have the option to bump your price if you feel generous. The money is going straight into<br/>
						making the game better, anything above the initial price is considered a lovely donation.
				</span>
				<br/>
				<br/>
				<span class="awesome_review_text_small">
					<p>The purpose of the Early Access plan is to get the game out to the fans. Yes, you, we need your feedback! We want you to be part of<br/>
					the development process and that\'s why we designed the Early Access around communication. Once you unlock it, first, you\'ll get the<br/>
					game which you can fiddle with, you can even create your own content and share it with others! Second, you can talk with us directly<br/>
					and with other users who have the game on the  forums! The price is merely a symbol of being sure we can trust you with the early,<br/>
					raw build of the game. It might go up as we get close to the release date. Thank you for being awesome! By either purchasing<br/>
					Early Access or running any version of the game you accept that you will not distribute or resell any copies of the game.</br/>
					There are no refunds. If you have any questions or problem regarding Early Access, send us an email or use our contact form.</p>
				</span>

				<center>
					<span class="TipContent">
						The money we get from early access goes directly into making the game more awesome, this means paying<br/>
						musicians, sound engineers, voice actors, etc to do a better job! Of course we could finish the entire<br/>
						game through favors and people we know, (and we are still trying to do that), but that takes a lot of<br/>
						time and people work way faster when they are motivated by something else than just "good will".<br/>
						<br/>
						We love it when other developers mention exactly what they do with the money they get<br/>
						and we just felt the need to let you know that every penny goes into making Joe more awesome!
					</span>
				</center>
			</div>
		</div>

		<div style="clear: left;"></div>

		<br/><br/>
';

		$this->setContent($content);

	}

}