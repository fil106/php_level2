<?php

	class Ajax
	{

		public static $views;

		public static function autoriz()
		{

			self::$views = 'auth/index.html';

			return ['isAuth' => Auth::logIn($_POST['login'], $_POST['pass'], $_POST['rememberme'])];

		}

		public static function see_additional_goods()
		{

			self::$views = 'catalog/product_catalog.php';
			$model = new catalogModel();
			$nStart = $_POST['current_record'];
			$count = $_POST['count'];
			$data = $_POST['category'];
			return ['content_data' => $model->sub_catalog($data, $nStart, $count)];

		}

	}