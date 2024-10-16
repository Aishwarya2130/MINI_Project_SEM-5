<title>Forgot Password</title>
<%@page import="java.sql.*"%>
<%@page import="exam.dbconnect"%>
<jsp:useBean id="s" class="exam.dbconnect"/>
<jsp:getProperty name="s" property="conn"/>
<%
String un=request.getParameter("uname");
String sa=request.getParameter("sa");
ResultSet rs=s.stm.executeQuery("select * from login where username='"+un+"' and s_answer='"+sa+"'");
if(!rs.next())
{
out.println("<script>alert('Invalid OR Wrong Answer ');history.back();</script>");
}
else
{
%>
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
				<form action="restpass.jsp" class="login100-form validate-form">
					<span class="login100-form-logo">
						<!-- <i class="zmdi zmdi-landscape"></i> --><img style="border-radius:50%" src="lgn_tmp/images/logo.png" width="90%"/>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Reset Password
					</span>
<form name="form1" method="post" action="restpass.jsp">
<input type="hidden" value="<%=un%>" name="uname">
  
   <div class="wrap-input100 validate-input" data-validate = "Enter New Password">
						<input class="input100" type="password" name="np" placeholder="New Password">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
	<div class="wrap-input100 validate-input" data-validate = "Enter Confirm Password">
						<input class="input100" type="password" name="cp" placeholder="Confrim Password">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					
	 <div class="container-login100-form-btn">
						<button class="login100-form-btn" name="Submit">
							Submit
						</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" href="index.jsp">
							Back to Login
						</a>
					</div>
</form>
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
<%
}
%>
