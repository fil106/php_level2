<?php

	class IndexController extends Controller
	{

		public function index()
		{

			$this->view .= "/" . __FUNCTION__ . '.html';
			echo $this->controller_view();

		}

	}