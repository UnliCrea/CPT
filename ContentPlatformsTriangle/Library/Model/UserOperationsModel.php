<?php

namespace Model;

class UserOperationsModel implements UserOperationsModelInterface {


	/* Start obtaining user info functions */

	public static function IDFromUsername($Username) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE Username = ?");
		$databaseStatement->bindParam(1, $Username);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();
		
		if($row) { return $row['ID']; } else { return false; }
	}

	public static function UsernameFromID($UserID) {

		return self::DBUserDataFromID($UserID, 'Username');
	}

	public static function IDFromEmail($Email) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE Email = ?");
		$databaseStatement->bindParam(1, $Email);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();
		
		if($row) { return $row['ID']; } else { return false; }
	}

	public static function EmailFromID($UserID) {
		return self::DBUserDataFromID($UserID, 'Email');
	}

	public static function phpBBUserIDFromUsername($Username) {

		$link = DBConnectionModel::phpBBDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM phpbb_users WHERE username = ?");
		$databaseStatement->bindParam(1, $Username);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if($row) { return $row['user_id']; } else { return false; }
	}

	public static function wordPressIDFromUsername($Username) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		$WordPressUser = get_user_by( 'login', $Username );
		return $WordPressUser->ID;
	}

	public static function usernameFromWordPressID($WordPressID) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		$WordPressUser = get_user_by( 'id', $WordPressID );
		return $WordPressUser->user_login;
	}

	public static function UserIDFromWordPressUserID($WordPressUserID) {

		$Username = self::usernameFromWordPressID($WordPressUserID);
		return self::IDFromUsername($Username);
	}

	/* End obtaining user info functions */

	///////////////////////////////////////

	/* Start Early Access functions */

	public static function ownsEarlyAccessLicense($UserID) {

		return self::DBUserDataFromID($UserID, 'EarlyAccess');
	}

	public static function grantEarlyAccessLicense($UserID) {

		$link = DBConnectionModel::mainDBLink();
		
		$databaseStatement = $link->prepare("UPDATE Users SET EarlyAccess = 1 WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();

		self::addUserToPhpBBEarlyAccessGroup($UserID);
	}

	public static function addUserToPhpBBEarlyAccessGroup($UserID) {

		$Username = UserOperationsModel::UsernameFromID($UserID);
		
		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);
		$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : $phpBBDirectory;
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');
		require_once($phpBBDirectory . 'includes/functions_user.php');

		$result = group_user_add(10, false, array($Username));	//Group ID, User ID (False as username is provided), Usernames array to be added to group
		if(!$result) return true;
	}

	/* End Early Access functions */

	////////////////////////////////

	/* Start phpBB user data obtaining functions */

	public static function getPhpBBUserWebsite() {

		return self::phpBBUserData('user_website');
	}

	public static function getPhpBBUserLocation() {

		return self::phpBBUserData('user_from');
	}

	public static function getPhpBBUserOccupation() {
		return self::phpBBUserData('user_occ');
	}

	public static function getPhpBBUserBirthDateArray() {
		$returnVal = self::phpBBUserData('user_birthday');
		$returnVal = explode('-', $returnVal);
		return $returnVal;
	}

	public static function getPhpBBUserAbout() {
		return self::phpBBUserData('user_interests');
	}

	public static function getPhpBBUserSignature() {
		return self::phpBBUserData('user_sig');
	}

	public static function getUserCommentNotifyValueFromUserID($UserID) {
		return self::DBUserDataFromID($UserID, 'CommentNotify');
	}

	public static function getUserNewBlogPostNotifyValueFromUserID($UserID) {
		return self::DBUserDataFromID($UserID, 'NewBlogPostNotify');
	}

	public static function getUserAvatarLinkFromUserID($UserID = null) {
		
		if(!is_null($UserID)) { $AvatarID = self::DBUserDataFromID($UserID, 'Avatar'); }
		else { $AvatarID = null; }

		if(is_null($AvatarID) || $AvatarID == false) {
			$Path = '/community/images/Default.png';
		} else {
			$FileName = self::getAvatarFileNameFromID($AvatarID);
			$Path = 'http://concernedjoe.com/Uploads/' . $FileName;
		}

		return $Path;
	}

	/* End phpBB user data obtaining functions */

	/////////////////////////////////////////////

	/* Start Validation functions */

	public static function ValidateUsername($User){
		//returns either "TooLong" or "NoSymbols" or "AllGood"
		if(stripslashes($User) != $User) return "NoSymbols";
		$User = stripslashes($User);
		if(strlen($User) > 15) return "TooLong";
		$array = ["~","`","@","#","(",")","*","&","^","%","$"];
		$length = count($array);
		for($i=0;$i<$length;$i++){
			$char = $array[$i];
			if(strpos($User,$char) !== false) return "NoSymbols" ;
		}
		
		//
		return "AllGood";
	}
	
	
	public static function ValidateEmail($Email) {

		if(filter_var($Email, FILTER_VALIDATE_EMAIL) && preg_match('/@.+\./', $Email)) {

			list($username,$domain) = split('@',$Email);

			if(!checkdnsrr($domain,'MX')) {
				return false;
			}

			return true;
		}
		
		return false;
	}

	public static function ValidateWebsite($Website) {
		return true;
		//To be done
	}

	/* End Validation functions */

	////////////////////////////////////

	/* Start user data updating functions */

	/* Start user password updating functions */

	public static function updateMainPasswordForUserWithID($ID, $NewPassword) {

		$NewSalt = self::makeSalt();
		$NewPassword = self::getPasswordHash($NewPassword, $NewSalt, $ID);

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE Users SET Salt = ? WHERE ID = ?");
		$databaseStatement->bindParam(1, $NewSalt);
		$databaseStatement->bindParam(2, $ID);

		$databaseStatement->execute();

		$databaseStatement = $link->prepare("UPDATE Users SET Password = ? WHERE ID = ?");
		$databaseStatement->bindParam(1, $NewPassword);
		$databaseStatement->bindParam(2, $ID);

		$databaseStatement->execute();

		if($databaseStatement->rowCount() <= 0) { return false; } else { return true; }
	}

	public static function updateWordPressPasswordForUserWithID($ID, $NewPassword) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		wp_set_password($NewPassword, $ID);	//The plaintext new user password - WordPress User ID

		return true;
	}

	public static function updatePhpBBPasswordForUserWithID($ID, $NewPassword) {

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);
		$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : $phpBBDirectory;
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');

		$NewPassword = phpbb_hash($NewPassword);

		return self::UpdatePhpBBDBField($ID, 'user_password', $NewPassword);
	}
	
	

	/* End user password updating functions */

	/* Start user birthday updating functions */

	public static function updatePhpBBBirthdayForUserWithID($ID, $BirthTime) {

		$FormattedDate = date("d-m-Y", $BirthTime);
		return self::UpdatePhpBBDBField($ID, 'user_birthday', $FormattedDate);
	}

	/* End user birthday updating functions */

	/* Start user e-mail updating functions */

	public static function updateMainEmail($ID, $Email) {

		return self::updateMainField($ID, 'Email', $Email);
	}

	public static function updatePhpBBEmail($phpBBUserID, $Email) {

		return self::UpdatePhpBBDBField($phpBBUserID, 'user_email', $Email);
	}

	public static function updateWordPressEmail($wordPressUserID, $Email) {
		
		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		return wp_update_user( array( 'ID' => $wordPressUserID, 'user_email' => $Email) );	//ID is needed to choose user
	}

	/* End user e-mail updating functions */

	/* Start user website updating functions */

	public static function updatePhpBBWebsiteForUserWithID($ID, $Website) {
		$hasHTTP = strpos($Website,"http");
		if(is_int($hasHTTP) == false){
			$Website = "http://".$Website;
		}
		
		return self::UpdatePhpBBDBField($ID, 'user_website', $Website);
	}

	public static function updateWordPressWebsiteForUserWithID($ID, $Website) {
		$hasHTTP = strpos($Website,"http");
		if(is_int($hasHTTP) == false){
			$Website = "http://".$Website;
		}
		
		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		return wp_update_user( array( 'ID' => $ID, 'user_url' => $Website) );	//ID is needed to choose user
	}

	/* End user website updating functions */

	/* Start user location updating functions */

	public static function updatePhpBBLocationForUserWithID($ID, $Location) {

		return self::UpdatePhpBBDBField($ID, 'user_from', $Location);
	}

	/* End user location updating functions */

	/* Start user Occupation updating functions */

	public static function updatePhpBBOccupationForUserWithID($ID, $Occupation) {

		return self::UpdatePhpBBDBField($ID, 'user_occ', $Occupation);
	}

	/* End user Occupation updating functions */

	/* Start user About updating functions */

	public static function updatePhpBBAboutForUserWithID($ID, $About) {

		return self::UpdatePhpBBDBField($ID, 'user_interests', $About);
	}

	public static function updateWordPressAboutForUserWithID($ID, $About) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		return wp_update_user( array( 'ID' => $ID, 'description' => $About) );	//ID is needed to choose user
	}

	/* End user About updating functions */

	/* Start user Signature updating functions */

	     public static function updatePhpBBSignatureForUserWithID($ID, $Signature) {

                $link = DBConnectionModel::phpBBDBLink();

                $phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

                global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template;

                define('IN_PHPBB', true);
                if(!defined('PHPBB_ROOT_PATH')) { define('PHPBB_ROOT_PATH', './'); }
                $phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : './';
                $phpEx = substr(strrchr(__FILE__, '.'), 1);

                require_once($phpBBDirectory . 'common.php');
                require_once($phpBBDirectory . 'includes/message_parser.php');

                $message_parser = new \parse_message($Signature);
                $message_parser->parse(true, true, false, true, false, true, true, true, 'sig');

                $sql_ary = array( (string) $message_parser->message, (string) $message_parser->bbcode_uid, (string) $message_parser->bbcode_bitfield, $ID );

                $databaseStatement = $link->prepare("UPDATE phpbb_users SET user_sig = ?, user_sig_bbcode_uid = ?, user_sig_bbcode_bitfield = ? WHERE user_id = ?");
                $databaseStatement->execute($sql_ary);

                return $databaseStatement->rowCount();
        }

	/* End user Signature updating functions */

	/* Start user Notification status updating functions */

	public static function updateCommentNotifyStatusForUserWithID($ID, $NotifyStatus) {
		
		$Username = self::UsernameFromID($ID);
		$phpBBUserID = self::phpBBUserIDFromUsername($Username);

		self::updateMainField($ID, 'CommentNotify', $NotifyStatus);
		self::UpdatePhpBBDBField($phpBBUserID, 'user_notify', $NotifyStatus);
	}

	public static function updateNewBlogPostNotifyStatusForUserWithID($ID, $NotifyStatus) {
		
		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE ID = ?");
		$databaseStatement->bindParam(1, $ID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if($row == false) { return false; }

		if((int)$row['Verified'] == 0) return false;
		
		self::updateMainField($ID, 'NewBlogPostNotify', $NotifyStatus);
	}


	/* End user Notification status updating functions */

	/* Start notification functions */

	public static function checkWordPressCommentAndNotify($CommentID) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		$CommentObject = get_comment($CommentID);
		$PostTitle = get_the_title($CommentObject->comment_post_ID);
		$WordPressID = $CommentObject->user_id;
		$Username = self::usernameFromWordPressID($WordPressID);

		$UserID = self::IDFromUsername($Username);

		$hasNotificationEnabled = self::getUserCommentNotifyValueFromUserID($UserID);

		if($hasNotificationEnabled) { self::notifyUserForWordPressComment($UserID, $CommentObject, $PostTitle); }
	}

	
	private static function notifyUserForWordPressComment($UserID, $CommentObject, $PostTitle) {

		$email = self::DBUserDataFromID($UserID, 'Email');
		$subject = 'Comment Reply on "' . $PostTitle . '"!';

		$body = 

'<a href="http://concernedjoe.com/devblog/?p=' . ($CommentObject->comment_post_ID) . '"><img src="http://concernedjoe.com/Theme/Images/Email%20Headers/header_comment.png"></a>

<br /><br />

Hey there, somebody replied to your comment posted in "' . $PostTitle . '"
<br />
You can check it out by clicking on the link below

<br /><br />

<a href="http://concernedjoe.com/devblog/?p=' . ($CommentObject->comment_post_ID) . '">http://concernedjoe.com/devblog/?p=' . ($CommentObject->comment_post_ID) . '</a>

<br /><br />

Now go be an awesome user and reply :D

<br /><br />

---------------------------------

<br /><br />

If you don\'t want to receive these notifications anymore, go to our site, log in and uncheck "notifications" from the account settings page.
Or click this link to go to the account settings

<br /><br />

<a href="http://concernedjoe.com/user">User Page</a>';

		GenericOperationsModel::sendEmailTo($email, $subject, $body);
	}

	public static function notifyUsersForNewWordPressPost($PostID) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-includes/post-template.php');

		$PostTitle = get_the_title($PostID); $PostTitle = html_entity_decode($PostTitle);

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE NewBlogPostNotify = 1");
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		while($row = $databaseStatement->fetch()) {

			self::notifyUserForWordPressPost($row['ID'], $PostID, $PostTitle);
		}
	}

	private static function notifyUserForWordPressPost($UserID, $PostID, $PostTitle) {

		$email = self::DBUserDataFromID($UserID, 'Email');
		$subject = 'New devblog post! "' . $PostTitle . '"';

		$body = 

'<a href="http://concernedjoe.com/devblog/?p=' . $PostID . '"><img src="http://concernedjoe.com/Theme/Images/Email%20Headers/header_devblog.png"></a>

<br /><br />

Hey, we just made a new post on our devblog about ' . $PostTitle . '.
<br />
Click on the link below to read more, it\'s totally more awesome than the previous post!

<br /><br />

<a href="http://concernedjoe.com/devblog/?p=' . $PostID . '">http://concernedjoe.com/devblog/?p=' . $PostID . '</a>

<br /><br />

Now be awesome and let us know what you think in the comments! :D

<br /><br />

---------------------------------

<br /><br />

If you don\'t want to receive these notifications anymore, go to our site, log in and uncheck "notifications" from the account settings page.
Or click this link to go to the account settings

<br /><br />

<a href="http://concernedjoe.com/user">User Page</a>';

		GenericOperationsModel::sendEmailTo($email, $subject, $body);
	}

	public static function notifyUserForCommunityQuotation($Username, $Link, $PostTitle) {

		return false;
		$link = 'http://concernedjoe.com/community/viewtopic.php?' . $Link;
		
		$UserID = self::IDFromUsername($Username);

		$email = self::DBUserDataFromID($UserID, 'Email');
		$subject = 'Comment Reply on "' . $PostTitle . '"!';

		$body = 

'<a href="' . $link . '"><img src="http://concernedjoe.com/Theme/Images/Email%20Headers/header_comment.png"></a>

<br /><br />

Hey there, somebody replied to your comment posted in "' . $PostTitle . '"
<br />
You can check it out by clicking on the link below

<br /><br />

<a href="' . $link . '">' . $link . '</a>

<br /><br />

Now go be an awesome user and reply :D

<br /><br />

---------------------------------

<br /><br />

If you don\'t want to receive these notifications anymore, go to our site, log in and uncheck "notifications" from the account settings page.
Or click this link to go to the account settings

<br /><br />

<a href="http://concernedjoe.com/user">User Page</a>';

		GenericOperationsModel::sendEmailTo($email, $subject, $body);
	}

	/* End notification functions */
	
	/* Start Login Attemps Functions */
	
	public static function increaseFailedAttempts($UserID){
		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE Users SET LoginAttempts = LoginAttempts + 1 WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();
		
		return $databaseStatement->rowCount();
	}
	
	
	public static function clearFailedAttempts($UserID){
		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE Users SET LoginAttempts = 0 WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();
		
		return $databaseStatement->rowCount();
	}
	
	public static function getFailedAttempts($UserID){
		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();
		
		$row = $databaseStatement->fetch();
		return $row["LoginAttempts"];
	}
	
	/* End Login Attemps Functions */

	/* Start Avatar updating functions */

	public static function uploadAvatarToTempDirectory() {

		if(isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST") 
		{
			if(isset($_FILES['avatar']['name'])) {

				if($_FILES["file"]["size"] > 204800) {
					header("HTTP/1.0 400 Bad Request");
					return false;
				}

				$filename = stripslashes($_FILES['avatar']['name']);
				$tmpname = $_FILES['avatar']['tmp_name'];
				
				return json_encode(self::startUploadingImage($filename, $tmpname));
			}

		} else { return false; }
	}

	private static function startUploadingImage($filename, $tmpname) {

		$size = filesize($tmpname);

		// Valid image formats 
		$valid_formats = array("jpg", "png", "gif", "bmp","jpeg");

		$uploaddir = dirname(__FILE__) . "/../../Index/TempUploads/"; //Image upload directory

		//Convert extension into a lower case format

		$ext = self::getExtension($filename);
		$ext = strtolower($ext);

		//File extension check

		if(in_array($ext,$valid_formats))
		{
			//File size check

			if ($size <= 204800)
			{ 
				$image_name = time() . substr(md5($filename), 0, 10) . '.' . $ext;

				$newname = $uploaddir.$image_name; 

				//Moving file to uploads folder

				if (move_uploaded_file($tmpname, $newname)) 
				{ 
					$link = DBConnectionModel::mainDBLink();

					$databaseStatement = $link->prepare("INSERT INTO PhotosUploaded (FileName) VALUES(?);");
					$databaseStatement->bindParam(1, $image_name);
					$databaseStatement->execute();

					$LastID = $link->lastInsertId();

					$data = array();
					$data[0] = 'http://concernedjoe.com/TempUploads/' . $image_name;
					$data[1] = $LastID;

					return $data;
				}
				else 
				{
					return 0; //'<span class="imgList">You have exceeded the size limit! so moving unsuccessful! </span>';
				} 
			}
			else 
			{
				return 0; //'<span class="imgList">You have exceeded the size limit!</span>'; 
			} 
		}
		else 
		{
			return 1; //'<span class="imgList">Unknown extension!</span>'; 
		}
	}

	private function getExtension($str)
	{
		$i = strrpos($str,".");
		if (!$i) { return ""; }
		$l = strlen($str) - $i;
		$ext = substr($str, $i + 1, $l);

		return $ext;
	}

	public static function moveAvatarToPermanentDirectoryAndUpdateDB($UserID, $AvatarID) {

		$FileName = self::getAvatarFileNameFromID($AvatarID);

		$result = rename(dirname(__FILE__) . '/../../Index/TempUploads/' . $FileName, dirname(__FILE__) . '/../../Index/Uploads/' . $FileName);

		if(!$result) { return false; }

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE PhotosUploaded SET Confirmed = 1 WHERE ID = ?");
		$databaseStatement->bindParam(1, $AvatarID);
		$databaseStatement->execute();

		if($databaseStatement->rowCount()) {
			return self::updateMainField($UserID, 'Avatar', $AvatarID);
		} else { return false; }

	}

	public static function getAvatarFileNameFromID($AvatarID) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM PhotosUploaded WHERE ID = ?");
		$databaseStatement->bindParam(1, $AvatarID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if($row) { return $row['FileName']; } else { return false; }
	}
	
	/* End Avatar updating functions */

	/* End user data updating functions */

	//////////////////////////////////////

	/* Start user registration functions */

	public static function registerMainUser($username, $password, $email) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE Username = ?");
		$databaseStatement->bindParam(1, $username);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		if($databaseStatement->fetch()) { return false; }

		$salt = self::makeSalt();
		$password = self::getPasswordHash($password, $salt);

		$databaseStatement = $link->prepare("INSERT INTO Users (Username, Email, Password, Salt)
															VALUES(?, ?, ?, ?);");

		$databaseStatement->execute(array($username, $email, $password, $salt));

		$UserID = $link->lastInsertId();
		
		return $UserID;
	}

	public static function registerWordPressUser($username, $password, $email) {

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		$user_id = username_exists( $username );

		if ( !$user_id ) {
			$user_id = wp_create_user( $username, $password, $email );
		} else {
			return false;
		}

		return true;
	}

	public static function registerphpBBUser($username, $password, $email) {

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);
		$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : $phpBBDirectory;
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');
		require_once($phpBBDirectory . 'includes/functions_user.php');

		$userArray = array('username' => $username,
							'group_id' => 2,
							'user_email' => $email,
							'user_type' => 0,
							'user_password' => phpbb_hash($password));

		user_add($userArray);
	}

	/* End user registration functions */

	/////////////////////////////////////

	/* Start e-mail verification functions */

	public static function sendEmailVerification($UserID) {

		$KeyCode = \Model\GenericOperationsModel::generateRandomString(100);
		$email = self::EmailFromID($UserID);

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("DELETE FROM EmailVerificationKeys WHERE UserID = ?;");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();

		$databaseStatement = $link->prepare("INSERT INTO EmailVerificationKeys (UserID, KeyCode) VALUES(?, ?);");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->bindParam(2, $KeyCode);
		$databaseStatement->execute();

		$subject = 'Welcome to Concerned Joe!';
		$link = 'http://concernedjoe.com/verifyemail/verify?id=' . $UserID . '&key=' . $KeyCode;
		$body =

'<html>
<body>
<a href="' . $link . '"><img src="http://concernedjoe.com/Theme/Images/Email%20Headers/header_generic.png"></a>

<br /><br />

Hey there! Thank you for signing up on ConcernedJoe.com, we\'re happy to have you on board!
<br />
To complete your sign up, please confirm your email address by opening the link below:

<br /><br />

<a href="' . $link . '">' . $link . '</a>

<br /><br />
<p style="color:#DA4837; font-weight:bold;">
Note: If you plan to purchase <a href="http://concernedjoe.com/earlyaccess">Early Access</a>, make sure your account email is the same as the email on your Paypal.
In case you registered with a separate email, you can change it from your <a href="http://concernedjoe.com/user">account page</a>.</p>

</body>
</html>';

		GenericOperationsModel::sendEmailTo($email, $subject, $body);
	}

	public static function verifyEmailToken($UserID, $Token) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM EmailVerificationKeys WHERE UserID = ? AND KeyCode = ?;");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->bindParam(2, $Token);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();
		$row = $databaseStatement->fetch();

		if($row == false) { return false; }

		$dateFromDatabase = strtotime($row['CreationTimeStamp']);
		$dateOneHourAgo = strtotime("-1 hour");

		if ($dateFromDatabase <= $dateOneHourAgo) {
		    return false;
		}

		$databaseStatement = $link->prepare("DELETE FROM EmailVerificationKeys WHERE UserID = ?;");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();

		self::updateMainField($UserID, 'Verified', 1);

		return true;
	}

	public static function isVerified($UserID) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();
		$row = $databaseStatement->fetch();

		if($row == false) { return -1; }

		if((int)$row['Verified'] == 0) { return false; } else if((int)$row['Verified'] == 1) { return true; }

		return -1;
	}

	public static function deVerify($UserID) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE Users SET Verified = 0 WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		return true;
	}

	/* End e-mail verification functions */

	///////////////////////////////////////

	/* Start user logging in and credentials checking functions */

	public static function checkCredentials($username, $password) {

		$UserID = UserOperationsModel::IDFromUsername($username);

		$link = DBConnectionModel::mainDBLink();

		$password = self::getPasswordHash($password, null, $UserID);

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE Username = ? AND Password = ?");
		$databaseStatement->bindParam(1, $username); $databaseStatement->bindParam(2, $password);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if($row) { return $row['ID']; } else { return false; }
	}

	public static function loginUser($username, $password) {
		if(self::checkCredentials($username, $password)) {
			return self::setCurrentUser(self::IDFromUsername($username));
		}
		return false;
	}

	public static function setCurrentUser($UserID) {

		$Username = self::UsernameFromID($UserID);

		//Start WordPress Login

		$WordpressDirectory = dirname(__FILE__) . '/../../Index/devblog/';
		require_once($WordpressDirectory . 'wp-load.php');

		$user = get_userdatabylogin( $Username );
		$user_id = $user->ID;
		wp_set_current_user( $user_id, $user_login );
		wp_set_auth_cookie( $user_id );
		$result = do_action( 'wp_login', $user_login );

		//End Wordpress Login

		//Start phpBB Login

		$phpBBID = self::phpBBUserIDFromUsername($Username);

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template, $auth;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);
		$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : $phpBBDirectory;
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		define('IS_LOGGING_IN', true);

		require_once($phpBBDirectory . 'common.php');

		$user->session_kill();	//Logout

		// Start session management

		$user->session_begin();
		$auth->acl($user->data);
		$user->setup();
		$result = $user->session_create($phpBBID, false, true);
		//End phpBB Login

		$_SESSION['Username'] = $Username;
		$_SESSION['WordPressLoggingIn'] = true;

		$myModel = new SessionsModel();
		$myModel->generateTokenForUserID($UserID);

		return true;
	}

	public static function destroyTokensForUserID($UserID) {

		setcookie("Token", $CookieData, time() + 31536000, '/');

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("DELETE FROM RememberUserTokens WHERE UserID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->execute();

		return $databaseStatement->rowCount();
	}

	/* End user logging in and credentials checking functions */

	//////////////////////////////////////

	/* Start private functions */

	private static function phpBBUserData($key) {

		$phpBBDirectory = dirname(__FILE__) . '/../../Index/community/';

		global $phpbb_root_path, $phpEx, $user, $db, $config, $cache, $template, $auth;

		define('IN_PHPBB', true);
		define('PHPBB_ROOT_PATH', $phpBBDirectory);
		$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : $phpBBDirectory;
		$phpEx = substr(strrchr(__FILE__, '.'), 1);

		require_once($phpBBDirectory . 'common.php');
		require_once($phpBBDirectory . 'includes/functions_user.php');

		$user->session_begin();
		$auth->acl($user->data);
		$user->setup();

		$returnVal = $user->data; $returnVal = $returnVal[$key];
		return $returnVal;
	}

	private static function DBUserDataFromID($UserID, $key) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM Users WHERE ID = ?");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if($row) { return $row[$key]; } else { return false; }
	}

	private static function UpdatePhpBBDBField($phpBBUserID, $Key, $Value) {

		$link = DBConnectionModel::phpBBDBLink();

		$databaseStatement = $link->prepare("UPDATE phpbb_users SET " . $Key . " = ? WHERE user_id = ?");
		$databaseStatement->bindParam(1, $Value);
		$databaseStatement->bindParam(2, $phpBBUserID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);

		$databaseStatement->execute();

		return $databaseStatement->rowCount();
	}

	private static function updateMainField($ID, $Key, $Value) {


		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE Users SET " . $Key . " = ? WHERE ID = ?");
		$databaseStatement->bindParam(1, $Value);
		$databaseStatement->bindParam(2, $ID);
		$databaseStatement->execute();

		return $databaseStatement->rowCount();
	}

	private static function makeSalt()
	{
		global $link;

		$true = true;
		$salt = openssl_random_pseudo_bytes(10, $true);

		return $salt;
	}

	private static function getPasswordHash($Pass, $Salt, $UserID = null)
	{
		if(is_null($Salt)) {

			$link = DBConnectionModel::mainDBLink();

			$databaseStatement = $link->prepare("SELECT Salt FROM Users WHERE ID = ?");
			$databaseStatement->bindParam(1, $UserID);
			$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
			$databaseStatement->execute();

			$Salt = $databaseStatement->fetch(); $Salt = $Salt['Salt'];
		}

		$returnValue = $Pass . DBConnectionModel::$saltPrepend . $Salt;

		$returnValue = hash('sha512', $returnValue);

		return $returnValue;
	}

	/* End private functions */

}