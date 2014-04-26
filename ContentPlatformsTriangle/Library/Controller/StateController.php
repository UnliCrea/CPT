<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class StateController extends GenericController implements StateControllerInterface {

	public function index() {

		$myView = new \View\StateView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>