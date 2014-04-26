<?php

namespace View;

class ContactView extends GenericView implements ContactViewInterface
{
	private $Errors = array();
	private $Great = array();
	public $hide = false;
	private $content2 = "";

	public function __construct() {

		$this->addCSS('Fields');
		$this->setPageName('Contact');
		$this->addJS('FancyCaptcha');
	}

	public function initContent() {
	
		$defaultEmail = $_POST['email'];
		//if($defaultEmail == '') $defaultEmail = "E-mail";
		
		$defaultName = $_POST['name'];
		//if($defaultName == '') $defaultName = "Name";
		
		$defaultSubject = $_POST['subject'];
		//if($defaultSubject == '') $defaultSubject = "Subject";
		
		$defaultContent = stripslashes($_POST['message']);
		//if($defaultContent == '') $defaultContent = "Content";
		
		//require_once(dirname(__FILE__) . '/../Model/captchachalib.php');
		//$publickey = "6LfeW-4SAAAAAKDvcDU2uYl5vdShE886e_clGaEn"; 
		$captchaHTML =  '<div class="ajax-fc-container"></div>';
		
		$content = 
'<div id="joe_title">
			<span id="joe_title_text">
				Got a question? Or maybe a problem?
			</span>
			<br/>
			<span id="joe_subtitle_text">
				We got you covered! Just shoot us a mail... don\'t actually shoot us though.
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


<div class="GreatText">
		<ul id="GreatTextList">
';

		foreach ($this->Great as $element) {
			$content .=
'			<li>' . $element . '</li>
';
		}

	$content .=
'		</ul>
	</div>
	</center>

		<div class="awesome_review_single">
				<span class="findus">
					<p>
						You can find us at <a href="mailto:contact@thoseawesomeguys.com">contact@thoseawesomeguys.com</a>, or use the form below.
					</p>
				</span>
			</div>
			   <div class="contactform" id = "contactform">
			<form id="FormWithCaptcha" method="POST">

				<input type="hidden" name="ContactSubmitVar">

				<input id="name" type="text" name="name" placeholder="Name" value ="'.$defaultName.'">  <input id="email" type="text" name="email" placeholder="E-mail" value ="'.$defaultEmail.'">
				<br/>
				<input id="subject" type="text" class="longfield" name="subject" placeholder="Subject" value = "'.$defaultSubject.'">
				<br/>
				<textarea id="message" name="message" rows="7" cols="70" placeholder="Content">'.$defaultContent.'</textarea><br>
				
				<div class="contactcaptcha">' . $captchaHTML .'</div><div class="button"><input type="submit" class="GreenSubmitButton" value="Send"> <span class="findus">
					<p>
						You can also find us on <a href="https://www.facebook.com/concernedjoe" target="_blank">Facebook</a> and <a href="https://twitter.com/concernedjoe" target="_blank">Twitter</a>.
					</p>
					</span></div>
			</form>
		</div>
		<br><br><br><br><br><br><br><br>

				<div class="awesome_review_single">
					<span class="disclaimer">
					<p>
					Office Adress: Romania - Bucharest | Str. Sapte Drumuri | Nr. 11 | 031647
					</p>
				</span>
				<br/><br/>
				</div>
';

	$this->setContent($content);
	
	$content2 = '<div id="joe_title">
			<span id="joe_title_text">
				Got a question? Or maybe a problem?
			</span>
			<br/>
			<span id="joe_subtitle_text">
				We got you covered! Just shoot us a mail... don\'t actually shoot us though.
			</span>
		</div>

		<center>
		<div class="ErrorText2">

		<ul id="ErrorText2">
';

		foreach ($this->Errors as $element) {
			$content .=
'			' . $element . '
';
		}

	$content2 .=
'		</ul>


<div class="GreatText">
		<ul id="GreatTextList">
';

		foreach ($this->Great as $element) {
			$content .=
'			' . $element . '
';
		}

	$content2 .=
'		</ul>
	</div>
	</center>

		<div class="awesome_review_single">
				<span class="awesome_review_text">
					<p>
						You can find us at <a href="mailto:contact@thoseawesomeguys.com">contact@thoseawesomeguys.com</a>, or use the form below.
					</p>
				</span>
			</div>			  

				<br/>
				<div class="awesome_review_single">
				<span class="findus">
					<p>
						You can also find us on <a href="https://www.facebook.com/concernedjoe" target="_blank">Facebook</a> and <a href="https://twitter.com/concernedjoe" target="_blank">Twitter</a>.
					</p>
				</span>
				<br/><br/>
				</div>
';
	
	}
	
	public function addError($Error) {
		return array_push($this->Errors, $Error);
	}
	
	public function addGreat($Great){
		return array_push($this->Great,$Great);
	}
	public function hideForms(){
		$this->setContent($content2);
		
	}

}