<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class LivestreamController extends GenericController implements LivestreamControllerInterface {

	public function index() {

		$myView = new \View\LivestreamView();
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
}

?>