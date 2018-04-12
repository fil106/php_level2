<?php

	class gridController extends Controller
	{

		public $view = 'grid';

		public function index()
		{

			$this->view .= "/" . __FUNCTION__ . '.html';
			echo $this->controller_view();

		}

	}

?>