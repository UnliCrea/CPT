<?php

namespace Model;

class GenericOperationsModel implements GenericOperationsModelInterface {

	public static function GetEarlyAccessLicensesLeft() {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM GeneralSettings WHERE SettingKey = 'AvailableEarlyAccessLicenses'");
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if($row) { return (int)$row['SettingValue']; } else { return false; }
	}

	public static function SubtractEarlyAccessLicensesLeft() {

		$EarlyAccessLeft = GenericOperationsModel::GetEarlyAccessLicensesLeft();

		if($EarlyAccessLeft <= 0) { return false; }

		$EarlyAccessLeft -= 1;

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("UPDATE GeneralSettings SET SettingValue = ? WHERE SettingKey = 'AvailableEarlyAccessLicenses'");
		$databaseStatement->bindParam(1, $EarlyAccessLeft);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		if($row) { return (double)$row['SettingValue']; } else { return false; }
	}

	public static function sendEmailTo($address, $subject, $body) {

		require_once(dirname(__FILE__) . '/../PHPMailer/class.phpmailer.php');

		$mail = new \PHPMailer();  // create a new object
		$mail->SetFrom('noreply@concernedjoe.com', "Concerned Joe");
		$mail->AddAddress($address);
		$mail->Subject = $subject;
		$mail->Body = $body;
		$mail->IsHTML(true);
		
		if(!$mail->Send()) {
		  error_log("\nMailer Error: " . $mail->ErrorInfo); die('error'); return false;
		} else {
			return true;
		}

	}

	public static function generateRandomString($length = 10) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, strlen($characters) - 1)];
		}
		return $randomString;
	}

}

?>