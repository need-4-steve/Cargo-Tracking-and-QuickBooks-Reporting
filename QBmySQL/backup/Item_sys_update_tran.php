<?php


// get data from QuickBooks
set_time_limit(120);

// Connect to a System DSN "QuickBooks Data" with no user or password
$oConnect = odbc_connect("QuickBooks Data", "", "");

if (!$oConnect)
{
    exit("Connection Failed: " . $oConnect);
}

// Set the SQL Statement
$sSQL = "SELECT * from item WHERE TimeModified>= {ts '2018-08-01 00:00:00.000'}";

// Perform the query
$oResult = odbc_exec($oConnect, $sSQL);

if (!$oResult)
{
    exit("Error in SQL");
}

// SAVE DATA TO MYSQL
$rows = array();
$count = 0;

$sql = "";

    while ($myRow = odbc_fetch_array($oResult))
    {
        $count++;
        $keysValue = array();

        foreach ($myRow as $key => $value)
        {
            if ($key == "ListID")
            {

                $pare1 = $key;
                $pare1 .= "=" . "'$value'";
                //print $pare1;
                
            }
            else
            {
                $pare2 = $key;
                $pare2 .= "=" . "'$value'";
                array_push($keysValue, $pare2);

            }

        }

        $sql .= "UPDATE item SET " . implode(", ", $keysValue) . "  WHERE $pare1;";
       
    }

	$pdo = new PDO('mysql:host=localhost;dbname=qbodbc', 'root', '', array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_EMULATE_PREPARES => false
));
 $pdo->beginTransaction();
	try {
    // First of all, let's begin a transaction
       // A set of queries; if one fails, an exception should be thrown
     //Query 1: Attempt to insert the payment record into our database.
  
    $pdo->query($sql);


    // If we arrive here, it means that no exception was thrown
    // i.e. no query has failed, and we can commit the transaction
    $pdo->commit();
} catch (Exception $e) {
    // An exception has been thrown
    // We must rollback the transaction
    $pdo->rollback();
}
	

// Close the connection
odbc_close($oConnect);

?>
