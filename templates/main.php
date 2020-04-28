<main class="container">
    <section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <!--заполните этот список из массива категорий-->
            <!--<li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html">Имя категории</a>
            </li> -->
            <?php foreach($cats as $val): ?>
            <li class="promo__item promo__item--boards">
            <a class="promo__link" href="pages/all-lots.html"><?= htmlspecialchars($val) ?></a>
            </li>
            <?php endforeach ?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <!--заполните этот список из массива с товарами-->
            <?php foreach($goods as $val): ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?= htmlspecialchars($val['URL картинки']) ?>" width="350" height="260" alt="<?= htmlspecialchars($val['Название']) ?>">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?= htmlspecialchars($val['Категория']) ?></span>
                    <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?= htmlspecialchars($val['Название']) ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount"><?= format_price($val['Цена']) ?></span>
                            <span class="lot__cost"><?= format_price($val['Цена']) ?></span>
                        </div>
                        <?php $timeLeft=get_time_left($val['Дата истечения']); ?>
                        <div class="lot__timer timer <?php if ($timeLeft['Hours']==0): ?> timer--finishing <?php endif ?> ">
                        <?= str_pad($timeLeft['Hours'], 2, "0", STR_PAD_LEFT).':'.str_pad($timeLeft['Minutes'], 2, "0", STR_PAD_LEFT) ?>
                        </div>
                    </div>
                </div>
            </li>
            <?php endforeach ?>
        </ul>
    </section>
</main>
