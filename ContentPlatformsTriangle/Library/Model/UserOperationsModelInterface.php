<?php

namespace Model;

interface UserOperationsModelInterface {

	public static function IDFromUsername($Username);
	public static function UsernameFromID($UserID);
	public static function IDFromEmail($Email);
	public static function EmailFromID($UserID);
	public static function phpBBUserIDFromUsername($Username);
	public static function wordPressIDFromUsername($Username);
	public static function usernameFromWordPressID($WordPressID);
	public static function UserIDFromWordPressUserID($WordPressUserID);

	public static function ownsEarlyAccessLicense($UserID);
	public static function grantEarlyAccessLicense($UserID);
	public static function addUserToPhpBBEarlyAccessGroup($UserID);

	public static function getPhpBBUserWebsite();
	public static function getPhpBBUserLocation();
	public static function getPhpBBUserOccupation();
	public static function getPhpBBUserBirthDateArray();
	public static function getPhpBBUserAbout();
	public static function getPhpBBUserSignature();
	public static function getUserCommentNotifyValueFromUserID($UserID);
	public static function getUserNewBlogPostNotifyValueFromUserID($UserID);
	public static function getUserAvatarLinkFromUserID($UserID = null);

	public static function ValidateUsername($User);
	public static function ValidateEmail($Email);
	public static function ValidateWebsite($Website);

	public static function updateMainPasswordForUserWithID($ID, $NewPassword);
	public static function updateWordPressPasswordForUserWithID($ID, $NewPassword);
	public static function updatePhpBBPasswordForUserWithID($ID, $NewPassword);

	public static function updatePhpBBBirthdayForUserWithID($ID, $BirthTime);

	public static function updateMainEmail($ID, $Email);
	public static function updatePhpBBEmail($phpBBUserID, $Email);
	public static function updateWordPressEmail($wordPressUserID, $Email);

	public static function updatePhpBBWebsiteForUserWithID($ID, $Website);
	public static function updateWordPressWebsiteForUserWithID($ID, $Website);

	public static function updatePhpBBLocationForUserWithID($ID, $Location);

	public static function updatePhpBBOccupationForUserWithID($ID, $Occupation);

	public static function updatePhpBBAboutForUserWithID($ID, $About);
	public static function updateWordPressAboutForUserWithID($ID, $About);

	public static function updatePhpBBSignatureForUserWithID($ID, $Signature);

	public static function updateCommentNotifyStatusForUserWithID($ID, $NotifyStatus);
	public static function updateNewBlogPostNotifyStatusForUserWithID($ID, $NotifyStatus);

	public static function uploadAvatarToTempDirectory();
	public static function moveAvatarToPermanentDirectoryAndUpdateDB($UserID, $AvatarID);
	public static function getAvatarFileNameFromID($AvatarID);

	public static function checkWordPressCommentAndNotify($CommentID);
	public static function notifyUsersForNewWordPressPost($PostID);
	public static function notifyUserForCommunityQuotation($Username, $Link, $PostTitle);
	
	public static function increaseFailedAttempts($UserID);
	public static function clearFailedAttempts($UserID);
	public static function getFailedAttempts($UserID);
	
	public static function registerMainUser($username, $password, $email);
	public static function registerWordPressUser($username, $password, $email);
	public static function registerphpBBUser($username, $password, $email);

	public static function sendEmailVerification($UserID);
	public static function verifyEmailToken($UserID, $Token);
	public static function isVerified($UserID);
	public static function deVerify($UserID);

	public static function loginUser($username, $password);
	public static function setCurrentUser($UserID);
	public static function destroyTokensForUserID($UserID);

	public static function checkCredentials($username, $password);
}

?>