<?php

date_default_timezone_set('UTC');

require_once dirname(__FILE__) . "/../Library/Symfony/Component/ClassLoader/UniversalClassLoader.php";
use Symfony\Component\ClassLoader\UniversalClassLoader;

$autoloader = new UniversalClassLoader();

$autoloader->registerNamespace('Controller', dirname(__FILE__) . '/../Library');
$autoloader->registerNamespace('View', dirname(__FILE__) . '/../Library');
$autoloader->registerNamespace('Model', dirname(__FILE__) . '/../Library');
$autoloader->registerNamespace('PayPal', dirname(__FILE__) . '/../Library');
$autoloader->register();

if (!defined('IN_PHPBB') && !defined('IN_WP')) {
	$frontController = new Controller\FrontController();
	$frontController->run();
}

?>