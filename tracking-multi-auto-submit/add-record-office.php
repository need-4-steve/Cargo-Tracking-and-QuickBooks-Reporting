<!DOCTYPE html>
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<meta charset="UTF-8">
<title>Submit form without page refresh using jQuery ajax - click4knowledge.com</title>
<style>
body {
	background-size: cover;
	font-family: Montserrat;
}
.logo {
	width: 213px;
	height: 36px;
	margin: 30px auto;
}
.login-block {
	width: 320px;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	border-top: 5px solid #ff656c;
	margin: 0 auto;
}
.login-block h1 {
	text-align: center;
	color: #000;
	font-size: 18px;
	text-transform: uppercase;
	margin-top: 0;
	margin-bottom: 20px;
}
.login-block input {
	width: 100%;
	height: 42px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
	font-size: 14px;
	font-family: Montserrat;
	padding: 0 20px 0 50px;
	outline: none;
}
.login-block input#username {
	background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
	background-size: 16px 80px;
}
.login-block input#username:focus {
	background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
	background-size: 16px 80px;
}
.login-block input#password {
	background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
	background-size: 16px 80px;
}
.login-block input#password:focus {
	background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
	background-size: 16px 80px;
}
.login-block input:active, .login-block input:focus {
	border: 1px solid #ff656c;
}
.login-block button {
	height: 40px;
	background: #ff656c;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #e15960;
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 14px;
	font-family: Montserrat;
	outline: none;
	cursor: pointer;
}
.login-block button:hover {
	background: #ff7b81;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="submit-office.js"></script>
</head>
<body>
<div class="logo"></div>
<div class="login-block">
  <h1>Add Barcodes - Office</h1>
  <form method="post" action="" name="loginform" id="loginform">
    <!--<input type="text" placeholder="Username" id="username" name="username" />
    <input type="password" placeholder="Password" id="password" name="password" /> -->
	
	
	
		    	<label for="barcode">Barcode:</label>
        <input type="text" name="barcode" id="barcode" autofocus="true"  >
    <!--<button type="button" onClick="submitdata();">Submit</button>-->
	<button type="button" onclick="submitdata();">Submit</button>
    <!-- <button id="reset" type="reset">Reset</button> -->
	
	<script>
            document.body.onkeydown = function(e) {
                if (e.keyCode == 13)
                submitdata();
            };
        </script>
	
	
	
  </form>
</div>
</body>
</html>