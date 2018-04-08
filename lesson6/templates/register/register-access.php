<div class="content_blk">
	<?php

		if(isset($_POST['reg'])) {

			$login = htmlspecialchars($_POST['register_login']);
			$pass = htmlspecialchars($_POST['register_pass']);
			$pass2 = htmlspecialchars($_POST['register_pass_2']);
			$passHash = password_hash($pass, PASSWORD_DEFAULT);

			if($pass === $pass2) {

				if(preg_match('/^[a-z]+([a-z0-9]+){0,2}$/i', $login)) {

					$sql = "insert into users (login, pass) values ('$login', '$passHash')";

					if(Db::getInstance()->query($sql)) { ?>

						<h3>Вы успешно зарегестрировались на нашем сайте.</h3>
						<p>Перейдите на страницу авторизации, для авторизации на сайте. Только авторизованный пользователь может совершать покупку в нашем интернет магазине!</p>
						<a href="/auth">Страница авторизации</a>

					<?php } else {

						echo "<p>Произошла ошибка создания пользователя.</p>";

					}

				} else {

					echo "<p>Логин не может содеражть служебные и математические символы, должен начинаться с буквы, кириллица не допустима!</p>";

				}
			} else {

				echo "<p>Веденные пароли не совпадают</p>";

			}

		} else {

			echo 'Не было submit от формы';

		}

	?>

</div>