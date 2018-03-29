<!doctype html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Домашняя работа</title>
	<style>
		.products {
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
		}
		.product {
			width: 200px;
			background-color: #eee;
			text-align: center;
		}
	</style>
</head>
<body>

	<?php

		class Product {

			public $name;
			public $desc;
			public $photoSrc;

			function __construct($name, $desc, $photoSrc) {
				$this->name = $name;
				$this->desc = $desc;
				$this->photoSrc = $photoSrc;
			}

			public function getProductName() { return $this->name; }
			public function getProductDesc() { return $this->desc; }
			public function getProductPhotoSrc() { return $this->photoSrc; }

			public function getProductHtml() {
				$str = "<div class='product'>";
					$str .= "<h2>$this->name</h2>";
					$str .= "<img width='100px' src='$this->photoSrc'>";
					$str .= "<p>$this->desc</p>";
				$str .= "</div>";

				return $str;
			}

		}

		$product1 = new Product('Товар 1', 'Описание товара', 'https://avatars.mds.yandex.net/get-mpic/195452/img_id4783826773129378920/9hq');

	?>

	<div class="products">
		<?= $product1->getProductHtml() ?>
	</div>

	<?php

		class A {
			public function foo() {
				static $x = 0;
				echo ++$x;
			}
		}
		$a1 = new A();
		$a2 = new A();
		$a1->foo();
		$a2->foo();
		$a1->foo();
		$a2->foo();

		/** методе foo указано статичнское свойство $x - это говорит о том, что данное свойство будет принадлежать классу!
		 *  поэтому мы увеличиваем свойство $x не у экземпляра класса, а у самого класса.
		 **/

	?>

	<?php

		class A1 {
			public function foo() {
				static $x = 0;
				echo ++$x;
			}
		}
		class B extends A1 {
		}
		$a1 = new A1();
		$b1 = new B();
		$a1->foo();
		$b1->foo();
		$a1->foo();
		$b1->foo();

		/** в данном случае имеем два класса, как результат в каждом классе static $x свой и увиличивается он у класса
		 **/

	?>

	<?php

		class A2 {
			public function foo() {
				static $x = 0;
				echo ++$x;
			}
		}
		class B1 extends A2 {
		}
		$a1 = new A2;
		$b1 = new B1;
		$a1->foo();
		$b1->foo();
		$a1->foo();
		$b1->foo();

		/** выводит тоже самое, исходя из урока было известо, что () после имени класса говорят лишь о том, что имеется конструктор и в него можно
		 * передавать значения. Т.к. у нас нет конструктора, то можем опустить скобки.
		 **/

	?>

</body>
</html>