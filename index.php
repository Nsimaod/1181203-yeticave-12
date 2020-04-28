<?php
include 'helpers.php';

$is_auth = rand(0, 1);

$user_name = 'Achez'; // укажите здесь ваше имя
$title='Yeti Cave';
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
                 'Дата истечения' => '2020-04-31',
            ],
            [
                'Название' => 'Маска Oakley Canopy',
                 'Категория' => 'Разное',
                 'Цена' => 5400,
                 'URL картинки' => 'img/lot-6.jpg',
                 'Дата истечения' => '2020-05-05',
            ],
        ];

function format_price(float $input): string
{
    $output=ceil($input);
    /* if($output >= 1000) */
    $output = number_format($output, 0, ',', ' ');
    $output .= ' ₽';
    return $output;
}


function get_time_left(string $deadline): array
{
    date_default_timezone_set('Europe/Moscow');
    $deadlineU=strtotime($deadline);
    $nowU=time();
    $diff=$deadlineU - $nowU;
    $hoursLeft=floor($diff/3600);
    $minutesLeft=floor(($diff-($hoursLeft*3600))/60);
    return ['Hours'=>$hoursLeft, 'Minutes'=>$minutesLeft];
}

$main_text=include_template('main.php', ['cats'=>$cats, 'goods'=>$goods]);
print include_template('layout.php', ['auth'=>$is_auth, 'user'=>$user_name,'main'=> $main_text, 'title'=>$title, 'cats'=>$cats]);

?>
<!--
function get_time_left(string $deadline): array
{
date_default_timezone_set('Europe/Moscow');
$deadlineU=strtotime($deadline);
$nowU=time();
$diff=$deadlineU - $nowU;
$hoursLeft=0;
$minutesLeft=0;
while ($diff > 3600)
{
$hoursLeft=$hoursLeft+1;
$diff-=3600;
}
while ($diff > 60)
{
$minutesLeft=$minutesLeft+1;
$diff-=60;
}
return ['Hours'=>$hoursLeft, 'Minutes'=>$minutesLeft];
}

?>
-->
