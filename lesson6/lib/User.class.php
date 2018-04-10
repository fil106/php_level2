<?php

	class User
	{

		private static $user_data = null;

		public static function getUserData($id_user)
		{

			if (self::$user_data == null && isset($id_user)) {
				self::$user_data = db::getInstance()->SelectRow("select * from users where id_user = :id_user", array('id_user' => $id_user));
			}

			return self::$user_data;

		}

		/*
		 * Запрещаем копировать объект
		 *
		 */
		private function __construct() {}
		private function __sleep() {}
		private function __wakeup() {}
		private function __clone() {}

	}