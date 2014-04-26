<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class WelcomeController extends GenericController implements WelcomeControllerInterface {

	public function index() {

		$myView = new \View\WelcomeView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>