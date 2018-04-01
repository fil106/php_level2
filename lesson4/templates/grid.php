<div class="content_blk">

	<h1>List of all goods</h1>

</div>

	<div class="catalog">

		<?php foreach ($content['goods'] as $item): ?>

			<?= getItemHtml(null, $item) ?>

		<?php endforeach; ?>

	</div>

	<button class="show_more" data-limit="6">Show next 6 goods</button>