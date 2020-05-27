<?php
include 'helpers.php';

$is_auth = rand(0, 1);

$user_name = 'Achez'; // укажите здесь ваше имя
$title='Yeti Cave';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$con = mysqli_connect("localhost", "root", "Sql20Of30","yeticave");
mysqli_set_charset($con, "utf8");
$sql="SELECT id, name, category_id, start_price, image, creation_date, expiration_date FROM lot ORDER BY expiration_date DESC LIMIT 4";
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

foreach($rows as $row)
{
    print "id: ".$row['id']. " Name: ".$row['name']." Cat_name: ".$row['cat_name'];
    print " Created: ".$row['creation_date']." Expires: ".$row['expiration_date']."<br>";
    print "Start price: ".$row['start_price']." Current price: ".$row['price'];
    $image=$row['image'];
    print("<img src=\"$image\" width=\"50px\"><br><hr><br>");
}

$cats=['Доски и лыжи','Крепления','Ботинки','Одежда','Инструменты','Разное'];

$goods=[
            [
                'Название' => '2014 Rossignol District Snowboard',
                 'Категория' => 'Доски и лыжи',
                 'Цена' => 10999,
                 'URL картинки' => 'img/lot-1.jpg',
                 'Дата истечения' => '2020-05-01',
            ],
            [
                'Название' => 'DC Ply Mens 2016/2017 Snowboard',
                 'Категория' => 'Доски и лыжи',
                 'Цена' => 159999,
                 'URL картинки' => 'img/lot-2.jpg',
                 'Дата истечения' => '2020-05-02',
            ],
            [
                'Название' => 'Крепления Union Contact Pro 2015 года размер L/XL',
                 'Категория' => 'Крепления',
                 'Цена' => 8000,
                 'URL картинки' => 'img/lot-3.jpg',
                 'Дата истечения' => '2020-04-29',
            ],
            [
                'Название' => 'Ботинки для сноуборда DC Mutiny Charocal',
                 'Категория' => 'Ботинки',
                 'Цена' => 10999,
                 'URL картинки' => 'img/lot-4.jpg',
                 'Дата истечения' => '2020-04-30',
            ],
            [
                'Название' => 'Куртка для сноуборда DC Mutiny Charocal',
                 'Категория' => 'Одежда	',
                 'Цена' => 7500,
                 'URL картинки' => 'img/lot-5.jpg',
                 'Дата истечения' => '2020-04-28',
            ],
            [
                'Название' => 'Маска Oakley Canopy',
                 'Категория' => 'Разное',
                 'Цена' => 5400,
                 'URL картинки' => 'img/lot-6.jpg',
                 'Дата истечения' => '2020-05-05',
            ],
        ];


$main_text=include_template('main.php', ['cats'=>$cats, 'goods'=>$goods]);
print include_template('layout.php', ['auth'=>$is_auth, 'user'=>$user_name,'main'=> $main_text, 'title'=>$title, 'cats'=>$cats]);

?>
