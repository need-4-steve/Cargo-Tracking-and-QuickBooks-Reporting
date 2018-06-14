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

	$adates = "";
	$bdates = "";

} 
	else {

			if($end == "All"){
	
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($start));
								
				$adates = "a.timestamp >= '$start' AND a.timestamp < '$end' + INTERVAL 1 DAY AND";
				$bdates = "b.timestamp >= '$start' AND b.timestamp < '$end' + INTERVAL 1 DAY AND";
			}
			else {
				$start = date('Y-m-d H:i:s', strtotime($start));
				$end = date('Y-m-d H:i:s', strtotime($end));

				$adates = "a.timestamp >= '$start' AND a.timestamp < '$end' + INTERVAL 1 DAY AND";
				$bdates = "b.timestamp >= '$start' AND b.timestamp < '$end' + INTERVAL 1 DAY AND";

		}

	}





//Original query below
//$result = mysqli_query($link,"SELECT Name, barcode, timestamp FROM `barcodes` WHERE $dates Name LIKE '$emp' ORDER BY timestamp");

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
WHERE $adates Name LIKE '$emp'

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
WHERE $bdates Name LIKE '$emp'
ORDER BY  timestamp";


$result = mysqli_query($link,$query);
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
echo "<td>" . $row['Timestamp'] . "</td>";
echo "<td>" . $row['Name'] . "</td>";
echo "<td align='right'>" . $row['barcode'] . "</td>";
echo "</tr>";
$rn++;
}
echo "</table>";
}
mysqli_close($link);
?>