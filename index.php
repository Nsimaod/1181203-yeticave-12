<?php
include 'helpers.php';

$is_auth = rand(0, 1);

$user_name = 'Achez'; // укажите здесь ваше имя
$title='Yeti Cave';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$con = mysqli_connect("localhost", "root", "Sql20Of30","yeticave");
mysqli_set_charset($con, "utf8");
$sql="SELECT id, name, category_id, start_price, image, creation_date, expiration_date FROM lot WHERE expiration_date >= CURRENT_TIMESTAMP ORDER BY expiration_date DESC LIMIT 9";
$result = mysqli_query($con, $sql);
$rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

/*Теперь нам нужно извлечь цену и название категории*/
foreach($rows as $num => $row)
{
    /*Начнём с категории*/
    $cat_id=$row['category_id'];
    $sql='SELECT name FROM category WHERE id=?';
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $cat_id);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    /*Дописываем элементы в $rows, как будто это были поля в базе*/
    $rows[$num]['cat_name']=(mysqli_fetch_assoc($res))['name'];
    $rows[$num]['cat_code']=(mysqli_fetch_assoc($res))['code'];
    /*Теперь с ценой разбираемся...*/
    $lot_id=$row['id'];
    $sql='SELECT * FROM bid WHERE lot_id=?';
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $lot_id);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $bids = mysqli_fetch_all($res, MYSQLI_ASSOC);
    if($bids == NULL) /*Ставок нет - показываем стартовую цену*/
    {
        $rows[$num]['price']=$row['start_price'];
    }
    else
    { /*Поиск максимальной ставки*/
        $lowest=$row['start_price'];
        foreach($bids as $bid)
        {
            if($bid['bid_amount'] > $lowest)
            {
                $lowest = $bid['bid_amount'];
            }
        }
        $rows[$num]['price']=$lowest;
    };
}

/*заполняем массив $cats*/
$sql = "SELECT * FROM category";
$result = mysqli_query($con, $sql);
$cats = mysqli_fetch_all($result, MYSQLI_ASSOC);

foreach($rows as $row)
{
    $good['Название']=$row['name'];
    $good['Категория']=$row['cat_name'];
    $good['Цена']=$row['price'];
    $good['URL картинки']=$row['image'];
    $good['Дата истечения']=$row['expiration_date'];
    $goods[]=$good;
}

$main_text=include_template('main.php', ['cats'=>$cats, 'goods'=>$goods]);
print include_template('layout.php', ['auth'=>$is_auth, 'user'=>$user_name,'main'=> $main_text, 'title'=>$title, 'cats'=>$cats]);

?>
