<?php

require_once('engine/db.php');
require_once('config/config.php');
require_once('engine/resize.php');
require_once('engine/function.php');

$galery = DownloadImage();



//Создаем простейший маршрутизатор
$templ = 'index.html';

if (isset($_GET['id']))
{
	$id = $_GET['id'];
	$templ = 'foto.html';
	$galery = foto($id)[0];
}

if (isset($_GET['error']))
{
	$templ = 'error404.html';
}

// подгружаем и активируем авто-загрузчик Twig-а
require_once 'engine/Twig/Autoloader.php';
Twig_Autoloader::register();
 
try {
  // указывае где хранятся шаблоны
  $loader = new Twig_Loader_Filesystem('../templates');
 
  // инициализируем Twig
  $twig = new Twig_Environment($loader);
 
 
  // подгружаем шаблон
  $template = $twig->loadTemplate($templ); 
 
  // передаём в шаблон переменные и значения
  // выводим сформированное содержание
  echo $template->render(array(
    'galery' => $galery,
    'UPLOAD_SMALL_DIR' => UPLOAD_SMALL_DIR,
	'UPLOAD_DIR' => UPLOAD_DIR

  ));
 
} catch (Exception $e) {
  die ('ERROR: ' . $e->getMessage());
}




?>
