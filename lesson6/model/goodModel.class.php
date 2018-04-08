<?php

	class goodModel extends Model
	{
		public $view = 'index';
		public $title = '';

		public function good($data = NULL, $deep = 0) 	//Метод с использованием классов для вывода категорий товаров
		{
			$result['good'] = Product::SingleProduct($data);
			return $result;
		}

	}