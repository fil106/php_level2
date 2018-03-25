<!doctype html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<title>Урок 2 ДЗ</title>
</head>
<body>

	<p>
		Не смог реализовать задание из домашки, реализовал абстрактный класс и наследование из примера публикации.<br>
		Они могут быть 2-х видов это просто новость и новость с изображением, существует абстрактный класс Publication, в нем описываем методы и свойства.<br>
		Далее наследуем данный класс обычным классом, который выступает в роли "типа новости".
	</p>

	<?php

		abstract class Publication {

			public $title;
			public $date;
			public $content;
			public $author_name;

			abstract public function printItem();

			function __construct($row) {

				$this->title = $row['title'];
				$this->date = $row['date'];
				$this->content = $row['content'];
				$this->author_name = $row['author_name'];

			}
		}

		class NewsPublication extends Publication {

			public function printItem() {

				echo '<br><b>Новость:'.$this->title;
				echo '<br>Дата:'.$this->date;
				echo '<br>Автор:'.$this->author_name.'</b>';
				echo '<br>'.$this->content;
				echo '<hr>';

			}
		}

		class PhotoPublication extends Publication {

			public $preview;

			function __construct($row)
			{
				parent::__construct($row);
				$this->preview = $row['preview'];
			}

			public function printItem() {

				echo '<br><a href="'.$this->preview.'"><img height="250px" src="'.$this->preview.'"></a>';
				echo '<br><b>Новость:'.$this->title;
				echo '<br>Дата:'.$this->date;
				echo '<br>Автор:'.$this->author_name.'</b>';
				echo '<br>'.$this->content;
				echo '<hr>';

			}
		}

		$row = [
			'title' => 'Новость 1',
			'date' => '10.08.2018',
			'content' => 'Содержимое статьи какой-то текст...',
			'author_name' => 'Филипп'
		];

		$news = new NewsPublication($row);
		$news->printItem();

		$row1 = [
				'title' => 'Новость 2',
				'preview' => 'https://avatars.mds.yandex.net/get-pdb/69339/998d5db3-6765-4f24-ac20-ec3d94a82394/s1200',
				'date' => '10.05.2018',
				'content' => 'Содержимое статьи какой-то текст...',
				'author_name' => 'Алекснд'
		];

		$photoPublication = new PhotoPublication($row1);
		$photoPublication->printItem();

	?>

</body>
</html>