<!DOCTYPE html>
<html lang="en">
<head>
	<title>SSPFE Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="lgn_tmp/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="lgn_tmp/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="lgn_tmp/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="lgn_tmp/css/util.css">
	<link rel="stylesheet" type="text/css" href="lgn_tmp/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('lgn_tmp/images/bg1.jpg');">
			<div class="wrap-login100">
				<form action="logchk.jsp" method="post" class="login100-form validate-form">
					<span class="login100-form-logo">
						<!-- <i class="zmdi zmdi-landscape"></i> --><img style="border-radius:50%" src="lgn_tmp/images/logo.png" width="90%"/>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Secured Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" autocomplete="off" type="text" name="uname" placeholder="Username">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" name="Submit">
							Login
						</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" href="fpass1.jsp">
							Forgot Password?
						</a> | 
						<a class="txt1" href="stud_regf.jsp">
							Sign Up
						</a>
					</div>
			  </form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="lgn_tmp/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="lgn_tmp/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="lgn_tmp/vendor/bootstrap/js/popper.js"></script>
	<script src="lgn_tmp/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="lgn_tmp/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="lgn_tmp/vendor/daterangepicker/moment.min.js"></script>
	<script src="lgn_tmp/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="lgn_tmp/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="lgn_tmp/js/main.js"></script>

</body>
</html>