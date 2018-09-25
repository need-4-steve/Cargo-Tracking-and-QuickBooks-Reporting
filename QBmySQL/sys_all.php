<?php
include ('connection.php');

// get data from QuickBooks
set_time_limit(120);

// Connect to a System DSN "QuickBooks Data" with no user or password
// $oConnect = odbc_connect("QuickBooks Data", "", "");
date_default_timezone_set('America/Chicago');
$date = date('Y/M/D h:i:s a', strtotime("-1 days"));
$timeStemp = time();
print $date;
print "SELECT * from item WHERE TimeModified >= {ts '" . date("Y-m-d",strtotime("-1 days")) . " 00:00:00.000'}";


$oConnect = odbc_connect("QuickBooks Data", "", "");

if (!$oConnect)
{
    exit("Connection Failed: " . $oConnect);
}
getData("item",$oConnect,$link);
getData("iteminventory",$oConnect,$link);
getData("ItemInventoryAssemblyLine",$oConnect,$link);
getData("creditmemoline",$oConnect,$link);
getData("salesreceiptline",$oConnect,$link);

function getData($tableName,$oConnect,$link)
{
    if ($tableName == "item")
    {
        $sSQL = "SELECT * from item WHERE TimeModified >= {ts '" . date("Y-m-d") . " 00:00:00.000'}";

    }
    else if ($tableName == "iteminventory")
    {
        $sSQL = "SELECT * from iteminventory WHERE TimeModified >= {ts '" . date("Y-m-d") . " 00:00:00.000'}";

    }
    else if ($tableName == "ItemInventoryAssemblyLine")
    {
        $sSQL = "SELECT * from ItemInventoryAssemblyLine WHERE TimeModified >= {ts '" . date("Y-m-d") . " 00:00:00.000'}";

    }
    else if ($tableName == "salesreceiptline")
    {
        $sSQL = "SELECT * from SalesReceiptLine WHERE TimeModified >= {ts '" . date("Y-m-d") . " 00:00:00.000'}";

    }
    else if ($tableName == "creditmemoline")
    {
        $sSQL = "SELECT * from creditmemoline WHERE TimeModified >= {ts '" . date("Y-m-d") . " 00:00:00.000'}";

    }

    $oResult = odbc_exec($oConnect, $sSQL);
    if (!$oResult)
    {
        exit("Error in SQL");
    }
    $rows = array();
    $count = 0;
    while ($myRow = odbc_fetch_array($oResult))
    {

        $rows[] = $myRow;
        $count++;
    }
    if ($count == 0)
    {
        print $tableName . "No data need update";
        return;

    }
    else
    {
        if ($tableName == "item")
        {
            save_item($rows,$link);
        }

        else if ($tableName == "iteminventory")
        {
            save_iteminventory($rows,$link);

        }
        else if ($tableName == "itemInventoryAssemblyLine")
        {
            save_itemInventoryAssemblyLine($rows,$link);

        }
        else if ($tableName == "salesreceiptline")
        {
            save_salesreceiptline($rows,$link);

        }
        else if ($tableName == "creditmemoline")
        {
            save_creditmemoline($rows,$link);

        }

    }

    odbc_free_result($oResult);
}

function save_item($rows,$link)
{
    foreach ($rows as $row)
    {
       
        $keys = array();
        $values = array();
        $getListId = '';
        $keysValue = array();
        foreach ($row as $key => $value)
        {
            if ($key == "ListID")
            {

                $getListId = "$value";
                $pare1 = $key;
                $pare1 .= "=" . "'$value'";
            }
            if ($key == "Description" || $key == "SalesDesc" || $key == "PurchaseDesc")
            {

                $value = str_replace("'", "\'", $value);
            }
            array_push($keys, $key);
            array_push($values, addslashes($value));
            $pare2 = $key;
            $pare2 .= "=" . "'$value'";
            array_push($keysValue, $pare2);
        }

        $result = mysqli_query($link, "SELECT * FROM Item WHERE ListID ='$getListId' ");

        if (mysqli_num_rows($result) > 0)
        {
            $resUpdate = mysqli_query($link, "UPDATE item SET " . implode(", ", $keysValue) . "  WHERE $pare1;"); // update one row into new table
            if ($resUpdate)
            {
               
                print "item Update :Success<br>";

            }
            else
            {
                print ("item---UPDATE item SET " . implode(", ", $keysValue) . "  WHERE $pare1;<br>");

            }
        }
        else
        {
            $resInsert = mysqli_query($link, "INSERT INTO itemtest (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>"); // insert one row into new table
            if ($resInsert)
            {
                
                print "item--Insert :Success<br>";

            }
            else
            {
                print ("item--INSERT INTO itemtest (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>");

            }
        }

    }
}

