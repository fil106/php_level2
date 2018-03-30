<?php
header("Cache-Control: no-store, no-cache, must-revalidate");
session_start();

require_once 'autoload.php'; //подключаем файл с методами автозагрузки классов	



try{
	if ($_POST['metod'] == 'ajax')
	{
		ob_start(); //Запускаем буферизауию вывода	
		
		db::getInstance()->Connect(Config::get('db_user'), Config::get('db_password'), Config::get('db_base'));
		
		
		$PageAjax = $_POST['PageAjax'];	//Получаем действие на AJAX
		$data = Ajax::$PageAjax();		
		$view = Ajax::$views;
		
		$loader = new Twig_Loader_Filesystem(Config::get('path_templates'));
		$twig = new Twig_Environment($loader);
		$template = $twig->loadTemplate($view);
		
		echo $template->render($data);
		$str = ob_get_contents(); //Записываем в переменную то, что в буфере
		
		ob_end_clean(); //Очищаем буфер

		echo json_encode($str);
	}
	else
	{
	    App::init();	//Запускаем статический метод init класса App. В соответствии с внутренними правилами имен находится в файле app.class.php
	}

}
catch (PDOException $e){
    echo "DB is not available";
    var_dump($e->getTrace());
}
catch (Exception $e){
    echo $e->getMessage();
}

?>