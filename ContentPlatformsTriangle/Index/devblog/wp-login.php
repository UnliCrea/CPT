<?php

$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'login';

if ( isset($_GET['key']) )
	$action = 'resetpass';

// validate action so as to default to the login screen
if ( !in_array( $action, array( 'postpass', 'logout', 'lostpassword', 'retrievepassword', 'resetpass', 'rp', 'register', 'login' ), true ) && false === has_filter( 'login_form_' . $action ) )
	$action = 'login';

if($action == 'register') {
	header("Location:../register");
} else if ($action == 'lostpassword' || $action == 'retrievepassword' || $action == 'resetpass' || $action == 'rp' || $action == 'postpass') {
	header("Location:../forgetpassword");
} else if ($action == 'logout') {
	header("Location:../logout");
} else {
	header("Location:../login");
}

?>