<?php

namespace Model;


interface SessionsModelInterface {
	public function generateTokenForUserID($UserID);
}

?>