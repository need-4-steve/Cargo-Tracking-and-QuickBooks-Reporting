<?php

include('connection.php'); 

$start = $_POST['datepicker1'];
$end = $_POST['datepicker2'];

$startf = $start;
$endf = $end;

if($start == "All"){ 

	$odates = "";
	$adates = "";
	$bdates = "";

} 
	else {

			if($end == "All"){
	
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($start));
				$endf = $startf;
				
				$odates = "AND timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY";
				$adates = "WHERE timestamp >= '$start' AND timestamp < '$end' + INTERVAL 2 DAY";
				
			}
			else {
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($end));
				
				$odates = "AND timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY";
				$adates = "WHERE timestamp >= '$start' AND timestamp < '$end' + INTERVAL 2 DAY";
				
		}

	}

//echo "query: SELECT Name, barcode, timestamp FROM `barcodes` WHERE timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY GROUP BY Name";

//Below is original query
//$result = mysqli_query($link,"SELECT Name, barcode, timestamp FROM `barcodes` $dates ORDER BY Name, timestamp");

$query = "SELECT Min(ID), Timestamp, barcode FROM `barcodesoffice` WHERE barcode NOT IN (SELECT

barcode
    FROM `barcodespartside`
$adates

UNION

SELECT barcode
    FROM `barcodestireside`
$adates)
$odates
GROUP BY barcode ORDER BY Timestamp";
echo $query;
$result = mysqli_query($link,$query);


echo "<a href='search.php'>Back to Search</a>
<br><br>
<h3>Missed Warehouse Scans for " . $startf . " through " . $endf . "</h3>
<table border='1' cellpadding='5'>
<tr>
<th>Row</th>
<th>Date</th>
<th>Tracking Number</th>
</tr>"
;
$rn =1;
while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $rn . "</td>";
echo "<td>" . $row['Timestamp'] . "</td>";
echo "<td align='right'>" . $row['barcode'] . "</td>";
echo "</tr>";
$rn++;
}
echo "</table>";

mysqli_close($link);
?>