<?php

namespace View;

class GenericView implements GenericViewInterface {

	public $parent;
	protected $AvatarLink;
	protected $pageName = 'Index';
	protected $basePath = '/';
	private $CSSFiles = array('bootstrap2','fonts','Style', 'HeaderFooter');
	private $JSFiles = array('jquery-2.0.3.min', 'General', 'jquery-ui-1.10.4.custom.min','FancyCaptcha2','bootstrap.min');
	private $content = '';
	protected $AdditionalLightBoxContent = '';
	private $showRegistrationBox;

	public function setParent($parent) {
		$this->parent = $parent;
	}

	public function addCSS($fileName) {
		array_push($this->CSSFiles, $fileName);
	}

	public function addJS($fileName) {

		array_push($this->JSFiles, $fileName);
	}

	protected function setContent($content) {

		$this->content = $content;
	}

	protected function setPageName($pageName) {
		$this->pageName = $pageName;
	}

	public function run() {

		$returnValue = $this->header();
		$returnValue .= $this->content;
		$returnValue .= $this->footer();

		return $returnValue;
	}

	public function setAdditionalLightBoxContent($content) {

		$this->AdditionalLightBoxContent = $content;
	}

	private function HeaderColor($pageName) {

		switch($pageName) {
			case 'Home':
				return '#DA4837';
				break;
			case 'About':
				return '#00C6F2';
				break;
			case 'Early Access':
				return '#00C63C';
				break;
			case 'FAQ':
				return '#A564F2';
				break;
			case 'Community':
				return '#FFB733';
				break;
			case 'Devblog':
				return '#4F4F4F';
				break;
			case 'Login':
				return '#FFB733';
				break;
			case 'Register':
				return '#FFB733';
				break;
			case 'Account Settings':
				return '#FFB733';
				break;
			case 'Contact':
				return '#FFB733';
				break;
			case 'Download':
				return '#00C63C';
				break;
			case 'History':
				return '#A564F2';
				break;
			case 'Welcome':
				return '#00C63C';
				break;
			case 'ClaimFail':
				return '#DA4837';
				break;
			default:
				return '#2564B3';
				return false;
		}
	}

