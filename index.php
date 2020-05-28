<?php
include 'helpers.php';

$is_auth = rand(0, 1);

$user_name = 'Achez'; // укажите здесь ваше имя
$title='Yeti Cave';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$con = mysqli_connect("localhost", "root", "Sql20Of30","yeticave");
mysqli_set_charset($con, "utf8");
$sql="SELECT L.name lot_name, start_price, image, C.name cat_name, expiration_date, (SELECT bid_amount FROM bid WHERE lot_id=L.id ORDER BY bid_date DESC LIMIT 1) last_bid FROM lot L JOIN category C ON L.category_id = C.id WHERE expiration_date >= CURRENT_TIMESTAMP ORDER BY creation_date DESC  LIMIT 9";
$result = mysqli_query($con, $sql);
$goods = mysqli_fetch_all($result, MYSQLI_ASSOC);

foreach($goods as $num => $row)
{
    if($row['last_bid'] == NULL) /*Ставок нет - показываем стартовую цену*/
    {
        $goods[$num]['price']=$row['start_price'];
    }
    else
    {
        $goods[$num]['price']=$row['last_bid'];
    };
}

/*заполняем массив $cats*/
$sql = "SELECT * FROM category";
$result = mysqli_query($con, $sql);
$cats = mysqli_fetch_all($result, MYSQLI_ASSOC);

$main_text=include_template('main.php', ['cats'=>$cats, 'goods'=>$goods]);
print include_template('layout.php', ['auth'=>$is_auth, 'user'=>$user_name,'main'=> $main_text, 'title'=>$title, 'cats'=>$cats]);

?>
