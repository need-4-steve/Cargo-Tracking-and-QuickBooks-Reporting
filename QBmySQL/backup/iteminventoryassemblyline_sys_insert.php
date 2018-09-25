<?php
include ('connection.php');

// get data from QuickBooks

set_time_limit(120);

// Connect to a System DSN "QuickBooks Data" with no user or password

$oConnect = odbc_connect("QuickBooks Data", "", "");

if (!$oConnect)
	{
	exit("Connection Failed: " . $oConnect);
	}

// Set the SQL Statement

$sSQL = "SELECT * from iteminventoryassemblyline WHERE TimeCreated> {ts '2018-07-01 00:00:00.000'}";

// Perform the query

$oResult = odbc_exec($oConnect, $sSQL);

if (!$oResult)
	{
	exit("Error in SQL");
	}

// SAVE DATA TO MYSQL

$rows = array();
$count = 0;

// $sql = "INSERT INTO MyGuests (firstname, lastname, email) VALUES ('John', 'Doe', 'john@example.com');";

$sql = "";

while ($myRow = odbc_fetch_array($oResult))
	{
	$count++;
	$keys = array();
	$values = array();
	foreach($myRow as $key => $value)
		{
		
			array_push($keys, $key);
		
			array_push($values, addslashes($value));
		}

	$sql.= "INSERT INTO iteminventoryassemblyline (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "');";
	}

if($count>0)
	{
			if (mysqli_multi_query($link, $sql))
			{
			echo "New records created successfully";
			}
		  else
			{
			echo "Error: " . $sql . "<br />" . mysqli_error($link);
			}
		
		
	}
	else{
		
		echo "No data need update";
	}
// Close the connection
odbc_close($oConnect);
mysqli_close($link);
?>
