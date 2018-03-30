<?php

	class Router
	{

		private function getUri()
		{
			if (!empty($_SERVER['REQUEST_URI'])) {
				return trim($_SERVER['REQUEST_URI'], '/');
			}
		}

		public function run()
		{
			//получаем ссылку, что ввел пользователь
			$uri = $this->getUri();

			$templ = 'index.html';

			if (preg_match('/[0-9]+/', $uri)) {
				$id = $uri;
				$templ = 'foto.html';
				$galery = foto($id)[0];
				print_r($galery);
			}

			// подгружаем и активируем авто-загрузчик Twig-а
			require_once ROOT.'/engine/Twig/Autoloader.php';
			Twig_Autoloader::register();

			try {
			  // указывае где хранятся шаблоны
			  $loader = new Twig_Loader_Filesystem(ROOT.'/templates');
			 
			  // инициализируем Twig
			  $twig = new Twig_Environment($loader);
			 
			 
			  // подгружаем шаблон
			  $template = $twig->loadTemplate($templ); 
			 
			  // передаём в шаблон переменные и значения
			  // выводим сформированное содержание
			  echo $template->render(array(
			    'galery' => $galery,
			    'UPLOAD_SMALL_DIR' => UPLOAD_SMALL_DIR,
				'UPLOAD_DIR' => UPLOAD_DIR

			  ));
			 
			} catch (Exception $e) {
			  die ('ERROR: ' . $e->getMessage());
			}

		}

	}