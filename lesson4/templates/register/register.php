<div class="register_blk">

	<h3>Register new user</h3>

	<form id="register_form" action="/register-access/" method="POST">

		<label for="register_login">Enter your login *</label>
		<input id="register_login" name="register_login" type="text" required>
		<label for="register_pass">Enter your password *</label>
		<input id="register_pass" name="register_pass" type="password" required>
		<label for="register_pass_2">Enter your password again *</label>
		<input id="register_pass_2" name="register_pass_2" type="password" required>

		<p class="error"></p>

		<input type="submit" name="reg" value="Отправить">

	</form>

	<p>Input with symbol "*" are necessary!</p>

</div>