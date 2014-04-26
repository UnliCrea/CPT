<?php

namespace Controller;

class VerifyemailController implements VerifyemailControllerInterface {
	
	public function index() {
		header('Location:/');
	}

	public function verify() {

		$UserID = $_GET['id']; $KeyCode = $_GET['key'];

		if(\Model\UserOperationsModel::verifyEmailToken($UserID, $KeyCode)) {
			\Model\UserOperationsModel::setCurrentUser($UserID);
			header('Location:/welcome/');
		} else {
			header('Location:/login/send/' . $UserID . '?mode=error' );
		}
	}

}