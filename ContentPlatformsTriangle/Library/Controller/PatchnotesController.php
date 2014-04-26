<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class PatchnotesController extends GenericController implements PatchnotesControllerInterface {

	public function index() {

		$myView = new \View\PatchNotesView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>