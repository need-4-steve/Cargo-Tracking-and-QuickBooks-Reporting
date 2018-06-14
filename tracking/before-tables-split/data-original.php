<?php
include('connection.php'); 

$start = $_POST['datepicker1'];
$end = $_POST['datepicker2'];

$startf = $start;
$endf = $end;

if($start == "All"){ 

	$dates = "";

} 
	else {

			if($end == "All"){
	
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($start));
				$endf = $startf;
				$dates = "WHERE timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY";
			}
			else {
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($end));

				$dates = "WHERE timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY";

		}

	}

//echo "query: SELECT Name, COUNT(barcode) AS TotalScans FROM `barcodes` $dates ORDER BY Name";


$result = mysqli_query($link,"SELECT Name, COUNT(barcode) AS TotalScans FROM `barcodes` $dates GROUP BY Name ORDER BY Name");

echo "<a href='search.php'>Back to Search</a>
<br><br>
<h3>Scan Totals for " . $startf . " through " . $endf . "</h3>
<table border='1' cellpadding='5'>
<tr>
<th>Row</th>
<th>Name</th>
<th>Total Scans</th>
</tr>"
;
$rn =1;
while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $rn . "</td>";
echo "<td>" . $row['Name'] . "</td>";
echo "<td align='right'>" . $row['TotalScans'] . "</td>";
echo "</tr>";
$rn++;
}
echo "</table>";

mysqli_close($link);
?>