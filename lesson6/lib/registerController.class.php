<?php

	class registerController extends Controller
	{

		public function index()
		{

			$this->view .= "/register/" . __FUNCTION__ . '.html';
			echo $this->controller_view();

		}

	}