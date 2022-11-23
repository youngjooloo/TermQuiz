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
<link rel="stylesheet" href="resources/home/css/styles.css">
<link rel="stylesheet" href="resources/join/css/style.css">
<link rel="stylesheet" href="resources/changePW/css/changePW.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 mlcheck" id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand " href="home">Term Quiz on a Bus</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto my-2 my-lg-0">	
					<c:if test="${admin}">
	                	<li class="nav-item"><a class="nav-link" href="memberlist">Member</a></li>
	                    <li class="nav-item"><a class="nav-link" href="quizuploadf">QuizUpload</a></li>
                    </c:if>
                    	
                    <c:if test="${!admin }">
	                     <li class="nav-item"><a class="nav-link" href="ranking">Ranking</a></li>
                    </c:if>
				
					<li class="nav-item"><a class="nav-link" href="home#about">Quiz</a></li>
					<li class="nav-item"><a class="nav-link" href="boardlist">Board</a></li>
					<li class="nav-item"><a class="nav-link" href="qnaboardlist">QnA</a></li>
					<li class="nav-item"><a class="nav-link" href="mdetail">${nick}</a></li>
					<li class="nav-item"><a class="nav-link confirmBtn2" href="mlogout">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
<div class="main" id="changeMain">
    <div class="container">
        <form action="changepw" method="POST" class="appointment-form" id="appointment-form">
            <h2>Password Change</h2>
            
            <div class="form-group-1">
  				
  				<label for="password" class="label-agree-term">Current Password</label>          
  				<input type="password" class="joininput" name="password" id="password" placeholder="Password (현재 비밀번호)" required onclick="this.value='';" autoComplete="off" />

  				<label for="" class="label-agree-term">New Password</label>          
  				<input type="password" class="joininput" name="newPassword" id="newPassword" placeholder="Password (숫자, 영문자 포함, 8글자 이상, 20글자 이하)" required onclick="this.value='';" autoComplete="off" />
                <input type="password" class="joininput" id="newPassword2" placeholder="Password Check" required onclick="this.value='';" autoComplete="off" />
            </div>
            <div class="form-submit">
                <button type="submit" name="submit" id="submit" class="submit confirmBtn2">Modify</button>
                <button type="reset" id="reset" class="submit" onclick="history.back();">Back</button>
            </div>
        </form>
    </div>

</div>

	<!-- JS -->
	<script src="resources/join/vendor/jquery/jquery.min.js"></script>
	<script src="resources/join/js/main.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<c:if test="${not empty alertMessage}">
		<script type="text/javascript">
			$(document).ready(function(){
				 Swal.fire({
				     icon: 'success',
				     title: '알림',
				     text: '${alertMessage}',
				 });
			});
		</script>
	</c:if>
		<c:if test="${not empty alertMessage2}">
		<script type="text/javascript">
			$(document).ready(function(){
				 Swal.fire({
				     icon: 'error',
				     title: '알림',
				     text: '${alertMessage2}',
				 });
			});
		</script>
	</c:if>
	<script src="resources/common/js/confirm.js"></script>
</body>
</html>