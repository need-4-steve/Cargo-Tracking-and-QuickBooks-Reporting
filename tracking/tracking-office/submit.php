<?php
include('dbconfig.php');
// Fetching Values From the post method
$username = $_POST['username'];

 

//$input = "Test-039856881001Z\r\nTest-039856881001Z\r\nTest-039856881001Z\r\nTest-039856881001Z\r\nTest-9622080430003671211800787698368814\r\nTest-9622080430003671211800787699356508\r\nTest-9622080430003671211800787699356508\r\nTest-420662039405509898642057387742\r\nTest-9622080430003671211800787699356508\r\nTest-9622080430003671211800787699356508\r\nTest-420662039405509898642057387742\r\nTest-420662039405509898642057387742\r\nTest-420662039405509898642057387742\r\nTest-420662039405509898642057387742";
$records = preg_split('/\n|\r\n?/', $username);
foreach ($records as $record) {
//	echo "Record: " . $record . "<br>";

	$pieces = 
$name = "O";
$trackingraw = $record;

if (strlen($trackingraw) > 32){
	
$tracking = substr($trackingraw,-12);
$carrier = "FedEx";

} elseif (strlen($trackingraw) <1){
	
continue;

} else {
	
$tracking = substr($trackingraw,-22);
$carrier = "USPS";
}


 
// attempt insert query execution
$sql = "INSERT INTO barcodesoffice (name, barcode, carrier) VALUES ('$name', '$tracking', '$carrier')";
if(mysqli_query($link, $sql)){
    //header("Location: http://localhost/simon/add-records.php");
	//header("Location: http://192.168.1.5:8080/tracking/add-record-form.php");
	//echo "Name: " . $name . " Tracking#: " . $tracking . "<br>";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
}
// close connection
mysqli_close($link);
?>
