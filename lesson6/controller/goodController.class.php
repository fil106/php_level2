<?php

	class goodController extends Controller
	{

		public $view = 'good';

		public function good()
		{

			$this->view .= "/" . __FUNCTION__ . '.html';
			echo $this->controller_view();
		}

	}