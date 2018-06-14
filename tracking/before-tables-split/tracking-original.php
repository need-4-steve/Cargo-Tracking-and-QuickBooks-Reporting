<?php
include('connection.php'); 

$tracking = $_POST['tracking'];


//echo "query: SELECT Name, barcode, timestamp FROM `barcodes` WHERE barcode LIKE '$tracking' ORDER BY timestamp";

if($tracking == ""){
	echo "<h2>Please enter a tracking number!</h2>
	<br><br>
	<a href='search.php'>Back to Search</a>";
} else {
$result = mysqli_query($link,"SELECT Name, barcode, carrier, timestamp FROM `barcodes` WHERE barcode LIKE '$tracking' ORDER BY timestamp");

echo "<a href='search.php'>Back to Search</a>
<br><br>
<h3>Scan Details for Tracking Number: " . $tracking . "</h3>
<table border='1' cellpadding='5'>
<tr>
<th>Date Scanned</th>

<th>Scanned By</th>
<th>Carrier</th>
<th>Tracking Number</th>
</tr>"
;
$rn =1;
while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['timestamp'] . "</td>";
echo "<td>" . $row['Name'] . "</td>";
echo "<td>" . $row['carrier'] . "</td>";
echo "<td align='right'>" . $row['barcode'] . "</td>";
echo "</tr>";
$rn++;
}
echo "</table>";
}

mysqli_close($link);
?>