<?php

	//Константы ошибок
	define('ERROR_NOT_FOUND', 1);
	define('ERROR_TEMPLATE_EMPTY', 2);


	//Функция получает переменные в зависимости от выбранной страницы. news или newspage или feedback
	function prepareVariables($page_name)
	{

		switch ($page_name){

			case "index":
				$vars['content'] = '../templates/index.php';
				$vars['new_product'] = NewProduct();
				$vars['top_product'] = TopProduct();
				$vars['sale_product'] = SaleProduct();
			break;

			case "good":
				$id_good = getUriArr('/')[2];
				if ($id_good > 0) {
					$vars['content'] = '../templates/goods/single-product.php';
					$vars['single_product'] = singleGood($id_good);
				} else {
					$vars['content'] = '../templates/404.php';
				}
			break;

			case "contact":
				$vars['content'] = '../templates/contacts.php';
			break;

			case "auth":
				$vars['content'] = '../templates/auth/auth.php';
			break;

			case "register":
				$vars['content'] = '../templates/register/register.php';
			break;

			case "register-access":
				$vars['content'] = '../templates/register/register-access.php';
				break;

			case "grid":

				$sql = "select * from goods limit 6";

				$vars['content'] = '../templates/grid.php';
				$vars['goods'] = Db::getInstance()->select($sql);
				break;

			case "feedback":

			break;

			default:
				$vars['content'] = '../templates/404.php';
			break;
		}

		return $vars;
	}

	function getItemHtml($status, $item) {
		$str = '
		
			<div class="item">
		
			<a href="good/' . $item['id_good'] . '">
		
				<span class="item_' . $status . '"></span>
		
				<img src="' . $item['foto'] . '" alt="' . $item['name'] . '">
		
				<span class="item_name">' . $item['name'] . '</span>
		
			<span class="item_price">€ ' . $item['price'] . '</span>
		
			</a>
		
			</div>';

		return $str;
	}

	function getUriArr($delimiter) {
		return explode($delimiter, $_SERVER['REQUEST_URI']);
	}

	/* SQL */

	function NewProduct()
	{
		$sql = 'select * from goods order by date desc limit 6';
		return Db::getInstance()->select($sql);
	}

	function TopProduct()
	{
		$sql = 'select * from goods order by view desc, date desc limit 3';
		return Db::getInstance()->select($sql);
	}

	function SaleProduct()
	{
		$sql = 'select * from goods where status = "2" order by view desc limit 3';
		return Db::getInstance()->select($sql);
	}

	function singleGood($id) {
		$sql = "select `name`, `price`, `foto`, `date`, `view`, `description`, `short_description`  from goods where id_good = $id";
		return Db::getInstance()->select($sql);
	}