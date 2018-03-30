<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Урок №3 PHP2</title>
</head>
<body>

<?php
	require_once 'Twig/Autoloader.php';
	Twig_Autoloader::register();	

	$loader = new Twig_Loader_FileSystem('templates');
	
	$twig = new Twig_Environment($loader);
	
	$template = $twig->loadTemplate('prim1.html');
	
	echo $template->render(array(
		'name' => 'Name User',
		'username' => 'qwerty',
		'password' => 'SecretPassword'
	)
	);

	$template = $twig->loadTemplate('prim2.html');
	
	$num = rand(0,30);
	$div = $num % 2;
	
	echo $template->render(array(
		'num' => $num,
		'div' => $div
	));
	

	$template = $twig->loadTemplate('prim3.html');
	
	$month = date('m',mktime());
	
	echo $template->render(array(
		'month' => $month	
	));	
	
	
	$items = array(
	'Покупка №1',
		'Покупка №2',
		'Покупка №3'
	);
	
	$template = $twig->loadTemplate('prim4.html');
	
	echo $template->render(array(
	'items' => $items
		
	));
	
	$book = array(
		'title' => 'Название книги',
		'author' => 'Автор Книги',
		'publisher' => 'Издательство',
		'category' => 'IT',
		'pages' => '123'
	);
	
	$template = $twig->loadTemplate('prim5.html');
	
	echo $template->render(array(
		'book' => $book,
	));
	
	$nav = array(
		'primary' => array(
			array('name' => 'Имя1', 'url' => '/choise'),
			array('name' => 'Имя2', 'url' => '/choise2'),
			array('name' => 'Имя3', 'url' => '/choise3'),
		),
		'secondary' => array(
			array('name' => 'Имя12', 'url' => '/choise2'),
			array('name' => 'Имя22', 'url' => '/choise22'),
			array('name' => 'Имя32', 'url' => '/choise32'),			
		)
	);
	
		
		$template = $twig->loadTemplate('shop.html');
	echo $template->render(array(
		'nav' => $nav,
		'updated' => '27-03-2018'
	));
	
	
	class ASD
	{
		
	}
	
	$my = new ASD();
	
	try
	{
		$my->myMethod();
	}
	catch(Exception $e)
	{
		echo $e->getCode();
	}
		

?>



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>