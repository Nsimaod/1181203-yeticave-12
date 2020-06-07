<?php
include 'helpers.php';

$is_auth = rand(0, 1);

$user_name = 'Achez'; // укажите здесь ваше имя
$title='Yeti Cave';

include 'connect.php';
$sql="SELECT L.id lot_id, L.name lot_name, start_price, image, C.name cat_name, expiration_date,
coalesce((SELECT bid_amount FROM bid WHERE lot_id=L.id ORDER BY bid_date DESC LIMIT 1), L.start_price) price
FROM lot L JOIN category C ON L.category_id = C.id
WHERE expiration_date >= CURRENT_TIMESTAMP
ORDER BY creation_date DESC LIMIT 9";
$result = mysqli_query($con, $sql);
$goods = mysqli_fetch_all($result, MYSQLI_ASSOC);

/*заполняем массив $cats*/
$sql = "SELECT * FROM category";
$result = mysqli_query($con, $sql);
$cats = mysqli_fetch_all($result, MYSQLI_ASSOC);

$main_text=include_template('main.php', ['cats'=>$cats, 'goods'=>$goods]);
print include_template('layout.php', ['auth'=>$is_auth, 'user'=>$user_name,'main'=> $main_text, 'title'=>$title, 'cats'=>$cats]);
