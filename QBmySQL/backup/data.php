<?php
include('connection.php'); 
$result = mysqli_query($link,"SELECT * FROM item");
while($row = mysqli_fetch_array($result)) {
echo $row['ListID'];
}


?>