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
<link rel="stylesheet" href="resources/home/css/main.css">
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
					<li class="nav-item"><a class="nav-link" href="memberlist">Member</a></li>
	                <li class="nav-item"><a class="nav-link" href="quizuploadf">QuizUpload</a></li>
	                <li class="nav-item"><a class="nav-link" href="home#about">Quiz</a></li>
	                <li class="nav-item"><a class="nav-link" href="boardlist">Board</a></li>
	                <li class="nav-item"><a class="nav-link" href="qnaboardlist">QnA</a></li>
	                <li class="nav-item"><a class="nav-link nick-level" href="mdetail">
		                <c:if test="${admin}">
		                    <span class="levelIcon levelAdmin"></span> 
	                    </c:if>
	                    <c:if test="${!admin}">
		                    <span class="levelIcon level${level}"></span> 
	                    </c:if>
		                ${nick}
	                </a></li>
	                <li class="nav-item"><a class="nav-link confirmBtn2" id="mlogout">Log Out</a></li>
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
					
					<label class="hints">Hint Upload</label>
					<div class="filebox"> 
						<label for="hint1" class="hintLabel">Hint 1</label>
						<input class="fileInput" name="hint1up" id="hint1" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
						<input class="upload-name" value="파일선택" readonly>
					</div>
					<div class="filebox"> 
						<label for="hint2" class="hintLabel">Hint 2</label>
						<input class="fileInput" name="hint2up" id="hint2" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
						<input class="upload-name" value="파일선택" readonly>
					</div>
					<div class="filebox"> 
						<label for="hint3" class="hintLabel">Hint 3</label>
						<input class="fileInput" name="hint3up" id="hint3" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
						<input class="upload-name" value="파일선택" readonly>
					</div>
					<div class="filebox"> 
						<label for="hint4" class="hintLabel">Hint 4</label>
						<input class="fileInput" name="hint4up" id="hint4" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
						<input class="upload-name" value="파일선택" readonly>
					</div>
					<div class="filebox"> 
						<label for="hint5" class="hintLabel">Hint 5</label>
						<input class="fileInput" name="hint5up" id="hint5" multiple="multiple" type="file" accept=".gif, .jpg, .jpeg, .png, .mp3" required>
						<input class="upload-name" value="파일선택" readonly>
					</div>
				</div>
				
				<div class="form-submit">
					<button type="button" class="submitBtn submit_Confirm">Upload</button>
					<button type="reset" id="reset" class="submitBtn"
						onclick="history.back();">Back</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- JS -->
	<script src="resources/join/vendor/jquery/jquery.min.js"></script>
	<script src="resources/join/js/main.js"></script>
	<script src="resources/quiz/js/quizUpload.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<c:if test="${not empty alertMessage}">
		<script type="text/javascript">
			$(document).ready(function(){
				 Swal.fire({
				     icon: 'success',
				     title: '알림',
				     text: '${alertMessage}'
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
				     text: '${alertMessage2}'
				 });
			});
		</script>
	</c:if>
	<script src="resources/common/js/confirm.js"></script>

</body>
</html>