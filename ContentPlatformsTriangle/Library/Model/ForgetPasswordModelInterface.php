<?php

namespace Model;

interface ForgetPasswordModelInterface {
	public function GenerateKey($UserID);
	public function ValidateKey($Key);
	public function UpdatePasswordForUserWithKey($NewPassword, $Key);
}

?>