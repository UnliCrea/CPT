<?php

namespace Model;

interface GenericOperationsModelInterface {
	public static function GetEarlyAccessLicensesLeft();
	public static function SubtractEarlyAccessLicensesLeft();
	public static function sendEmailTo($address, $subject, $body);
}

?>