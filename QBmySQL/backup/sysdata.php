<?php
include('connection.php'); 


//get data from QuickBooks

set_time_limit(120);

#Connect to a System DSN "QuickBooks Data" with no user or password
$oConnect = odbc_connect("QuickBooks Data", "", "");
if (!$oConnect)
  {exit("Connection Failed: " . $oConnect);}
#Set the SQL Statement
$sSQL = "SELECT * FROM item";
#Perform the query
$oResult = odbc_exec($oConnect, $sSQL);
if (!$oResult)
  {exit("Error in SQL");}

//SAVE DATA TO MYSQL
$rows = array();
$count=0;
while ($myRow  = odbc_fetch_array($oResult) ) {	

	$rows[] = $myRow;
	
}

foreach($rows as $row) {
	$count++;
	$keys = array();
	$values=array();
   foreach($row as $key => $value) {
       array_push($keys, $key);
       array_push($values, addslashes($value));
   }
  
   print("<br>$count<br>");
   
   print("<br>-----------------------------<br>");
   $res=mysqli_query($link,"INSERT INTO itemtest (".implode(", ",$keys).") VALUES ('".implode("', '",$values)."')"); // insert one row into new table
   if($res)
	{
	echo "Success";

	}
	else
	{
	print("INSERT INTO itemtest (".implode(", ",$keys).") VALUES ('".implode("', '",$values)."')");

	}
}


#Close the connection
odbc_close($oConnect);
mysqli_close($link);


?>