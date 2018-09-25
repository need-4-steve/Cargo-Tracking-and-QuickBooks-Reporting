<?php
include ('connection.php');

// get data from QuickBooks

set_time_limit(60);

// Connect to a System DSN "QuickBooks Data" with no user or password
// $oConnect = odbc_connect("QuickBooks Data", "", "");


// Set the SQL Statement

$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-02-01 00:00:00.000'} and TimeCreated<= {ts '2018-02-28 00:00:00.000'} ";

// Perform the query

$oResult = odbc_exec($oConnect, $sSQL);

if (!$oResult)
	{
	exit("Error in SQL");
	}

// SAVE DATA TO MYSQL

$rows = array();
$count = 0;

while ($myRow = odbc_fetch_array($oResult))
	{
	$rows[] = $myRow;
	}

// Close the connection
odbc_free_result($oResult);
//odbc_close($oConnect);

// SAVE DATA TO MYSQL

foreach($rows as $row)
	{
	$count++;
	$keys = array();
	$values = array();
	$getListId = '';
	$keysValue = array();
	foreach($row as $key => $value)
		{
		if ($key == "TxnID" || $key == "TimeCreated" || $key == "TimeModified" || $key == "ShipDate" || $key == "CustomerRefListID" || $key == "CustomerRefFullName" || $key == "SalesReceiptLineItemRefListID" || $key == "SalesReceiptLineItemRefFullName" || $key == "SalesReceiptLineDesc" || $key == "SalesReceiptLineQuantity" || $key == "SalesReceiptLineRate" || $key == "SalesReceiptLineAmount" || $key == "FQPrimaryKey")
			{
			array_push($keys, $key);
			array_push($values, addslashes($value));
			if ($key == "FQPrimaryKey")
				{
				$getListId = "$value";
				$pare1 = $key;
				$pare1.= "=" . "'$value'";
				}

			$pare2 = $key;
			$pare2.= "=" . "'$value'";
			array_push($keysValue, $pare2);
			}
		}

	$result = mysqli_query($link, "SELECT * FROM sales WHERE FQPrimaryKey ='$getListId' ");
	if (mysqli_num_rows($result) > 0)
		{
		$resUpdate = mysqli_query($link, "UPDATE sales SET " . implode(", ", $keysValue) . "  WHERE $pare1;"); // update one row into new table
		if ($resUpdate)
			{
			print ("<br />$count<br />");
			echo "Update :Success";
			}
		  else
			{
			print ("UPDATE sales SET " . implode(", ", $keysValue) . "  WHERE $pare1;");
			}
		}
	  else
		{
		$resInsert = mysqli_query($link, "INSERT INTO sales (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')"); // insert one row into new table
		if ($resInsert)
			{
			print ("<br />$count<br />");
			echo "Insert :Success";
			}
		  else
			{
			print ("INSERT INTO sales (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')");
			}
		}
	}

print "Done";

// Close the connection

mysqli_close($link);
?>