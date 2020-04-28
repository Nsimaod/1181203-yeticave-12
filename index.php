<?php
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
            ],
            [
                'Название' => 'DC Ply Mens 2016/2017 Snowboard',
                 'Категория' => 'Доски и лыжи',
                 'Цена' => 159999,
                 'URL картинки' => 'img/lot-2.jpg',
            ],
            [
                'Название' => 'Крепления Union Contact Pro 2015 года размер L/XL',
                 'Категория' => 'Крепления',
                 'Цена' => 8000,
                 'URL картинки' => 'img/lot-3.jpg',
            ],
            [
                'Название' => 'Ботинки для сноуборда DC Mutiny Charocal',
                 'Категория' => 'Ботинки',
                 'Цена' => 10999,
                 'URL картинки' => 'img/lot-4.jpg',
            ],
            [
                'Название' => 'Куртка для сноуборда DC Mutiny Charocal',
                 'Категория' => 'Одежда	',
                 'Цена' => 7500,
                 'URL картинки' => 'img/lot-5.jpg',
            ],
            [
                'Название' => 'Маска Oakley Canopy',
                 'Категория' => 'Разное',
                 'Цена' => 5400,
                 'URL картинки' => 'img/lot-6.jpg',
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

require_once('helpers.php');

$main_text=include_template('main.php', ['cats'=>$cats, 'goods'=>$goods]);
print(include_template('layout.php', ['auth'=>$is_auth, 'user'=>$user_name,'mtext'=> $main_text, 'title'=>$title, 'cats'=>$cats]));
?>
