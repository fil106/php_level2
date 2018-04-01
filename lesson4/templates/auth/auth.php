<div class="content_blk">

	<?php if ( $isAuth ): ?>

		<h2>You are welcome, <b><?= $_SESSION['login'] ?></b></h2>
		<a class="btn btn-danger" href="?logout">Logout</a>

	<?php else: ?>

		<h3>Page Sign In</h3>

		<div style="color: red"><?= array_shift($ERRORS) ?></div>

		<form id="auth_form" action="/" method="POST">

			<label for="auth_login">Your Login</label>
			<input id="auth_login" name="auth_login" type="text" value="<?= $_POST['auth_login'] ?>">
			<label for="auth_pass">Your Password</label>
			<input id="auth_pass" name="auth_pass" type="password">
			<input id="auth_remember" name="auth_remember" type="checkbox" value="true"><span> - remember me</span>

			<p class="error"></p>

			<input name="auth" type="submit" value="Enter">

		</form>

	<?php endif; ?>

</div>