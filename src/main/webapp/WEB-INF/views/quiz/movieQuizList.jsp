<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Movie Quiz List</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/home/assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/home/css/styles.css" rel="stylesheet" />
<link href="resources/home/css/main.css" rel="stylesheet" />
<link href="resources/quiz/css/style.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
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


	<header>
		<div id="quizCategory">
			<h3>Movie Quiz</h3>
			<span>Sunt eiusmod ea magna incididunt nisi labore mollit
				voluptate mollit labore labore duis anim. Ut dolor labore qui
				excepteur pariatur magna aute laboris culpa. Et aliquip nostrud duis
				deserunt dolore irure cillum aliqua et deserunt.</span>
		</div>
		<div id="quizcImage">
			<img alt="movie" src="resources/home/assets/img/portfolio/thumbnails/movie.jpg">
		</div>
	</header>

	<section>
		<table class="table table-dark" id="quizTable">
			<thead>
				<tr>
					<th scope="col" class="quizNo">No</th>
					<th scope="col" class="quizHint">Hint</th>
					<th scope="col" class="quizSolve">Score</th>
					<th scope="col" class="quizStart">Start</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="movie" items="${movieq}">
					<tr class="quizRow">
						<th scope="row" class="quizNo">No.${movie.movieqNo}</th>
						<td class="quizHint">
							<div class="hintDiv">
								<c:if test="${movie.score == 0}">
									<div class="hintBox wBox"></div>							
									<div class="hintBox wBox"></div>							
									<div class="hintBox wBox"></div>							
									<div class="hintBox wBox"></div>							
									<div class="hintBox wBox"></div>							
								</c:if>
								<c:if test="${movie.score == 10}">
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
								</c:if>
								<c:if test="${movie.score == 7}">
									<div class="hintBox rBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
								</c:if>
								<c:if test="${movie.score == 5}">
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
								</c:if>
								<c:if test="${movie.score == 3}">
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox bBox"></div>							
									<div class="hintBox bBox"></div>							
								</c:if>
								<c:if test="${movie.score == 2}">
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox bBox"></div>							
								</c:if>
								<c:if test="${movie.score == 1}">
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
									<div class="hintBox rBox"></div>							
								</c:if>
							</div>
						</td>
						<td class="quizSolve">
							${movie.score}
						</td>
						<td class="quizStart">
							<c:if test="${movie.score == 0}">
								<button type="button" class="btn btn-primary btn-m" onclick="location.href='quizdetail?type=movie&qNo=${movie.movieqNo}'">Start</button>
							</c:if>
							<c:if test="${movie.score != 0}">
								<button type="button" class="btn btn-primary btn-m" onclick="location.href='quizafter?type=movie&qNo=${movie.movieqNo}'">Answer</button>
							</c:if>							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>

	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2022
				- Company Name</div>
		</div>
	</footer>
	
	<div id="mainlogin" class="mlhidden mlcheck"></div>
	<div id="mainlogin2" class="mlhidden"></div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources/home/js/jquery-3.2.1.min.js"></script>
	<script src="resources/home/js/scripts.js"></script>
	<script src="resources/home/js/main.js"></script>
	<script src="resources/quiz/js/quizList.js"></script>
</body>
</html>
