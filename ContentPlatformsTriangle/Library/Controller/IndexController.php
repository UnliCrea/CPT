<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class IndexController extends GenericController implements IndexControllerInterface {

	public function index() {

		$myView = new \View\IndexView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>