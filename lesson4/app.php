<?php

	session_start();

	/* Подключаем необходимые файлы */
	require_once('config/config.php');
	require_once('engine/db.php');
	require_once('engine/functions.php');
	require_once('engine/auth.php');

	Db::getInstance()->connect(HOST, USER, PASS, DB);

	$isAuth = auth();

	if ($_POST['metod'] == 'ajax') {

		ob_start(); //Запускаем буферизауию вывода

		$goods = Db::getInstance()->select("select `name`, `price`, `foto`, `date`, `view`, `short_description` from goods limit ?", array($_POST['limit']));

		$str = ob_get_contents(); //Записываем в переменную то, что в буфере

		ob_end_clean(); //Очищаем буфер

		echo json_encode($goods);

	} elseif (isset($_POST['auth'])) {

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

	} elseif (isset($_GET['logout'])) {

		/* Выход пользователя при нажатии на кнопку "Выйти" */

		$isAuth = UserExit();
		header("Location: /");

	} else {

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

//	echo "<pre>";
//
//		print_r($_SERVER);
//		print_r($_GET);
//		print_r($_SESSION);
//		print_r($isAuth);
//
//	echo "</pre>";



	// echo "<pre style='display: block;height: 300px;'>";

		//print_r($url_array);
		//print_r($content);
		//print_r($_SESSION);
		//print_r($isAuth);
		//print_r($ERRORS);

	// echo "</pre>";