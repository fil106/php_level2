<?php

	class gridModel extends Model
	{

		public function index($data = NULL, $deep = 0) 	//Метод с использованием классов для вывода категорий товаров
		{
			$this->title .= 'Grid';

			$result['products'] = Product::GetProducts();

			return $result;
		}

	}

?>