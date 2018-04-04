<div class="new_products">

	<h1>New products</h1>

	<div class="catalog">

		<?php foreach ($content['new_product'] as $item): ?>

      <?= getItemHtml('new', $item) ?>

		<?php endforeach; ?>

	</div>

</div>