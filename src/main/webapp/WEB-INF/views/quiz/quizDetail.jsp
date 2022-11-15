<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Quiz Detail</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/home/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/home/css/styles.css" rel="stylesheet" />
        <link href="resources/home/css/main.css" rel="stylesheet" />
        <link href="resources/quiz/css/quizDetail.css" rel="stylesheet" />
    </head>
    <body id="page-top">
    	<div id="mainlogin" class="mlhidden mlcheck"></div>
		<div id="mainlogin2" class="mlhidden"></div>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 mlcheck" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand " href="home">Term Quiz on a Bus</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link" href="home#about">Quiz</a></li>
                        <li class="nav-item"><a class="nav-link endBtn" href="javascript:;">Quiz List</a></li>
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
        
		<main>
			<section id="startPage" class="quizDetail">	
				
				<button class="btn btn-primary btn-m" id="startBtn">Start</button>
			</section>
			
			<section id="hint1" class="quizDetail"> 
				${quiz.movieqNo}
				${quiz.movieqAnswer}
				<div class="hintBox">
					<img alt="hint1" src="${quiz.movieqHint1}">
				</div>
				
				<form action="quizanswer?score=10" class="answerForm hiddenBox">
					<input type="text" placeholder="Answer" required>
					<button type="button" id="hint1Btn" class="hintBtn btn btn-primary btn-m">Submit</button>
				</form>
			</section>

			<section id="hint2" class="quizDetail"> 
				<div class="hintBox">
					<img alt="hint2" src="${quiz.movieqHint2}">
				</div>
				
				<form action="quizanswer?score=7" class="answerForm hiddenBox">
					<input type="text" placeholder="Answer" required>
					<button type="button" id="hint2Btn" class="hintBtn btn btn-primary btn-m">Submit</button>
				</form>
			</section>

			<section id="hint3" class="quizDetail"> 
				<div class="hintBox">
					<img alt="hint3" src="${quiz.movieqHint3}">
				</div>
				
				<form action="quizanswer?score=5" class="answerForm hiddenBox">
					<input type="text" placeholder="Answer" required>
					<button type="button"  id="hint3Btn" class="hintBtn btn btn-primary btn-m">Submit</button>
				</form>
			</section>

			<section id="hint4" class="quizDetail"> 
				<div class="hintBox">
					<audio id="movieBgm" controls="controls">
						<source src="${quiz.movieqHint4}">
					</audio>
				</div>
			
				<form action="quizanswer?score=3" class="answerForm hiddenBox">
					<input type="text" placeholder="Answer" required>
					<button type="button" id="hint4Btn" class="hintBtn btn btn-primary btn-m">Submit</button>
				</form>
			</section>

			<section id="hint5" class="quizDetail">
				<div class="hintBox">
					<img alt="hint5" src="${quiz.movieqHint5}">
				</div>
				 
				<form action="quizanswer?score=2" class="answerForm hiddenBox">
					<input type="text" placeholder="Answer" required>
					<button type="button" id="hint5Btn" class="hintBtn btn btn-primary btn-m">Submit</button>
				</form>
			</section>
			
			<section id="answer" class="quizDetail"> 
				<button type="button" id="endBtn" class="btn btn-primary btn-m endBtn hiddenBox" >List</button>
			</section>
			
			<div class="moveBox hiddenBox">
				<div class="innerBox h1Box hiddenBox">1</div>				
				<div class="innerBox h2Box hiddenBox">2</div>				
				<div class="innerBox h3Box hiddenBox">3</div>				
				<div class="innerBox h4Box hiddenBox">4</div>				
				<div class="innerBox h5Box hiddenBox">5</div>				
			</div>
		</main>        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/home/js/jquery-3.2.1.min.js"></script>
        <script src="resources/home/js/scripts.js"></script>
        <script src="resources/home/js/main.js"></script>
        <script src="resources/quiz/js/quizDetail.js"></script>
    </body>
</html>
