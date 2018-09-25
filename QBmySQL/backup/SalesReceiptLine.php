<?php
include('connection.php'); 
ini_set('memory_limit', '128M');

//get data from QuickBooks

set_time_limit(240);
//$sSQL = $_POST['sqlString'];
#Connect to a System DSN "QuickBooks Data" with no user or password
$oConnect = odbc_connect("QuickBooks Data", "", "");
if (!$oConnect)
  {exit("Connection Failed: " . $oConnect);}
#Set the SQL Statement

// 2014
//$sSQL = "SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2014-09-01 00:00:00.000'} and TimeCreated<= {ts '2015-01-01 00:00:00.000'}  ";


//--------2015--------------

//$sSQL = "SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2015-01-01 00:00:00.000'} and TimeCreated<= {ts '2015-05-01 00:00:00.000'}   ";
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2015-05-01 00:00:00.000'} and TimeCreated<= {ts '2015-08-01 00:00:00.000'} ";

//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2015-08-01 00:00:00.000'} and TimeCreated<= {ts '2015-10-01 00:00:00.000'} ";

//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2015-10-01 00:00:00.000'} and TimeCreated<= {ts '2016-01-01 00:00:00.000'} ";


//--------2016--------------
//5709
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2016-01-01 00:00:00.000'} and TimeCreated<= {ts '2016-04-01 00:00:00.000'} ";
//7749-7749
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2016-04-01 00:00:00.000'} and TimeCreated<= {ts '2016-07-01 00:00:00.000'} ";
//8033-8033
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2016-07-01 00:00:00.000'} and TimeCreated<= {ts '2016-10-01 00:00:00.000'} ";
//7591
$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2016-10-01 00:00:00.000'} and TimeCreated<= {ts '2017-01-01 00:00:00.000'} ";


//--------2017--------------
//5334
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-01-01 00:00:00.000'} and TimeCreated<= {ts '2017-03-01 00:00:00.000'} ";
//7156
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-03-01 00:00:00.000'} and TimeCreated<= {ts '2017-05-01 00:00:00.000'} ";
//8093
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-05-01 00:00:00.000'} and TimeCreated<= {ts '2017-07-01 00:00:00.000'} ";
//7974
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-07-01 00:00:00.000'} and TimeCreated<= {ts '2017-09-01 00:00:00.000'} ";
//5131
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-09-01 00:00:00.000'} and TimeCreated<= {ts '2017-10-01 00:00:00.000'} ";
//4487
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-10-01 00:00:00.000'} and TimeCreated<= {ts '2017-11-01 00:00:00.000'} ";
//3995
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-11-01 00:00:00.000'} and TimeCreated<= {ts '2017-12-01 00:00:00.000'} ";
//3631
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2017-12-01 00:00:00.000'} and TimeCreated<= {ts '2018-01-01 00:00:00.000'} ";

//--------2018 01-07--------------
//3912
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-01-01 00:00:00.000'} and TimeCreated<= {ts '2018-02-01 00:00:00.000'} ";
//4733
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-02-01 00:00:00.000'} and TimeCreated<= {ts '2018-03-01 00:00:00.000'} ";
//6609
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-03-01 00:00:00.000'} and TimeCreated<= {ts '2018-04-01 00:00:00.000'} ";
//6213
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-04-01 00:00:00.000'} and TimeCreated<= {ts '2018-05-01 00:00:00.000'} ";
//6651
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-05-01 00:00:00.000'} and TimeCreated<= {ts '2018-06-01 00:00:00.000'} ";
//6567
//$sSQL ="SELECT * from SalesReceiptLine WHERE TimeCreated> {ts '2018-06-01 00:00:00.000'} and TimeCreated<= {ts '2018-07-01 00:00:00.000'} ";



#Perform the query
$oResult = odbc_exec($oConnect, $sSQL);
if (!$oResult)
  {exit("Error in SQL");}


$rows = array();
$count=0;
while ($myRow  = odbc_fetch_array($oResult) ) {	

	$rows[] = $myRow;
	
}
#Close the connection
odbc_close($oConnect);
/*
//truncate mysql Data table
$TRUNCATE_Result = mysqli_query($link, "TRUNCATE TABLE SalesReceiptLine"); // insert one row into new table
if ($TRUNCATE_Result) {
    echo "Success";
    
} else { {
        exit("TRUNCATE_Result Failed: " . $link);
    }
    
}
*/

//SAVE DATA TO MYSQL

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
   $res=mysqli_query($link,"INSERT INTO SalesReceiptLine_2016 (".implode(", ",$keys).") VALUES ('".implode("', '",$values)."')"); // insert one row into new table
   if($res)
	{
	echo "Success";

	}
	else
	{
	print("INSERT INTO SalesReceiptLine (".implode(", ",$keys).") VALUES ('".implode("', '",$values)."')");

	}
}

 print "Done";

mysqli_close($link);


?>