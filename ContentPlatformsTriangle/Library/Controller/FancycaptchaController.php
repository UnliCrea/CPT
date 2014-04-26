<?php

/* 
  captcha.php
  jQuery Fancy Captcha
  www.webdesignbeach.com
  
  Created by Web Design Beach.
  Copyright 2009 Web Design Beach. All rights reserved.

  Modified by Nav of www.unlicrea.com for Concerned Joe, www.concernedjoe.com - 2014

*/

namespace Controller;

class FancycaptchaController extends GenericController implements FancycaptchaControllerInterface {

	public function index() {
		header('Location:/'); return;
	}

	public function getRand() {
		$rand = rand(0,4);
		$_SESSION['captchaMAN'] = $rand;
		echo $rand;
	}

	public function checkCaptcha() {

		if($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['captchaMAN']) && $_POST['captchaMAN'] == $_SESSION['captchaMAN']) {
			return true;
			unset($_SESSION['captchaMAN']); /* this line makes session free, we recommend you to keep it */
		}
		
		return false;

	}

}
	
?>



