<div class="sale_products">

	<h1>Sale products</h1>

	<div class="catalog">

		<?php foreach ($content['sale_product'] as $item): ?>

			<?= getItemHtml('', $item) ?>

		<?php endforeach; ?>

	</div>

</div>