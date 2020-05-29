<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$con = mysqli_connect("localhost", "root", "Sql20Of30","yeticave");
mysqli_set_charset($con, "utf8");
