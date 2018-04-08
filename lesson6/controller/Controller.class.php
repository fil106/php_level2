<?php

	class Controller
	{

		public $view = '';
		protected $data;
		protected $template;

		public function __construct()
		{

			$this->data = [
					'domain' => Config::get('domain'),
					'BreadCrumbs' => Bread::BreadCrumbs(explode("/", $_SERVER['REQUEST_URI'])),
					'isAuth' => Auth::logIn(),
					'microtime' => microtime(true),
					'IdUserSession' => $_SESSION['IdUserSession']
			];

		}

		public function controller_view($param = 0)
		{

			$modelName = $_GET['page'] . 'Model';
			$methodName = isset($_GET['action']) ? $_GET['action'] : 'index';

			if (class_exists($modelName)) {

				$model = new $modelName();
				$content_data = $model->$methodName($param);

			}

			$this->data['title'] = $model->title;
			$this->data['content_data'] = $content_data;

			$loader = new Twig_Loader_Filesystem(Config::get('path_templates'));
			$twig = new Twig_Environment($loader);
			$template = $twig->loadTemplate($this->view);

			return $template->render($this->data);

		}

		public function __call($name, $param)
		{

			header("Location: /page404/");

		}

	}