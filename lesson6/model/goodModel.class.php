<?php

	class goodModel extends Model
	{

		public function good($data = NULL, $deep = 0) 	//Метод с использованием классов для вывода категорий товаров
		{
			$result['good'] = Product::SingleProduct($_GET['id']);

			$this->title .= $result['good']['name'];

			return $result;
		}

	}