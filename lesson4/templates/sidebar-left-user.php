<?php	if(isset($_SESSION['IdUserSession'])): ?>

	<div class="sidebar_user">
		<h2>Greetings, <b><?= $_SESSION['login'] ?></b></h2>
		<a class="btn btn-danger" href="?logout">LOGOUT</a>
	</div>

<?php endif; ?>