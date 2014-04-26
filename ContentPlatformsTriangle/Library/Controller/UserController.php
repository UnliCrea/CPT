<?php

namespace Controller;

class UserController extends GenericController implements UserControllerInterface {
	
	public function index() {

		/* Start checking if user is logged in, and setting UserID accordingly */

		$UserID = false;

		if(isset($_SESSION['Username']) && !empty($_SESSION['Username'])) {
			$UserID = \Model\UserOperationsModel::IDFromUsername($_SESSION['Username']);
		}

		if(!$UserID) {
			header("Location:/login/");
		}

		$Username = $_SESSION['Username'];

		/* End checking if user is logged in, and setting UserID accordingly */

		///////////////////////////////////////////////////////////////////////

		/* Start setting variables */

		$phpBBUserID = \Model\UserOperationsModel::phpBBUserIDFromUsername($_SESSION['Username']);
		$wordPressUserID = \Model\UserOperationsModel::wordPressIDFromUsername($_SESSION['Username']);

		$hasEarlyAccess = \Model\UserOperationsModel::ownsEarlyAccessLicense($UserID);
		$Email = \Model\UserOperationsModel::EmailFromID($UserID);
		$Website = \Model\UserOperationsModel::getPhpBBUserWebsite();
		$Location = \Model\UserOperationsModel::getPhpBBUserLocation();
		$Occupation = \Model\UserOperationsModel::getPhpBBUserOccupation();
		$BirthDate = \Model\UserOperationsModel::getPhpBBUserBirthDateArray();
		$BirthDate = implode('-', $BirthDate);
		if(strtotime($BirthDate) != false) { $BirthDate = date("j M Y", strtotime($BirthDate)); }
		$About = \Model\UserOperationsModel::getPhpBBUserAbout();
		$Signature = \Model\UserOperationsModel::getPhpBBUserSignature();
		$ReplyNotification = \Model\UserOperationsModel::getUserCommentNotifyValueFromUserID($UserID);
		$ReplyNotification = $ReplyNotification == "1" ? true : false;
		$NewBlogPostNotification = \Model\UserOperationsModel::getUserNewBlogPostNotifyValueFromUserID($UserID);
		$NewBlogPostNotification = $NewBlogPostNotification == "1" ? true : false;
		$AvatarImageSrc = \Model\UserOperationsModel::getUserAvatarLinkFromUserID($UserID);

		$myView = new \View\UserView();
		$hasError = false;

		/* End setting variables */

		///////////////////////////

		/* Start checking E-mail $_POST data and updating accordingly */

		if(isset($_POST['AccountPageSubmitVar'])) {

			/* End checking E-mail $_POST data and updating accordingly */

			//////////////////////////////////////////////////////////////

			/* Start checking Password $_POST data and updating accordingly */

			if( isset($_POST['OldPasswordField']) && !empty($_POST['OldPasswordField']) &&
				isset($_POST['NewPasswordField']) && !empty($_POST['NewPasswordField']) ) {

				$OldPassword = stripslashes($_POST['OldPasswordField']);
				$NewPassword = stripslashes($_POST['NewPasswordField']);
				if( $_POST['OldPasswordField'] != $NewPassword &&
					\Model\UserOperationsModel::checkCredentials($_SESSION['Username'], $OldPassword) )
				{
					if($_POST['NewPasswordField'] == $_POST['ConfirmPasswordField'] ){
						\Model\UserOperationsModel::updateMainPasswordForUserWithID($UserID, $NewPassword);
						\Model\UserOperationsModel::updateWordPressPasswordForUserWithID($wordPressUserID, $NewPassword);
						\Model\UserOperationsModel::updatePhpBBPasswordForUserWithID($phpBBUserID, $NewPassword);
					}
					else{
						
						$myView->addError("Passwords don't match");
						$hasError = true;
					}
				} else {
					$myView->addError('Old password is wrong');
					$hasError = true;
				}
			}

			/* End checking Password $_POST data and updating accordingly */

			////////////////////////////////////////////////////////////////

			/* Start checking Birth Date $_POST data and updating accordingly */

			if( isset($_POST['BirthDateField']) && !empty($_POST['BirthDateField']) ) {

				$NewBirthTime = strtotime($_POST['BirthDateField']);

				if($NewBirthTime != false) {

					$BirthDate = $_POST['BirthDateField'];
					\Model\UserOperationsModel::updatePhpBBBirthdayForUserWithID($phpBBUserID, $NewBirthTime);
				}

			} 

			/* End checking Birth Date $_POST data and updating accordingly */

			//////////////////////////////////////////////////////////////////

			/* Start checking Website $_POST data and updating accordingly */

			if( isset($_POST['WebsiteField']) && !empty($_POST['WebsiteField']) ) {

				$NewWebsite = stripslashes($_POST['WebsiteField']);
				$NewWebsite = htmlentities($NewWebsite);

				if( \Model\UserOperationsModel::ValidateWebsite($NewWebsite) ) { //To be done

					$Website = $NewWebsite;
					\Model\UserOperationsModel::updatePhpBBWebsiteForUserWithID($phpBBUserID, $NewWebsite);
					\Model\UserOperationsModel::updateWordPressWebsiteForUserWithID($wordPressUserID, $NewWebsite);
				} else {
					$myView->addError('Website is invalid');
					$hasError = true;
				}

			}

			/* End checking Website $_POST data and updating accordingly */

			///////////////////////////////////////////////////////////////

			/* Start checking Location $_POST and updating accordingly */

			if( isset($_POST['LocationField']) && !empty($_POST['LocationField']) ) {

				$Location = stripslashes($_POST['LocationField']);
				$Location = htmlentities($Location);
				\Model\UserOperationsModel::updatePhpBBLocationForUserWithID($phpBBUserID, $Location);
			}

			/* End checking Location $_POST and updating accordingly */

			///////////////////////////////////////////////////////////

			/* Start checking Occupation $_POST data and updating accordingly */

			if( isset($_POST['OccupationField']) && !empty($_POST['OccupationField']) ) {

				$Occupation = stripslashes($_POST['OccupationField']);
				$Occupation = htmlentities($Occupation);
				\Model\UserOperationsModel::updatePhpBBOccupationForUserWithID($phpBBUserID, $Occupation);
			}

			/* End checking Occupation $_POST data and updating accordingly */

			//////////////////////////////////////////////////////////////////

			/* Start checking About $_POST data and updating accordingly */

			if( isset($_POST['AboutField']) && !empty($_POST['AboutField']) ) {

				$About = stripslashes($_POST['AboutField']);
				$About = htmlentities($About);
				\Model\UserOperationsModel::updatePhpBBAboutForUserWithID($phpBBUserID, $About);
				\Model\UserOperationsModel::updateWordPressAboutForUserWithID($wordPressUserID, $About);
			}

			/* End checking About $_POST data and updating accordingly */

			/////////////////////////////////////////////////////////////

			/* Start checking Signature $_POST data and updating accordingly */

			if( isset($_POST['SignatureField']) && !empty($_POST['SignatureField']) ) {

				$Signature = stripslashes($_POST['SignatureField']);
				$Signature = htmlentities($Signature);
				\Model\UserOperationsModel::updatePhpBBSignatureForUserWithID($phpBBUserID, $Signature);
			}

			/* End checking Sigature $_POST data and updating accordingly */

			////////////////////////////////////////////////////////////////

			/* Start checking Comment Notification $_POST data and updating accordingly */

			if( isset($_POST['CommentNotify']) ) {
				$ReplyNotification = true;
				\Model\UserOperationsModel::updateCommentNotifyStatusForUserWithID($UserID, true);
			} else {
				$ReplyNotification = false;
				\Model\UserOperationsModel::updateCommentNotifyStatusForUserWithID($UserID, false);
			}

			/* End checking Comment Notification $_POST data and updating accordingly */

			////////////////////////////////////////////////////////////////////////////

			/* Start checking Comment Notification $_POST data and updating accordingly */

			if( isset($_POST['NewBlogPostNotification']) ) {
				$NewBlogPostNotification = true;
				\Model\UserOperationsModel::updateNewBlogPostNotifyStatusForUserWithID($UserID, true);
			} else {
				$NewBlogPostNotification = false;
				\Model\UserOperationsModel::updateNewBlogPostNotifyStatusForUserWithID($UserID, false);
			}

			/* End checking Comment Notification $_POST data and updating accordingly */

			/* Start checking Avatar $_POST data and updating accordingly */

			if( isset($_POST['avatarPicID']) && !empty($_POST['avatarPicID']) ) {

				$AvatarID = $_POST['avatarPicID'];

				\Model\UserOperationsModel::moveAvatarToPermanentDirectoryAndUpdateDB($UserID, $AvatarID);
				
				$AvatarImageSrc = 'http://concernedjoe.com/Uploads/' . \Model\UserOperationsModel::getAvatarFileNameFromID($AvatarID);
			}
			
			if(isset($_POST['EmailField']) && !empty($_POST['EmailField'])) {

				if(!$_POST['EmailField'] != $Email) {

					if(\Model\UserOperationsModel::ValidateEmail($_POST['EmailField'])) {

						$Email = stripslashes($_POST['EmailField']);
						$Email = htmlentities($Email);

						\Model\UserOperationsModel::updateMainEmail($UserID, $Email);
						\Model\UserOperationsModel::updatePhpBBEmail($phpBBUserID, $Email);
						\Model\UserOperationsModel::updateWordPressEmail($wordPressUserID, $Email);
						\Model\UserOperationsModel::deVerify($UserID); header('Location:' . '/logout?redirect=' . urlencode('/login/send/') . $UserID); die();
					} else {
						$myView->addError('E-mail is invalid');
						$hasError = true;
					}
				}	
			}

			if($hasError !== true){
				$myView->addGreat('Changes submitted!');
			}

		}

		////////////////////////////////////////////////////////////////

		/* Start initiating view */

		$myView->setAvatarLink($AvatarImageSrc);
		$myView->Username = $_SESSION['Username'];
		if($hasEarlyAccess == true) { $myView->hasEarlyAccess = true; }
		$myView->Email = $Email;
		$myView->Website = $Website;
		$myView->Location = $Location;
		$myView->Occupation = $Occupation;
		$myView->BirthDate = $BirthDate;
		$myView->About = $About;
		$myView->Signature = $Signature;
		$myView->ReplyNotification = $ReplyNotification;
		$myView->NewBlogPostNotification = $NewBlogPostNotification;

		$myView->initContent();
		echo $myView->run();

		/* End initiating view */
	}

	public function ajaxAvatarUpload() {

		echo \Model\UserOperationsModel::uploadAvatarToTempDirectory();
	}

	public function navBarWidthAJAX() {
		if(isset($_POST['padding']) && isset($_SESSION['Username']) ) {
			$_SESSION['NavbarPaddingVal'] = $_POST['padding'];
		}
	}

}

?>