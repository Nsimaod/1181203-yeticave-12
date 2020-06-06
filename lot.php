<?php
include 'helpers.php';
include 'connect.php';
$lot_id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if($lot_id != NULL)
{
    $sql='SELECT * FROM lot WHERE id = ?';
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $lot_id);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($res);
    print include_template('lot_tmpl.php', ['data' => $row]);
}
else
{
    require 'pages/404.html';
}
