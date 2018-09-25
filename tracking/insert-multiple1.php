<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
include('connection.php'); 
 
// Escape user inputs for security
$input = $_REQUEST['barcode'];

//$input = "Test-039856881001Z\r\nTest-039856881001Z\r\nTest-039856881001Z\r\nTest-039856881001Z\r\nTest-9622080430003671211800787698368814\r\nTest-9622080430003671211800787699356508\r\nTest-9622080430003671211800787699356508\r\nTest-420662039405509898642057387742\r\nTest-9622080430003671211800787699356508\r\nTest-9622080430003671211800787699356508\r\nTest-420662039405509898642057387742\r\nTest-420662039405509898642057387742\r\nTest-420662039405509898642057387742\r\nTest-420662039405509898642057387742";
$records = preg_split("/\n|\r\n?/", $input);
foreach ($records as $record) {
	echo "Record: " . $record . "<br>";
if($record ==''){
	echo "nothing!";
}
else {
	$pieces = explode("-", $record);
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
//$sql = "INSERT INTO barcodes (name, barcode, carrier) VALUES ('$name', '$tracking', '$carrier')";
//Cheng
$sql = "INSERT INTO barcodespartside (name, barcode, carrier) VALUES ('$name', '$tracking', '$carrier')";

if(mysqli_query($link, $sql)){
    //header("Location: http://localhost/simon/add-record-form.php");
	//header("Location: http://192.168.1.5:8080/tracking/add-record-form.php");
	echo "Name: " . $name . " Tracking#: " . $tracking . "<br>";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
}
}
// close connection
mysqli_close($link);

?>