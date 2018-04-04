<div class="top_products">

	<h1>Top products</h1>

	<div class="catalog">

		<?php foreach ($content['top_product'] as $item): ?>

			<?= getItemHtml('hot', $item) ?>

		<?php endforeach; ?>

	</div>

</div>