<?php

namespace View;

interface GenericViewInterface {
	public function run();
	public function setParent($parent);
	public function pureHeader($mode);
	public function footer();
	public function addJS($fileName);
	public function setAvatarLink($AvatarLink);
}

?>