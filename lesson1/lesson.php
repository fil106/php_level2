<!doctype html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
				content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Lesson1</title>
</head>
<body>

<?php


	class Article {
		public $id;
		public $title;
		public $content;

		public function view() {
			echo "<h1>$this->title</h2>";
			echo "<p>$this->content</p>";
		}
	}

	$a = new Article;
	$a->id = 1;
	$a->title = 'Новая статья';
	$a->content = 'Какой-то текст';

	$a->view();

	class Article2 {
		public $id;
		public $title;
		public $content;

		function __construct($id, $title, $content) {
			$this->id = $id;
			$this->title = $title;
			$this->content = $content;
		}

		public function view() {
			echo "<h1>$this->title</h2>";
			echo "<p>$this->content</p>";
		}
	}

	$b = new Article2(2, "Новая статья 2", "Контент");
	$b->view();

	class A {
		public function Test() {
			echo "Это класс A<br>";
		}

		public function call() {
			$this->Test();
		}
	}

	class B extends A {
		public function Test() {
			echo "Это класс B<br>";
		}
	}

	$a = new A;
	$b = new b;

	$a->call();
	$b->Test();
	$b->call();

	class MathOperation {
		const PI = 3.14;

		public function abs($x) {
			return ($x >= 0) ? $x : (-1) * $x;
		}

		public function Sc($rad) {
			return 2 * self::PI * $rad;
		}
	}

	$m = new MathOperation;
	echo $m->abs(-153) . '<br>';
	echo $m->Sc(10) . '<br>';

	class MathOperation2 {
		const PI = 3.14;

		public static function abs($x) {
			return ($x >= 0) ? $x : (-1) * $x;
		}

		public static function Sc($rad) {
			return 2 * self::PI * $rad;
		}
	}

	echo MathOperation2::abs(-153);

?>

</body>
</html>