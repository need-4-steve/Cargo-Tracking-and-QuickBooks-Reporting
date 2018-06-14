<?php
$db_host = "LIBRASERVER";
$db_user = "simon";
$db_pass = "L1bra123";
$db_name = "test";

$link = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ("Could not connect to MySQL");



if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$results = mysqli_query("SELECT * FROM barcodes,$link ");
if(!$results)
{
    die("Database query failed".mysql_error());
}



?>