	private function header() {

		$content =
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head profile="http://www.w3.org/2005/10/profile"><title>Concerned Joe | ' . $this->pageName . '</title>

<link rel="icon" 
      type="image/png" 
      href="http://concernedjoe.com/analytics/favicon.ico">
';

		foreach ($this->CSSFiles as $fileName) {

			$content .= '<link rel="stylesheet" type="text/css" href="';

			if ( strpos($fileName , 'http') !== false ) {
			    $content .= $fileName . '" ></script>
';
			}
			else {
				$content .= $this->basePath . 'Theme/CSS/' . $fileName . '.css" />
';
			}

		}

		foreach ($this->JSFiles as $fileName) {

			$content .= '<script type="text/javascript" src="';

			if ( strpos($fileName , 'http') !== false ) {
			    $content .= $fileName . '" ></script>
';
			}
			else {
				$content .= $this->basePath . 'Theme/JavaScript/' . $fileName . '.js" ></script>
';
			}
		}

		$this->showRegistrationBox = false;

		if(isset($_POST['RegistrationSubmitVar'])) {

			if(isset($_POST['RegistrationPasswordField']) && !isset($_POST['RegistrationConfirmPasswordField'])) {
				$_POST['RegistrationPasswordField'] = '';
			} else if(!isset($_POST['RegistrationPasswordField']) && isset($_POST['RegistrationConfirmPasswordField'])) {
				$_POST['RegistrationConfirmPasswordField'] = '';
			}
			else if(isset($_POST['RegistrationPasswordField']) && isset($_POST['RegistrationConfirmPasswordField'])
				&& $_POST['RegistrationPasswordField'] != $_POST['RegistrationConfirmPasswordField']) {
					$_POST['RegistrationConfirmPasswordField'] = '';
			}

			if($_SESSION['RegistrationUsernameFound'] == true || $_SESSION['RegistrationEmailFound'] == true || $_SESSION['IncorrectCaptcha'] || $_SESSION['InvalidEmail'] == true || $_SESSION['UserTooLong'] == true || $_SESSION['UserNoSymbols'] == true) {
				$this->showRegistrationBox = true;
			} else {
				foreach ($_POST as $key => $value) {
					if(is_null($value) || !($value) || $value == "") {
						$this->showRegistrationBox = true;
						break;
					}
				}
			}

		}

		$content .= 
'<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["trackPageView"]);
  _paq.push(["enableLinkTracking"]);

  (function() {
    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://concernedjoe.com/analytics/";
    _paq.push(["setTrackerUrl", u+"piwik.php"]);
    _paq.push(["setSiteId", "1"]);
    var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
    g.defer=true; g.async=true; g.src=u+"piwik.js"; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Piwik Code -->
</head>' . '

<body>

' . $this->pureHeader('normal') . '

<div id="Container">
';

		return $content;
	}

	public function footer() {
		
		return
'

<div id="FooterContainer">

	<div id="FooterContent">
		<span id="Copyrights">"Concerned Joe" is developed by "<a href="http://thoseawesomeguys.com" target="_blank">Those Awesome Guys</a>". Site by <a href="http://unlicrea.com" target="_blank">Nav</a>.</span>

			<span id="ButtonsContainer">
				<span class="FooterButton"><a href="/patchnotes">Patch Notes</a></span>
				<span class="FooterButton"><a href="/state">Game State</a></span>
				<span class="FooterButton"><a href="/livestream">Livestream</a></span>
				<span class="FooterButton"><a href="/presskit">Presskit</a></span>
				<span class="FooterButton"><a href="/contact">Contact</a></span>
			</span>
	</div>

</div>

</div>

</body>';
	}

	public function pureHeader($mode) {

		if($mode == 'Community') { $this->pageName = 'Community'; } else if($mode == 'Devblog') { $this->pageName = 'Devblog'; }

		if($this->pageName != "Register" && $this->pageName != "Login" && $this->pageName != "Contact"){
			$captchaHTML =  '<div id="Generic"><div class="ajax-fc-container"></div></div>';
		}

		$MobileDetectInstant = new \Model\MobileDetect();
		$isMobile = $MobileDetectInstant->isMobile();
		
		$content = '<script type="text/javascript">
 var RecaptchaOptions = {
    theme : "clean"
 };
 </script>

<noscript><!-- Piwik Image Tracker -->
<img src="http://concernedjoe.com/analytics/piwik.php?idsite=1&amp;rec=1" style="border:0" alt="" />
<!-- End Piwik --></noscript>
 
		<style type="text/css">
#Header #HeaderTable td.active .HeaderTableLink { color: ' . $this->HeaderColor($this->pageName) . '; }
</style>

<div id="TheLightsContainer">

	<div id="LightsContentContainer">

		<div id="RegistrationBox" class="LightContainerElement GenericLightBox'; if($this->showRegistrationBox == true) { $content .= ' fieldsMissing'; }
																$content .= '">

			<div class="BoxContent">

				<form id="RegistrationBoxForm" method="POST" action="/">

					<div class="ExitButton"></div>
					
					<div class="Title">Sign Up</div><br>

					<div id="RegistrationBoxAlert" class="Alert">';
					if($_SESSION['RegistrationUsernameFound'] == true) { $content .= "Username exists. "; }
					if($_SESSION['IncorrectCaptcha'] == true) { $content .="Bad Captcha. ";}
					if($_SESSION['InvalidEmail'] == true) { $content .="Invalid Email. ";}
					if($_SESSION['UserTooLong'] == true) { $content .="Username too long";}
					if($_SESSION['UserNoSymbols'] == true) { $content .="Username shouldn't contain symbols";} /* ~`!@#)(*&^%$ \/ */
					if($_SESSION['RegistrationEmailFound']) { if($_SESSION['RegistrationUsernameFound']) { $content .= ''; } $content .= 'E-mail exists. '; }
																	$content .= '</div><br><br>

					<div class="FieldsBundle">

						<input type="text" id="RegistrationUsernameField" name="RegistrationUsernameField" placeholder="Username"'; if(isset($_POST['RegistrationSubmitVar'])) { if(is_null($_POST['RegistrationUsernameField']) ||
																						!($_POST['RegistrationUsernameField']) ||
																						$_POST['RegistrationUsernameField'] == "") { $content .= ' class="missing"'; }
																					else { $content .= ' value="' . $_POST['RegistrationUsernameField'] . '"'; } }
			
																																$content .= '>
					</div>

					<div class="FieldsBundle">
						
						<input type="text" id="RegistrationEmailField" name="RegistrationEmailField" placeholder="E-mail"'; if(isset($_POST['RegistrationSubmitVar'])) { if(is_null($_POST['RegistrationEmailField']) ||
																						!($_POST['RegistrationEmailField']) ||
																						$_POST['RegistrationEmailField'] == "") { $content .= ' class="missing"'; }
																					else { $content .= ' value="' . $_POST['RegistrationEmailField'] . '"'; } }
			
																																$content .= '>
					</div>

					<div class="FieldsBundle">
						
						<input type="password" id="RegistrationPasswordField" name="RegistrationPasswordField" placeholder="Password"'; if(isset($_POST['RegistrationSubmitVar'])) { if(is_null($_POST['RegistrationEmailField']) ||
																						!($_POST['RegistrationEmailField']) ||
																						$_POST['RegistrationEmailField'] == "") { $content .= ' class="missing"'; } }
			
																																$content .= '><br />

						<input type="password" id="RegistrationConfirmPasswordField" name="RegistrationConfirmPasswordField" placeholder="Confirm"'; if(isset($_POST['RegistrationSubmitVar'])) { if(is_null($_POST['RegistrationEmailField']) ||
																						!($_POST['RegistrationEmailField']) ||
																						$_POST['RegistrationEmailField'] == "") { $content .= ' class="missing"'; } }
			
																																$content .= '>
						<input type="hidden" name="RegistrationSubmitVar">
						
						'. $captchaHTML.'
						
					</div>
					
					<div id="LowerHalf">
						<div id="LeftSide">
							This will create an account that allows you to unlock Early Access, post comments on the devblog and also on the forums.
						</div>

						<div id="RightSide">
							<input type="submit" value="Register" class="GreenSubmitButton">
						</div>

					</div>
					
				</form>
			
			</div>

		</div>

		<div id="LoginBox" class="LightContainerElement GenericLightBox'; if(isset($_SESSION['LoginWrongCreds']) && $_SESSION['LoginWrongCreds'] == true) { $content .= ' fieldsMissing'; }
																$content .= '">

			<div class="BoxContent">

				<form id="LoginBoxForm" method="POST">

					<div class="ExitButton"></div>

					<div class="Title">Login</div>

					<div id="LoginBoxAlert" class="Alert">'; if(isset($_SESSION['LoginWrongCreds']) && $_SESSION['LoginWrongCreds'] == true) { $content .= 'Bad User and password.'; }
																$content .= '</div><br><br><br>

					<div class="FieldsBundle">
						<input type="text" id="LoginUsernameField" name="LoginUsernameField" placeholder="Username"'; if(isset($_POST['LoginSubmitButton'])) { if(is_null($_POST['LoginUsernameField']) ||
																						!($_POST['LoginUsernameField']) ||
																						$_POST['LoginUsernameField'] == "") { $content .= ' class="missing"'; }
																					else { $content .= ' value="' . $_POST['LoginUsernameField'] . '"'; } }
			
																																$content .= '>
					</div>

					<div class="FieldsBundle">
						<input type="password" id="LoginPasswordField" name="LoginPasswordField" placeholder="Password"'; if(isset($_POST['LoginSubmitButton'])) { if(is_null($_POST['LoginPasswordField']) ||
																						!($_POST['LoginPasswordField']) ||
																						$_POST['LoginPasswordField'] == "") { $content .= ' class="missing"'; } }
			
																																$content .= '><br />
					</div>

					<input type="hidden" name="LoginSubmitVar">

					<div id="LowerHalf">

						<div id="LeftSide">
							<div id="Links"><a href="/forgetpassword">Forgot password?</a> - <a href="#" class="SignUpLink">Sign up!</a></div>
							You can use your account to unlock Early Access, and also post comments on the devblog and on the forums.
						</div>

						<div id="RightSide">
							<input type="submit" value="Log In" id="LoginSubmitButton" class="GreenSubmitButton">
						</div>

					</div>

				</form>

			</div>
		</div>

		' . $this->AdditionalLightBoxContent . '

	</div>

