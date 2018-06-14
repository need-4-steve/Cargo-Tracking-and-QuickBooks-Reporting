<?php

include('connection.php'); 

$start = $_POST['datepicker1'];
$end = $_POST['datepicker2'];

$startf = $start;
$endf = $end;

if($start == "All"){ 

	$adates = "";
	$bdates = "";

} 
	else {

			if($end == "All"){
	
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($start));
				$endf = $startf;
				$adates = "WHERE a.timestamp >= '$start' AND a.timestamp < '$end' + INTERVAL 1 DAY";
				$bdates = "WHERE b.timestamp >= '$start' AND b.timestamp < '$end' + INTERVAL 1 DAY";
			}
			else {
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($end));

				$adates = "WHERE a.timestamp >= '$start' AND a.timestamp < '$end' + INTERVAL 1 DAY";
				$bdates = "WHERE b.timestamp >= '$start' AND b.timestamp < '$end' + INTERVAL 1 DAY";
		}

	}

//echo "query: SELECT Name, barcode, timestamp FROM `barcodes` WHERE timestamp >= '$start' AND timestamp < '$end' + INTERVAL 1 DAY GROUP BY Name";

//Below is original query
//$result = mysqli_query($link,"SELECT Name, barcode, timestamp FROM `barcodes` $dates ORDER BY Name, timestamp");

$query = "SELECT
  a.Name
, a.barcode
, a.timestamp
FROM 
(
    SELECT
      *
    FROM `barcodespartside`
    WHERE ID IN 
    (
        SELECT
          min(ID)
        FROM `barcodespartside`
        WHERE barcode NOT LIKE ''
        GROUP BY barcode
    )
)
a
$adates

UNION

SELECT
  b.Name
, b.barcode
, b.timestamp
FROM 
(
    SELECT
      *
    FROM `barcodestireside`
    WHERE ID IN 
    (
        SELECT
          min(ID)
        FROM `barcodestireside`
        WHERE barcode NOT LIKE ''
        GROUP BY barcode
    )
)
b
$bdates
ORDER BY Name , timestamp";
//echo $query;
$result = mysqli_query($link,$query);


echo "<a href='search.php'>Back to Search</a>
<br><br>
<h3>Scan Data for " . $startf . " through " . $endf . "</h3>
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
echo "<td>" . $row['Timestamp'] . "</td>";
echo "<td>" . $row['Name'] . "</td>";
echo "<td align='right'>" . $row['barcode'] . "</td>";
echo "</tr>";
$rn++;
}
echo "</table>";

mysqli_close($link);
?>