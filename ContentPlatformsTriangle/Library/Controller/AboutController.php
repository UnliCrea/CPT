<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class AboutController extends GenericController implements AboutControllerInterface {

	public function index() {

		$myView = new \View\AboutView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>