<div id="TheLights"></div>

</div>

	<div class="navbar-wrapper'; if($isMobile) { $content .= ' mobile'; }
															$content .= '" id="bootstrapcontainer">
      <div class="container2">
<!--       Set background color here for header -->
        <div class="navbar navbar-default navbar-fixed-top" style=" background-color: ' . $this->HeaderColor($this->pageName) . ';" role="navigation">
          <div class="container2">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"></a>
            </div>
            <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li id = "home" class="';
				if($this->pageName == 'Home'){ $content .= 'active';} else{$content .= 'home';}
				$content .= '"><a href="' . $this->basePath . '">Home</a></li> 
                <li id = "about" class="';
				if($this->pageName == 'About'){ $content .= 'active';} else{$content .= 'about';}
				$content .= '"><a  href="' . $this->basePath . 'about">About Us</a></li>
                <li id = "early" class="';
				if($this->pageName == 'Early Access'){ $content .= 'active';} else{$content .= 'early';}
				$content .= '"><a href="' . $this->basePath . 'earlyaccess">Early Access</a></li>
                <li id = "devblog" class="';
				if($this->pageName == 'Devblog'){ $content .= 'active';} else{$content .= 'devblog';}
				$content .= '"><a href="' . $this->basePath . 'devblog">Devblog</a></li>
                <li id = "community" class="';
				if($this->pageName == 'Community'){ $content .= 'active';} else{$content .= 'community';}
				$content .= '"><a href="' . $this->basePath . 'community">Community</a></li>
                <li id = "faq" class="';
				if($this->pageName == 'FAQ'){ $content .= 'active';} else{$content .= 'faq';}
				$content .= '"><a href="' . $this->basePath . 'faq">faq</a></li>
              
              </ul>
               <ul class="nav navbar-nav navbar-right">
			   '; if(isset($_SESSION['Username'])) { //if logged in, display username, message and logout
					$content .= '
					<li class="profile"><a href="' . $this->basePath . 'user">
					<span id="UsernameSpan">';
					$user = $_SESSION['Username'];
					$content .= $user . '
					</span>
					<img src="' . $this->AvatarLink . '" id="headerProfileImage"></a></li>
					<li class="message"><a href="' . $this->basePath . 'community/ucp.php"><div id="The';
					if(isset($_SESSION['NewPM']) && $_SESSION['NewPM']) { $content .= 'New'; }
					$content .='Message"></div></a></li>
					<li class="logout"><a href="' . $this->basePath . 'logout">Log Out</a></li>
					';
				} else { //just display login and signup :( 
					$content .= '
					<li class="login" id="TheLogin"><a href="#">Login</a></li>
					<li class="signup" id="TheRegister"><a href="#">Signup</a></li>';
					}
         $content .= '
      </ul>
            </div>
          </div>
        </div>

      </div>
    </div>

';

		$_SESSION['LoginWrongCreds'] = null;
		$_SESSION['RegistrationUsernameFound'] = null;
		$_SESSION['RegistrationEmailFound'] = null;
		$_SESSION['IncorrectCaptcha'] = null;
		$_SESSION['InvalidEmail'] = null;
		$_SESSION['UserTooLong'] = null;
		$_SESSION['UserNoSymbols'] = null;
		return $content;
	}

	public function setAvatarLink($AvatarLink) {
		$this->AvatarLink = $AvatarLink;
	}

}