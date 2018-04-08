<?php

	class contactController extends Controller
	{

		public $view = 'contact';

		public function index()
		{

			$this->view .= "/" . __FUNCTION__ . '.html';
			echo $this->controller_view();

		}

	}