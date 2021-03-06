<?php

	class IndexModel extends Model
	{
		public $view = 'index';
		public $title;

		public function index($data = NULL, $deep = 0) 	//Метод с использованием классов для вывода категорий товаров
		{
			$result['top_product'] = Product::TopProduct();
			$result['new_product'] = Product::NewProduct();
			$result['sale_product'] = Product::StatusProduct();
			return $result;
		}

	}