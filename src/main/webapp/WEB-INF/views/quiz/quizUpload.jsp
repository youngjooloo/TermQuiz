<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="resources/join/css/style.css">
<link rel="stylesheet" href="resources/quiz/css/quizUpload.css">
</head>
<body>
	<nav>
		<a id="navHome" href="home#page-top">Term Quiz on a Bus</a>
		<div id="navbarResponsive">
			<a class="nav-link" href="home#about">Quiz</a> 
			<a class="nav-link"	href="boardlist">Board</a> 
			<a class="nav-link" href="qnaboardlist">QnA</a>
		</div>
	</nav>

	<div class="main">
		<div class="container">
			<form action="quizupload" method="POST" enctype="multipart/form-data" class="appointment-form" id="appointment-form">
				<h2>Quiz Upload</h2>
				<div class="form-group-1">
					<select name="quizType" required>
				 		<option disabled selected value="">Quiz Type</option>
				 		<option value="movie">Movie</option>
				 		<option value="music">Music</option>					 		
				 		<option value="game">Game</option>
					 	<option value="book">Book</option>
					</select>
					
					<input name="answer" type="text" placeholder="Answer" required>
					
					<label for="hint1">Hint1 - Scene</label>
					<input name="hint1up" id="hint1" multiple="multiple" type="file" required>
					
					<label for="hint2">Hint2 - Cast</label>
					<input name="hint2up" id="hint2" multiple="multiple" type="file" required>
					
					<label for="hint3">Hint3 - Line</label>
					<input name="hint3up" id="hint3" multiple="multiple" type="file" required>
					
					<label for="hint4">Hint4 - BGM</label>
					<input name="hint4up" id="hint4" multiple="multiple" type="file" required>
					
					<label for="hint5">Hint5 - Poster</label>
					<input name="hint5up" id="hint5" multiple="multiple" type="file" required>
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

</body>
</html>