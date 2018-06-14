<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Tracking Number Reports</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".datepicker" ).datepicker();
  } );
  </script>
 
</head>
<body>


 <h2>View Scan Totals by Employee</h2>
<form action="data.php" method="post"> 
	<input type="text" class="datepicker" name="datepicker1" value="All"/>
	<input type="text" class="datepicker" name="datepicker2" value="All"/>
<input type="submit" value="Search">
</form>


 <h2>View Scan Details By Date</h2>
<form action="data-detail.php" method="post"> 
	<input type="text" class="datepicker" name="datepicker1" value="All"/>
	<input type="text" class="datepicker" name="datepicker2" value="All"/>
<input type="submit" value="Search">
</form>


<h2>View Scan Details by Employee</h2>

<form action="employee-detail.php" method="post">
  	<input type="text" class="datepicker" name="datepicker3" value="All"/>
	<input type="text" class="datepicker" name="datepicker4" value="All"/>
  <select class="form-dropdown" style="width:150px" id="employee" name="employee">

  <?php include('connection.php'); 
 $filter = mysqli_query($link, "SELECT DISTINCT Name FROM `barcodespartside` UNION SELECT DISTINCT Name FROM `barcodestireside`");
 $menu="<option>Select Employee</option>";

// Add options to the drop down
while($row = mysqli_fetch_array($filter))

{
  $menu .="<option value=\"" . $row['Name'] . "\">" . $row['Name'] . "</option>";
}

// Close menu form
$menu .= "</select>";
 echo $menu;
?>

<br>
<input type="submit" value="Search">
</form>


 <h2>Search by Tracking Number</h2>
<form action="tracking.php" method="post"> 
	<input type="text" name="tracking"/>
	<input type="submit" value="Search">
</form>

 <h2>View Missing Scan Details By Date</h2>
<form action="data-detail-missing-numbers.php" method="post"> 
	<input type="text" class="datepicker" name="datepicker1" value="All"/>
	<input type="text" class="datepicker" name="datepicker2" value="All"/>
<input type="submit" value="Search">
</form>
</body>
</html>