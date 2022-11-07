<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="resources/home/assets/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/login/css/main.css">
</head>
<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="mlogin" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-account"></i>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="email">
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="password" autoComplete="off">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					<div class="text-center p-t-50">
					</div>
					<div class="text-center p-t-50">
						<span class="txt1">
							forgot password?
						</span>
						&nbsp;
						<a class="txt2" href="javascript:;">
							Find Password
						</a>
						<br>
						<br>
						<span class="txt1">
							Don’t have an account?
						</span>
						&nbsp;
						<a class="txt2" href="mjoinf">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	<script src="resources/home/js/jquery-3.2.1.min.js"></script>
	<script src="resources/login/js/main.js"></script>

</body>
</html>