function save_iteminventory($rows,$link)
{

    foreach ($rows as $row)
    {
       
        $keys = array();
        $values = array();
        $getListId = '';
        $keysValue = array();
        foreach ($row as $key => $value)
        {
            if ($key == "ListID")
            {

                $getListId = "$value";
                $pare1 = $key;
                $pare1 .= "=" . "'$value'";
            }
            if ($key == "Description" || $key == "SalesDesc" || $key == "PurchaseDesc")
            {

                $value = str_replace("'", "\'", $value);
            }
            array_push($keys, $key);
            array_push($values, addslashes($value));

            $pare2 = $key;
            $pare2 .= "=" . "'$value'";
            array_push($keysValue, $pare2);
        }

        $result = mysqli_query($link, "SELECT * FROM iteminventory WHERE ListID ='$getListId' ");

        if (mysqli_num_rows($result) > 0)
        {
            $resUpdate = mysqli_query($link, "UPDATE iteminventory SET " . implode(", ", $keysValue) . "  WHERE $pare1;"); // update one row into new table
            if ($resUpdate)
            {
               
                print "iteminventory--Update :Success<br>";

            }
            else
            {
                print ("iteminventory--UPDATE iteminventory SET " . implode(", ", $keysValue) . "  WHERE $pare1;<br><br>");

            }
        }
        else
        {
            $resInsert = mysqli_query($link, "INSERT INTO iteminventory (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>"); // insert one row into new table
            if ($resInsert)
            {
               
                print "iteminventory--Insert :Success<br>";

            }
            else
            {
                print ("iteminventory--INSERT INTO iteminventory (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>");

            }
        }

    }
}
function save_ItemInventoryAssemblyLine($rows,$link)
{

    foreach ($rows as $row)
    {
        $count++;
        $keys = array();
        $values = array();
        $getListId = '';
        $keysValue = array();
        foreach ($row as $key => $value)
        {
            if ($key == "FQPrimaryKey")
            {

                $getListId = "$value";
                $pare1 = $key;
                $pare1 .= "=" . "'$value'";
            }

            array_push($keys, $key);
            array_push($values, addslashes($value));

            $pare2 = $key;
            $pare2 .= "=" . "'$value'";
            array_push($keysValue, $pare2);
        }

        $result = mysqli_query($link, "SELECT * FROM ItemInventoryAssemblyLine WHERE FQPrimaryKey ='$getListId' ");

        if (mysqli_num_rows($result) > 0)
        {
            $resUpdate = mysqli_query($link, "UPDATE ItemInventoryAssemblyLine SET " . implode(", ", $keysValue) . "  WHERE $pare1;"); // update one row into new table
            if ($resUpdate)
            {
               
                print "ItemInventoryAssemblyLine--Update :Success<br>";

            }
            else
            {
                print ("ItemInventoryAssemblyLine--UPDATE ItemInventoryAssemblyLine SET " . implode(", ", $keysValue) . "  WHERE $pare1;<br>");

            }
        }
        else
        {
            $resInsert = mysqli_query($link, "INSERT INTO ItemInventoryAssemblyLine (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')"); // insert one row into new table
            if ($resInsert)
            {
                
                print "ItemInventoryAssemblyLine--Insert :Success<br>";

            }
            else
            {
                print ("ItemInventoryAssemblyLine--INSERT INTO ItemInventoryAssemblyLine (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>");

            }
        }

    }

}
function save_salesreceiptline($rows,$link)
{

    foreach ($rows as $row)
    {
        
        $keys = array();
        $values = array();
        $getListId = '';
        $keysValue = array();
        foreach ($row as $key => $value)
        {
            if ($key == "TxnID" || $key == "TimeCreated" || $key == "TimeModified" || $key == "ShipDate" || $key == "CustomerRefListID" || $key == "CustomerRefFullName" || $key == "SalesReceiptLineItemRefListID" || $key == "SalesReceiptLineItemRefFullName" || $key == "SalesReceiptLineDesc" || $key == "SalesReceiptLineQuantity" || $key == "SalesReceiptLineRate" || $key == "SalesReceiptLineAmount" || $key == "FQPrimaryKey")
            {
                array_push($keys, $key);
                array_push($values, addslashes($value));
                if ($key == "FQPrimaryKey")
                {
                    $getListId = "$value";
                    $pare1 = $key;
                    $pare1 .= "=" . "'$value'";
                }
                if ($key == "SalesReceiptLineDesc")
                {

                    $value = str_replace("'", "\'", $value);
                    $value = addslashes($value);
                }
                $pare2 = $key;
                $pare2 .= "=" . "'$value'";
                array_push($keysValue, $pare2);
            }
        }

        $result = mysqli_query($link, "SELECT * FROM sales WHERE FQPrimaryKey ='$getListId' ");
        if (mysqli_num_rows($result) > 0)
        {
            $resUpdate = mysqli_query($link, "UPDATE sales SET " . implode(", ", $keysValue) . "  WHERE $pare1;"); // update one row into new table
            if ($resUpdate)
            {
                
                print "salesreceiptline--Update2 :Success<br>";
            }
            else
            {
                print ("salesreceiptline--UPDATE sales SET " . implode(", ", $keysValue) . "  WHERE $pare1;<br>");
            }
        }
        else
        {
            $resInsert = mysqli_query($link, "INSERT INTO sales (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')"); // insert one row into new table
            if ($resInsert)
            {
               
                print "salesreceiptline--Insert2 :Success";
            }
            else
            {
                print ("salesreceiptline--INSERT INTO sales (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>");
            }
        }
    }

}

