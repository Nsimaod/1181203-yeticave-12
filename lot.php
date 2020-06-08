<?php
include 'helpers.php';
include 'connect.php';
$lot_id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if($lot_id != NULL)
{
    $sql='SELECT l.name lot_name, description, image, start_price, c.name cat_name, code, bid_step, expiration_date,
    coalesce((SELECT bid_amount FROM bid WHERE lot_id=l.id ORDER BY bid_date DESC LIMIT 1), start_price) price
    FROM lot l JOIN category c ON l.category_id = c.id WHERE l.id = ?';
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $lot_id);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($res);
    if($row != NULL)
    {
        $row['time_left'] = get_time_left($row['expiration_date']);
        print include_template('lot_tmpl.php', ['data' => $row]);
    }
    else
    {
        http_response_code(404);
        include 'pages/404.html';
    }
}
else
{
    http_response_code(404);
    include 'pages/404.html';
}
