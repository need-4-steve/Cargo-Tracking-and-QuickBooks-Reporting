<?php
$db_host = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "libraxampp";

$link = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ("Could not connect to MySQL");
/* //$link = mysqli_connect($db_host, $db_user, $db_pass) or die ("Could not connect to MySQL");
$sql = "INSERT INTO barcodes (name, barcode, carrier) VALUES ('Simon', '7251674', 'DHL')";


if(mysqli_query($link, $sql)){
    //header("Location: http://192.168.1.5:8080/tracking/add-record-form.php");
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
 
// close connection
mysqli_close($link);

 */
?>
