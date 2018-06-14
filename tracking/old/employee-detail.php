<?php

include('connection.php'); 

$emp = $_POST['employee'];
$start = $_POST['datepicker3'];
$end = $_POST['datepicker4'];

if($emp == "Select Employee"){
	echo "<h2>Please select an employee!</h2>
	<br><br>
	<a href='search.php'>Back to Search</a>";
} else {
if($start == "All"){ 

	$dates = "";

} 
	else {

			if($end == "All"){
	
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($start));
				$dates = "timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY AND";
			}
			else {
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($end));

				$dates = "timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY AND";

		}

	}



echo "query: SELECT Name, barcode, timestamp FROM `barcodes` WHERE $dates Name LIKE '$emp'";


$result = mysqli_query($link,"SELECT Name, barcode, timestamp FROM `barcodes` WHERE $dates Name LIKE '$emp' ORDER BY timestamp");

echo "<a href='search.php'>Back to Search</a>
<br><br>
<table border='1' cellpadding='5'>
<tr>
<th>Row</th>
<th>Date</th>
<th>Name</th>
<th>Tracking Number</th>
</tr>"
;
$rn =1;
while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $rn . "</td>";
echo "<td>" . $row['timestamp'] . "</td>";
echo "<td>" . $row['Name'] . "</td>";
echo "<td align='right'>" . $row['barcode'] . "</td>";
echo "</tr>";
$rn++;
}
echo "</table>";
}
mysqli_close($link);
?>