<?php

	/** FRONT CONTROLLER **/

	define('ROOT', dirname(__FILE__));

	require_once(ROOT.'/config/config.php');
	require_once(ROOT.'/engine/db.php');
	require_once(ROOT.'/engine/function.php');
	require_once(ROOT.'/engine/resize.php');
	require_once(ROOT.'/engine/router.php');

	//Далее пердаем управлевние роутеру

	$router = new Router();
	$router->run();