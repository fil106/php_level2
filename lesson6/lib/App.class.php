<?php
class App
{
	/* Статическая функция Init
	 * Устанавливает подключение к БД
	 * и запускает статический метод данного класса web.
	 */
	public static function Init()
	{
		date_default_timezone_set('Europe/Moscow');	//Установим временную зону по умолчанию для всех функций даты/времени в скрипте
		/*
		Вызовем метод getInstance() класса DB. Файл db.class.php
		Используется метод get('db_user') класса Config с параметром который необходимо получить. Файл Config.class.php
		В указанном примере параметр db_user
		*/
		db::getInstance()->Connect(Config::get('db_host'), Config::get('db_user'), Config::get('db_password'), Config::get('db_base'), Config::get('db_port'));

		//CLI - интерфейс командной строки
		//php_sapi_name() == 'cli' - означает что скрипт запущен с командной строке
		if (php_sapi_name() !== 'cli' && isset($_SERVER) && isset($_GET)) { //Проверим, установленны ли переменные $_SERVER и $_GET

			self::web(isset($_GET['path']) ? $_GET['path'] : '');

		}
	}

	/*
	 * метод разбирает введенный url, изходя из этого получает имя контроллера и метода
	 * которому далее передается управление, если такой не будет найден, то выведем страницу 404
	 */
	protected static function web($url)
	{

		$url = explode("/", $url); //Разбиваем строку с помощью разделителя


		//далее разбираем url
		//допустим ввод не более 3 вложенности
		//пример goods/boots/25
		if (!empty($url[0]))
		{

			$_GET['page'] = $url[0];

			if (!empty($url[1]))
			{

				if (is_numeric($url[1]))
				{

					$_GET['id'] = $url[1];
					$_GET['action'] = 'good';

				}
				else
				{

					$_GET['action'] = $url[1];

				}

				if (isset($url[2]))
				{

					$_GET['id'] = $url[2];

				}

			}

		}
		else
		{
			$_GET['page'] = 'Index';
		}

		if (isset($_GET['page']))
		{

			$controllerName = $_GET['page'] . 'Controller';
			$methodName = isset($_GET['action']) ? $_GET['action'] : 'index';

//			echo $controllerName . ' ' . $methodName;
//			print_r($_GET);

			$controller = new $controllerName();
			$controller->$methodName();

		}

	}

}