<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
include('connection.php'); 

$input = $_POST['barcode'];

$pieces = explode("-", $input);
$name = $pieces[0];
$trackingraw = $pieces[1];

if (strlen($trackingraw) > 33){
	
$tracking = substr($trackingraw,-12);
$carrier = "FedEx";

} else {
	
$tracking = substr($trackingraw,-22);
$carrier = "USPS";
}

/* $last_name = mysqli_real_escape_string($link, $_REQUEST['last_name']);
$email = mysqli_real_escape_string($link, $_REQUEST['email']); */
 
// attempt insert query execution
$sql = "INSERT INTO barcodes (name, barcode, carrier) VALUES ('$name', '$tracking', '$carrier')";
if(mysqli_query($link, $sql)){
    //header("Location: http://192.168.1.5:8080/tracking/add-record-form.php");
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
 
// close connection
mysqli_close($link);
?>