<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ranking</title>

<link rel="icon" type="image/x-icon"
	href="resources/home/assets/favicon.ico" />

<!-- Font Icon -->
<link rel="stylesheet"
	href="resources/join/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/home/css/styles.css">
<link rel="stylesheet" href="resources/home/css/main.css">
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
					<c:if test="${empty loginID}">
	    	            <li class="nav-item"><a class="nav-link" href="javascript:;" id="loginB">LogIn</a></li>
	                </c:if>
	        
	                <c:if test="${not empty loginID}">
		                <li class="nav-item"><a class="nav-link" href="mdetail">${nick}</a></li>
		                <li class="nav-item"><a class="nav-link" href="mlogout">Log Out</a></li>
                   	</c:if>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="main" id="changeMain">
	    <div class="container">
	    </div>
	</div>
	
	
	<div id="mainlogin" class="mlhidden mlcheck"></div>
	<div id="mainlogin2" class="mlhidden"></div>
	
	<!-- JS -->
	<script src="resources/join/vendor/jquery/jquery.min.js"></script>
	<script src="resources/home/js/main.js"></script>
	<script src="resources/join/js/main.js"></script>
</body>
</html>