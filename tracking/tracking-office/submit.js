// JavaScript Document
function submitdata() {
	var username  = document.getElementById("barcode").value;
	// password = document.getElementById("password").value;
	// Returns successful data submission message when the entered information is stored in database.
	//var dataString = 'username=' + username + '&password=' + password;
	var dataString = 'username=' + username;
		if (username == '') {
		alert("Please Fill All Fields");
		} 
		else {
					// AJAX code to submit form.
					$.ajax({
					type: "POST",
					url: "submit.php",
					data: dataString,
					cache: false,
					success: function(html) {
					document.getElementById("loginform").reset();
					}
					});
				}
		return false;
}
