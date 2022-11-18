<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quiz Upload</title>
<link rel="icon" type="image/x-icon"
	href="resources/home/assets/favicon.ico" />

<!-- Font Icon -->
<link rel="stylesheet"
	href="resources/join/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/home/css/styles.css">
<link rel="stylesheet" href="resources/join/css/style.css">
<link rel="stylesheet" href="resources/quiz/css/quizUpload.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 mlcheck" id="mainNav">
	    <div class="container px-4 px-lg-5">
	        <a class="navbar-brand " href="home">Term Quiz on a Bus</a>
	        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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

	<div class="main">
		<div class="container">
			<form action="quizupload" method="POST" enctype="multipart/form-data" class="appointment-form" id="appointment-form">
				<h2>Quiz Upload</h2>
				<div class="form-group-1">
					<select id="quizType" name="quizType" required>
				 		<option disabled selected value="">Quiz Type</option>
				 		<option value="movie">Movie</option>
				 		<option value="music">Music</option>					 		
				 		<option value="game">Game</option>
					 	<option value="book">Book</option>
					</select>
					
					<input name="answer" type="text" placeholder="Answer" required>
					
					<label for="hint1">Hint1</label>
					<input class="fileInput" name="hint1up" id="hint1" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
					
					<label for="hint2">Hint2</label>
					<input class="fileInput" name="hint2up" id="hint2" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
					
					<label for="hint3">Hint3</label>
					<input class="fileInput" name="hint3up" id="hint3" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
					
					<label for="hint4">Hint4</label>
					<input class="fileInput" name="hint4up" id="hint4" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
					
					<label for="hint5">Hint5</label>
					<input class="fileInput" name="hint5up" id="hint5" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
				</div>
				
				<div class="form-submit">
					<button type="submit" name="submit" id="submit" class="submit">Upload</button>
					<button type="reset" id="reset" class="submit"
						onclick="history.back();">Back</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- JS -->
	<script src="resources/join/vendor/jquery/jquery.min.js"></script>
	<script src="resources/join/js/main.js"></script>
	<script src="resources/quiz/js/quizUpload.js"></script>

</body>
</html>