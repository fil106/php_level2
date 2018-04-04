<?php

function auth($login = null, $pass = null, $rememberme = false)
{
	$isAuth = 0;

	if ($rememberme == "true")
	{
		$rememberme = true;
	}
	else
	{
		$rememberme = false;
	}

	if (!empty($login))   //Если попытка авторизации через форму, то пытаемся авторизоваться
	{
		$isAuth = authWithCredential($login, $pass, $rememberme);
//		echo "Авторизация по форме";
	}
	elseif ($_SESSION['IdUserSession'])    //иначе пытаемся авторизоваться через сессии
	{
		$isAuth = checkAuthWithSession($_SESSION['IdUserSession']);
//		echo "Авторизация по сессии";
	}
	else // В последнем случае пытаемся авторизоваться через cookie
	{
		$isAuth = checkAuthWithCookie();
//		echo "авторизация по cookie";
	}

	if ($_POST['ExitLogin'])
	{
		$isAuth = UserExit();
	}

	if ($isAuth)
	{
		$id_user = $_SESSION['IdUserSession'];
		$sql = "select * from users where id_user = (select id_user from users_auth where hash_cookie = '$id_user')";
		$isAuth = (int)Db::getInstance()->query($sql);
	}

	return $isAuth;

}

/*
Осуществляем удаление всех переменных, отвечающих за авторизацию пользователя.
*/
function UserExit()
{
	//Удаляем запись из БД об авторизации пользователей
	$IdUserSession = $_SESSION['IdUserSession'];
	$sql = "delete from users_auth where hash_cookie = '$IdUserSession'";
	$isAuth = (int)Db::getInstance()->query($sql);

	//Удаляем все переменные сессий
	unset($_SESSION['id_user']);
	unset($_SESSION['IdUserSession']);
	unset($_SESSION['login']);

	//Удаляем все переменные cookie
	@setcookie('idUserCookie','', time() - 3600 * 24 * 7);

	return $isAuth = 0;
}

/*Авторизация пользователя
при использования технологии хэширования паролей
$username - имя пользователя
$password - введенный пользователем пароль
*/
function authWithCredential($username, $password, $rememberme = false)
{
	$isAuth = 0;

//	$passHash = password_hash($password, PASSWORD_DEFAULT);
	$sql = "select id_user, login, pass from users where login = '$username'";
	$user_date = Db::getInstance()->selectRow($sql);

	if ($user_date)
	{
		$passHash = $user_date['pass'];
		$id_user = $user_date['id_user'];
		$idUserCookie = microtime(true) . rand(100,1000000000000);
		$idUserCookieHash = hash("sha256", $idUserCookie);

		if (password_verify($password, $passHash))
		{

			$_SESSION['login'] = $username;
			$_SESSION['id_user'] = $id_user;
			$_SESSION['IdUserSession'] = $idUserCookieHash;

			/*
			На уроке неправильно был написан SQL запрос! Правильное написание в коде, написание которое было, закоментировано в данном коментарии

			$sql = "insert into users_auth (id_user, hash_cookie, date, prim) values ($id_user, $idUserCookieHash, now(), $idUserCookie)";

			*/
			$sql = "insert into users_auth (id_user, hash_cookie, date, prim) values ('$id_user', '$idUserCookieHash', now(), $idUserCookie)";
			Db::getInstance()->query($sql);

			if ($rememberme == true)
			{
				setcookie('idUserCookie',$idUserCookieHash, time() + 3600 * 24 * 7, '/');
			}
			$isAuth = 1;
		}
		else
		{
			UserExit();
		}
	}
	else
	{
		UserExit();
	}

	return $isAuth;
}

/* Авторизация при помощи сессий
При переходе между страницами происходит автоматическая авторизация
*/
function checkAuthWithSession($IdUserSession)
{

	$isAuth = 0;

	$sql = "select users.login, users_auth.* from users_auth INNER JOIN Users on users_auth.id_user = Users.id_user where users_auth.hash_cookie = '$IdUserSession'";

	$user_date = Db::getInstance()->selectRow($sql);


	if ($user_date)
	{
		$_SESSION['login'] = $user_date['login'];
		$_SESSION['IdUserSession'] = $IdUserSession;
		$isAuth = 1;
	}
	else
	{
		$isAuth = 0;
		UserExit();
	}

	return $isAuth;
}

function checkAuthWithCookie()
{
	$isAuth = 0;

	$idUserCookie = $_COOKIE['idUserCookie'];

	$sql = "select * from users_auth where hash_cookie = '$idUserCookie'";
	$user_date = Db::getInstance()->select($sql);

	if ($user_date)
	{
		checkAuthWithSession($idUserCookie);
		$isAuth = 1;
	}
	else
	{
		$isAuth = 0;
		UserExit();
	}

	return $isAuth;
}