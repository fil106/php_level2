<?php

	class authController extends Controller
	{

		public $view = 'auth';

		public function index()
		{

			$this->view .= "/" . __FUNCTION__ . '.html';
			echo $this->controller_view();
		}

	}