function save_creditmemoline($rows,$link)
{
    $rowArr = getData("creditmemoline");
    foreach ($rows as $row)
    {
        $count++;
        $keys = array();
        $values = array();
        $getListId = '';
        $keysValue = array();
        foreach ($row as $key => $value)
        {
            if ($key == "FQPrimaryKey")
            {

                $getListId = "$value";
                $pare1 = $key;
                $pare1 .= "=" . "'$value'";
            }

            array_push($keys, $key);
            array_push($values, addslashes($value));

            $pare2 = $key;
            $pare2 .= "=" . "'$value'";
            array_push($keysValue, $pare2);
        }

        $result = mysqli_query($link, "SELECT * FROM creditmemoline WHERE FQPrimaryKey ='$getListId' ");

        if (mysqli_num_rows($result) > 0)
        {
            $resUpdate = mysqli_query($link, "UPDATE creditmemoline SET " . implode(", ", $keysValue) . "  WHERE $pare1;"); // update one row into new table
            if ($resUpdate)
            {
                
                print "creditmemoline--Update :Success<br>";

            }
            else
            {
                print ("creditmemoline--UPDATE creditmemoline SET " . implode(", ", $keysValue) . "  WHERE $pare1;<br>");

            }
        }
        else
        {
            $resInsert = mysqli_query($link, "INSERT INTO creditmemoline (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')"); // insert one row into new table
            if ($resInsert)
            {
                
                echo "creditmemoline--Insert :Success";

            }
            else
            {
                print ("creditmemoline--INSERT INTO creditmemoline (" . implode(", ", $keys) . ") VALUES ('" . implode("', '", $values) . "')<br>");

            }
        }

    }

}

// Close the connection
odbc_close($oConnect);
mysqli_close($link);
?>
