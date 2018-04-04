<?php

	session_start();

	/* Подключаем необходимые файлы */
	require_once('config/config.php');
	require_once('engine/db.php');
	require_once('engine/functions.php');
	require_once('engine/auth.php');

	Db::getInstance()->connect(HOST, USER, PASS, DB);

//	echo "<pre>";
//
//		print_r($_SERVER);
//		print_r($_GET);
//		print_r($_SESSION);
//		print_r($isAuth);
//
//	echo "</pre>";

	if ( $_POST['metod'] == 'ajax' )
	{

		$limit = $_POST['limit']+6;

		$goods = Db::getInstance()->select("select * from goods limit $limit");
		$str = '';

		foreach ($goods as $item) {
			$str .= getItemHtml(null, $item);
		}

		echo json_encode($str);

		die;

	} elseif ( isset($_POST['auth']) )
	{

		$login = htmlspecialchars($_POST['auth_login']);
		$password = htmlspecialchars($_POST['auth_pass']);
		$rememberme = htmlspecialchars($_POST['auth_remember']);

		/* проверки на вводмсые данные */
		if ( $login == '' ) {
			$ERRORS['auth'][] = "Не был введен логин!";
		}
		if ( $password == '' ) {
			$ERRORS['auth'][] = "Не был введен пароль!";
		}

		/* Если ошибок нет, то пытаемся логиниться */
		if ( empty($ERRORS['auth']) ) {

			if ( auth($login, $password, $rememberme )) {
				$isAuth = 1;
			} else {
				$ERRORS['auth'][] = "Введеной конбинации (логин и пароль) не найдено!";
			}

		}

		$url_array = getUriArr('/');

		if ( $url_array[1] == "" )
		{

			$page_name = "index";

		}	else {

			$page_name = $url_array[1];

		}

		$content = prepareVariables($page_name);
		require 'templates/bases.php';

	} elseif ( isset($_GET['logout']) )
	{

		/* Выход пользователя при нажатии на кнопку "Выйти" */

		$isAuth = UserExit();
		header("Location: /");

	} else
	{

		$isAuth = auth();

		$url_array = getUriArr('/');

		if ( $url_array[1] == "" )
		{

			$page_name = "index";

		}	else {

			$page_name = $url_array[1];

		}

		$content = prepareVariables($page_name);
		require 'templates/bases.php';

	}

//	echo "<pre style='display: block;height: 300px;'>";

		//print_r($url_array);
		//print_r($content);
		//print_r($_SESSION);
		//print_r($isAuth);
		//print_r($ERRORS);

//	echo "</pre>";