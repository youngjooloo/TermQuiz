<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Change Password</title>

<link rel="icon" type="image/x-icon"
	href="resources/home/assets/favicon.ico" />

<!-- Font Icon -->
<link rel="stylesheet"
	href="resources/join/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/join/css/style.css">
<link rel="stylesheet" href="resources/changePW/css/changePW.css">
</head>
<body>

	<nav>
		<a id="navHome" href="home#page-top">Term Quiz on a Bus</a>
		<div id="navbarResponsive">
			<a class="nav-link" href="home#about">Quiz</a> 
			<a class="nav-link"	href="boardlist">Board</a> 
			<a class="nav-link" href="qnaboardlist">QnA</a>
			<a class="nav-link" href="mdetail">${nick}</a>
	        <a class="nav-link" href="mlogout">Log Out</a>
		</div>
	</nav>
<div class="main" id="changeMain">
    <div class="container">
        <form action="mdetailup" method="POST" class="appointment-form" id="appointment-form">
            <h2>Password Change</h2>
            
            <div class="form-group-1">
  				
  				<label for="password" class="label-agree-term">Current Password</label>          
  				<input type="password" class="joininput" name="password" id="password" placeholder="Password (현재 비밀번호)" required onclick="this.value='';" autoComplete="off" />

  				<label for="" class="label-agree-term">New Password</label>          
  				<input type="password" class="joininput" name="newPassword" id="newPassword" placeholder="Password (숫자, 영문자 포함, 8글자 이상, 20글자 이하)" required onclick="this.value='';" autoComplete="off" />
                <input type="password" class="joininput" id="newPassword2" placeholder="Password Check" required onclick="this.value='';" autoComplete="off" />
            </div>
            <div class="form-submit">
                <button type="submit" name="submit" id="submit" class="submit">Modify</button>
                <button type="reset" id="reset" class="submit" onclick="history.back();">Back</button>
            </div>
        </form>
    </div>

</div>

	<!-- JS -->
	<script src="resources/join/vendor/jquery/jquery.min.js"></script>
	<script src="resources/join/js/main.js"></script>
</body>
</html>