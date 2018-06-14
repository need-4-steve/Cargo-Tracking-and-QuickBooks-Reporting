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

<h2>View Scans by Employee</h2>

<form action="employee-detail.php" method="post">
  	<input type="text" class="datepicker" name="datepicker3" value="Date"/>
	<input type="text" class="datepicker" name="datepicker4" value="Date"/>
  <select class="form-dropdown" style="width:150px" id="employee" name="employee">

  <?php include('connection.php'); 
 $filter = mysqli_query($link, "SELECT DISTINCT Name FROM barcodes");
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

</body>
</html>