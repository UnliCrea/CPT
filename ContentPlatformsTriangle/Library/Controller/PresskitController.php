<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class PresskitController extends GenericController implements PresskitControllerInterface {

	public function index() {

		$myView = new \View\PresskitView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>