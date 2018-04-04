<?php

	session_start();

	/* Подключаем необходимые файлы */
	require_once 'autoload.php';

	try {

		App::Init();

	}
	catch (PDOException $e) {

		echo "DB is not available";
		var_dump($e->getTrace());

	}
	catch (Exception $e) {

		echo $e->getMessage();

	}