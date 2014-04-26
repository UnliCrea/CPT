<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class FaqController extends GenericController implements FaqControllerInterface {

	public function index() {

		$myView = new \View\FaqView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>