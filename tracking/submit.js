// JavaScript Document
function submitdata() {
	var barcode  = document.getElementById("barcode").value;
	// password = document.getElementById("password").value;
	// Returns successful data submission message when the entered information is stored in database.
	//var dataString = 'username=' + username + '&password=' + password;
	var dataString = 'barcode=' + barcode;
		if (barcode == '') {
		
		} 
		else {
					// AJAX code to submit form.
					$.ajax({
					type: "POST",
					url: "http://192.168.1.5:8080/tracking/insert-multiple.php",
					data: dataString,
					cache: false,
					success: function(html) {
					document.getElementById("loginform").reset();
					
					}
					});
				}
				document.getElementById("barcode").focus();
		return false;
}
/* 
function submitdataoffice() {
	var barcode  = document.getElementById("barcode").value;
	// password = document.getElementById("password").value;
	// Returns successful data submission message when the entered information is stored in database.
	//var dataString = 'username=' + username + '&password=' + password;
	var dataString = 'barcode=' + barcode;
		if (barcode == '') {
		alert("Please Fill All Fields");
		} 
		else {
					// AJAX code to submit form.
					$.ajax({
					type: "POST",
					url: "http://192.168.1.5:8080/tracking/insert-office.php",
					data: dataString,
					cache: false,
					success: function(html) {
					document.getElementById("loginform").reset();
					
					}
					});
				}
				document.getElementById("barcode").focus();
		return false;
}

 */