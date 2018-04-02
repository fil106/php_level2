<?php

	class Db
	{

		private static $_instance = null;

		// Объект инициализирующийся в момент создния экземпляра класса
		// хранит в себе объект PDO с параметрами, что передали в метод connect
		private $db;

		/*
		 * return Obj
		 * Объект создается один раз, в независимости от количества попыток создания
		 */
		public static function getInstance()
		{

			if (self::$_instance == null) {
				self::$_instance = new Db();
			}
			return self::$_instance;

		}

		/*
		 * Запрещаем копировать объект
		 * Пока не понимаю, что это значит
		 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		 */
		private function __construct() {}
		private function __sleep() {}
		private function __wakeup() {}
		private function __clone() {}

		/*
		 * write $db
		 * Метод выполняет соединение с БД
		 */
		public function connect($host = 'localhost', $user, $password, $dbname, $port = 3306)
		{

			// DSN - database source name
			// в $dsn задается тип БД, с которым будем работать (mysql), хост, имя базы данных, порт и чарсет
			$dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=UTF8;";

			// укажем некоторые опции
			$opt = [
					PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,			// Выводит ошибки в виде исключений
					PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC	// По умолчанию FETCH будет возвращать ассоциативный массив
			];

			$this->db = new PDO($dsn, $user, $password, $opt);

		}

		/*
		 * Метод выполняет запрос к Бд
		 */
		public function query($sql, $values = [])
		{

			$res = $this->db->prepare($sql);
			$res->execute($values);
			return $res;

		}

		/*
		 * Метод выполняет запрос с выборкой данных
		 */
		public function select($sql, $values = [])
		{

			$res = $this->query($sql, $values);
			if ($res) {
				return $res->fetchAll();
			}

		}

		/*
		 * Метод выполняет запрос с выборкой данных для одной строки
		 */
		public function selectRow($sql, array $values = [])
		{

			$stmt = $this->query($sql, $values);
			if ($stmt) return $stmt->fetchAll()[0];

		}

	}