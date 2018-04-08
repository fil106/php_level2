<?php

	class authModel extends Model
	{
		public $view = 'index';

		public function index($data = NULL, $deep = 0) 	//Метод с использованием классов для вывода категорий товаров
		{
			$this->title .= 'Sign Up';
		}

	}