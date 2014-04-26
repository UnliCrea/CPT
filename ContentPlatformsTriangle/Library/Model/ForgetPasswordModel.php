<?php

namespace Model;

class ForgetPasswordModel implements ForgetPasswordModelInterface {

	public function GenerateKey($UserID) {

		$link = DBConnectionModel::mainDBLink();

		while(true) {
			$Key = \Model\GenericOperationsModel::generateRandomString(50);

			$databaseStatement = $link->prepare("SELECT * FROM ForgetPasswordKeys WHERE KeyCode = ?");
			$databaseStatement->bindParam(1, $Key);
			$databaseStatement->execute();

			$row = $databaseStatement->fetch();

			if($row == false) { break; }
		}

		$databaseStatement = $link->prepare("INSERT INTO ForgetPasswordKeys (UserID, KeyCode) VALUES(?, ?);");
		$databaseStatement->bindParam(1, $UserID);
		$databaseStatement->bindParam(2, $Key);

		$result = $databaseStatement->execute();

		return $Key;
	}

	public function ValidateKey($Key) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM ForgetPasswordKeys WHERE KeyCode = ? AND Used = 0");
		$databaseStatement->bindParam(1, $Key);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if(!$row) { return false; }

		$dateFromDatabase = strtotime($row['CreationTimeStamp']);
		$dateOneHourAgo = strtotime("-1 hour");

		if ($dateFromDatabase <= $dateOneHourAgo) {
		    return false;
		}

		return $row['UserID'];
	}

	public function UpdatePasswordForUserWithKey($NewPassword, $Key) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM ForgetPasswordKeys WHERE KeyCode = ?");
		$databaseStatement->bindParam(1, $Key);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		$UserID = $row['UserID'];
		$Username = \Model\UserOperationsModel::UsernameFromID($UserID);
		$wordPressUserID = \Model\UserOperationsModel::wordPressIDFromUsername($Username);
		$phpBBUserID = \Model\UserOperationsModel::phpBBUserIDFromUsername($Username);

		$databaseStatement = $link->prepare("UPDATE ForgetPasswordKeys SET Used = 1 WHERE KeyCode = ?");
		$databaseStatement->bindParam(1, $Key);
		$databaseStatement->execute();

		\Model\UserOperationsModel::updateMainPasswordForUserWithID($UserID, $NewPassword);
		\Model\UserOperationsModel::updateWordPressPasswordForUserWithID($wordPressUserID, $NewPassword);
		\Model\UserOperationsModel::updatePhpBBPasswordForUserWithID($phpBBUserID, $NewPassword);

		return true;
	}

}