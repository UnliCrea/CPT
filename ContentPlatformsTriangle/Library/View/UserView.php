<?php

namespace View;

class UserView extends GenericView implements UserViewInterface {

	public $Username = "";
	public $hasEarlyAccess = false;
	public $Email = "";
	public $Website = "";
	public $Location = "";
	public $Occupation = "";
	public $BirthDate = "";
	public $About = "";
	public $Signature = "";
	public $ReplyNotification = false;
	public $NewBlogPostNotification = false;
	private $Errors = array();
	private $Great = array();
	
	public function __construct() {

		$this->addCSS('Account');
		$this->addCSS('jquery-ui-1.10.4.custom.min');
		$this->addCSS('Fields');
		$this->addJS('jquery-ui-1.10.4.custom.min');
		$this->addJS('jquery-wallform');
		$this->addJS('Account');
		$this->setPageName('Account Settings');
	}

	public function initContent() {

		$content =
'<div id="joe_title">
	<span id="joe_title_text">
		Account Settings
	</span>

	<br/>

	<span id="joe_subtitle_text">
		Customize it, make it pretty!
	</span>
</div>

<br/>
		
<div class="settings">

	<form id="avatarUploadForm" method="post" enctype="multipart/form-data" action="user/ajaxAvatarUpload">
		<input type="file" name="avatar" id="avatarInput" />
	</form>

	<div class="ErrorText">
		<ul id="ErrorTextList">
';

		foreach ($this->Errors as $element) {
			$content .=
'			<li>' . $element . '</li>
';
		}

	$content .=
'		</ul>
	</div><br/>


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

	<form id="AccountForm" method="post">

		<span id="category">Essentials</span>

		<br/>
		<br/>

		<div class="form">

			<span class="subtitle">Username: </span>
			<span class="fixedData" id="user">' . $this->Username . '</span>

			<br/>
			<br/>

			<span class="subtitle">Early Access: </span>
			<span class="fixedData" '; 	if($this->hasEarlyAccess == false) { $content .= 'id="redtext">Nope :(
										<a href="' . $this->basePath . 'earlyaccess">(but you can fix this)</a>'; }
										else if($this->hasEarlyAccess == true) { $content .= 'id="greentext">Yup <3'; }
																												$content .= '</span>

			<br/>
			<br/>

			<span class="subtitle">E-mail</span>
			<br/>
			<span id="MyTest" currentEmail="'. $this->Email .'">
			'.$this->Email.'
			</span><br>
			<div id="changeemail" class="GreenSubmitButtonLong">Change E-Mail</div>
			<br/>
			<br/>

			<span class="subtitle">Password</span>
			<span id="PassFields">
			
			</span>
			<br>
			<div id="changepassword" class="GreenSubmitButtonLong">Change Password</div>
			<br/>
			<br/>

			<span class="subtitle">Avatar</span>
			<br/>
			<img id="AvatarImage" src="' . $this->AvatarLink . '">
			<div id="UploadThing"><div id="UploadAvatarButton" class="GreenSubmitButtonLong">Change Avatar</div>
			<span class="disclaimer"><p>JPG,PNG,BMP,GIF Avatars will be resized to 100x100. Max 200kb</p></span>
			</div>
			<input type="hidden" name="avatarPicID" id="avatarPicID" />

		</div>

		<span id="category">Extras</span>

		<br/>
		<br/>

		<div class="form">

			<span class="subtitle">Website</span>
			<br/>
			<input type="text" name="WebsiteField" value="' . $this->Website . '" />

			<br/>
			<br/>

			<span class="subtitle">Location</span>
			<br/>
			<input type="text" name="LocationField" value="' . $this->Location . '" />

			<br/>
			<br/>

			<span class="subtitle">Occupation</span>
			<br/>
			<input type="text" name="OccupationField" value="' . $this->Occupation . '" />

			<br/>
			<br/>

			<span class="subtitle">Birth Date</span>
			<br/>
			<input type="text" name="BirthDateField" id="BirthDateField" value="' . $this->BirthDate . '" />

			<br/>
			<br/>

			<span class="subtitle">A little about yourself</span>
			<br/>
			<textarea name="AboutField" rows="3" cols="70">' . $this->About . '</textarea>

			<br/>
			<br/>

			<span class="subtitle">Forum Signature</span>
			<br/>
			<textarea name="SignatureField" rows="3" cols="70">' . $this->Signature . '</textarea>

			<br/>
			<br/>

			<span class="subtitle"><input type="checkbox" name="CommentNotify"';
			if($this->ReplyNotification) { $content .= ' checked="checked"'; } $content .= '>Notify me when somebody posts in the same thread as me or replies to my comment</span>

			<br/>
			<br/>

			<span class="subtitle"><input type="checkbox" name="NewBlogPostNotification"';
			if($this->NewBlogPostNotification) { $content .= ' checked="checked"'; } $content .= '>Notify me when there is a new devblog post</span></span>
		
			<input style="float:right;" type="submit" value="Submit Changes" class="GreenSubmitButtonLong">
			
		</div>

		<input type="hidden" name="AccountPageSubmitVar">

	</form>
		
</div>

<div style="clear: left; margin-bottom: 50px;"></div>

<br/><br/><br/><br/>
';

	$this->setContent($content);

	}

	public function addError($Error) {
		return array_push($this->Errors, $Error);
	}
	public function addGreat($Great){
		return array_push($this->Great,$Great);
	}

}