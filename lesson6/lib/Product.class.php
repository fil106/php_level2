<?php

	class Product
	{
		public static function TopProduct($quantity = 3, $sort = 'desc')
		{
			return db::getInstance()->select("select * from goods order by view $sort, date desc limit $quantity;");
		}

		public static function NewProduct($quantity = 3, $sort = 'desc')
		{
			return db::getInstance()->select("select * from goods order by date $sort limit $quantity;");
		}

		public static function StatusProduct($quantity = 3, $status = 2, $sort = 'desc')
		{
			return db::getInstance()->select("select * from goods where status = '$status' order by view $sort limit $quantity;");
		}

		public static function SingleProduct($id)
		{
			return db::getInstance()->selectRow("select * from goods where id_good = $id");
		}

		public static function GetProducts($quantity = 9, $sort = 'desc')
		{
			return db::getInstance()->select("select * from goods order by view $sort, date desc limit $quantity");
		}

	}