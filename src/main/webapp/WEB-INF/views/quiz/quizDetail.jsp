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
<title>Quiz Detail</title>
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
<link href="resources/quiz/css/quizDetail.css" rel="stylesheet" />
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
                    <li class="nav-item"><a class="nav-link endBtn" href="javascript:;">List</a></li>
	                <li class="nav-item"><a class="nav-link" href="boardlist">Board</a></li>
	                <li class="nav-item"><a class="nav-link" href="qnaboardlist">QnA</a></li>
	
	                <c:if test="${empty loginID}">
	                    <li class="nav-item"><a class="nav-link" href="javascript:;" id="loginB">LogIn</a></li>
	                </c:if>
	
	                <c:if test="${not empty loginID}">
	                    <li class="nav-item"><a class="nav-link" href="mdetail">${nick}</a></li>
	                    <li class="nav-item"><a class="nav-link confirmBtn2" id="mlogout">Log Out</a></li>
	                </c:if>
	            </ul>
	        </div>
	    </div>
	</nav>

	<main>
		<section id="startPage" class="quizDetail">
			<button class="btn btn-primary btn-m answerStart" id="startBtn">Start</button>
		</section>

		<section id="hint1" class="quizDetail hiddenBtn">
			<div class="hintBox">
				<img class="hintImg hiddenBtn" alt="hint1" src="${quiz.hint1}">
				<audio id="hintAudio1" class="hintAudio hiddenBtn"
					controls="controls">
					<source src="${quiz.hint1}">
				</audio>
			</div>

			<form action="quizanswer?score=10" class="answerForm hiddenBtn"
				onsubmit="return false;">
				<input name="quizAnswer" type="text" placeholder="Answer" required>
				<button type="button" id="hint1Btn"
					class="hintBtn btn btn-primary btn-m">Submit</button>
			</form>
		</section>

		<section id="hint2" class="quizDetail hiddenBtn">
			<div class="hintBox">
				<img class="hintImg hiddenBtn" alt="hint2" src="${quiz.hint2}">
				<audio id="hintAudio2" class="hintAudio hiddenBtn"
					controls="controls">
					<source src="${quiz.hint2}">
				</audio>
			</div>

			<form action="quizanswer?score=7" class="answerForm hiddenBtn"
				onsubmit="return false;">
				<input name="quizAnswer" type="text" placeholder="Answer" required>
				<button type="button" id="hint2Btn"
					class="hintBtn btn btn-primary btn-m">Submit</button>
			</form>
		</section>

		<section id="hint3" class="quizDetail hiddenBtn">
			<div class="hintBox">
				<img class="hintImg hiddenBtn" alt="hint3" src="${quiz.hint3}">
				<audio id="hintAudio3" class="hintAudio hiddenBtn"
					controls="controls">
					<source src="${quiz.hint3}">
				</audio>
			</div>

			<form action="quizanswer?score=5" class="answerForm hiddenBtn"
				onsubmit="return false;">
				<input name="quizAnswer" type="text" placeholder="Answer" required>
				<button type="button" id="hint3Btn"
					class="hintBtn btn btn-primary btn-m">Submit</button>
			</form>
		</section>

		<section id="hint4" class="quizDetail hiddenBtn">
			<div class="hintBox">
				<img class="hintImg hiddenBtn" alt="hint4" src="${quiz.hint4}">
				<audio id="hintAudio4" class="hintAudio hiddenBtn"
					controls="controls">
					<source src="${quiz.hint4}">
				</audio>
			</div>

			<form action="quizanswer?score=3" class="answerForm hiddenBtn"
				onsubmit="return false;">
				<input name="quizAnswer" type="text" placeholder="Answer" required>
				<button type="button" id="hint4Btn"
					class="hintBtn btn btn-primary btn-m">Submit</button>
			</form>
		</section>

		<section id="hint5" class="quizDetail hiddenBtn">
			<div class="hintBox">
				<img class="hintImg hiddenBtn" alt="hint5" src="${quiz.hint5}">
				<audio id="hintAudio5" class="hintAudio hiddenBtn"
					controls="controls">
					<source src="${quiz.hint5}">
				</audio>
			</div>

			<form action="quizanswer?score=2" class="answerForm hiddenBtn"
				onsubmit="return false;">
				<input name="quizAnswer" type="text" placeholder="Answer" required>
				<button type="button" id="hint5Btn"
					class="hintBtn btn btn-primary btn-m">Submit</button>
			</form>
		</section>

		<section id="answer" class="quizDetail hiddenBtn">
			<div class="answerBox">
				<p id="correctBox">정답은?</p>
				<p id="correctAnswer">${quiz.answer}</p>
			</div>

			<button type="button" id="endBtn"
				class="btn btn-primary btn-m endBtn hiddenBox">List</button>
		</section>

		<div class="moveBox hiddenBox">
			<a href="#hint1" class="innerBox h1Box hiddenBox">1</a> <a
				href="#hint2" class="innerBox h2Box hiddenBox">2</a> <a
				href="#hint3" class="innerBox h3Box hiddenBox">3</a> <a
				href="#hint4" class="innerBox h4Box hiddenBox">4</a> <a
				href="#hint5" class="innerBox h5Box hiddenBox">5</a> <a
				href="#answer" class="innerBox aBox hiddenBox">A</a>
		</div>
	</main>
	
	<div id="mainlogin" class="mlhidden mlcheck"></div>
	<div id="mainlogin2" class="mlhidden"></div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources/home/js/jquery-3.2.1.min.js"></script>
	<script src="resources/home/js/scripts.js"></script>
	<script src="resources/home/js/main.js"></script>
	<script src="resources/quiz/js/quizDetail.js"></script>

	<c:if test="${empty nick}">
		<script type="text/javascript">
			$(".hintBtn").click(function() {
				let answerSubmit = $(this).prev().val();
				if (answerSubmit.length > 0) {
					justAnswer(this)
				}
			});
		</script>
	</c:if>
	<c:if test="${not empty nick}">
		<script type="text/javascript">
			$(".hintBtn").click(function() {
				let answerSubmit = $(this).prev().val();
				if (answerSubmit.length > 0) {
					loginAnswer(this)
				}
			});
		</script>
	</c:if>

	<script type="text/javascript">
		let inputType = [ "${quiz.hint1}", "${quiz.hint2}", "${quiz.hint3}",
				"${quiz.hint4}", "${quiz.hint5}" ];
		for (var i = 0; i < inputType.length; i++) {
			inputType[i] = inputType[i].split(".")[1];
			inputType[i] = inputType[i].toLowerCase();

			let imgType = document.getElementsByClassName("hintImg");
			let audioType = document.getElementsByClassName("hintAudio")

			switch (inputType[i]) {
			case "img":
			case "jpg":
			case "jpeg":
			case "gif":
			case "png":
				inputType[i] = "typeI"
				break;
			case "mp3":
				inputType[i] = "typeA"
				break;
			}

			if (inputType[i] == "typeI") {
				imgType[i].classList.remove("hiddenBtn");
			} else if (inputType[i] == "typeA") {
				audioType[i].classList.remove("hiddenBtn");
			}
		}
	</script>
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
