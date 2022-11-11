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
<title>QnA Detail</title>
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
<link href="resources/board/css/main.css" rel="stylesheet" />
<link href="resources/qna/css/qnaDetail.css" rel="stylesheet" />
</head>
<body id="page-top">
	<div id="mainlogin" class="mlhidden mlcheck"></div>
	<div id="mainlogin2" class="mlhidden"></div>
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg navbar-light fixed-top py-3 mlcheck"
		id="mainNav">
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

	<header class="board_container">
		<div class="board_container_div">
			<h3 class="board_container_intro">
				<a href="qnaboardlist">QnA</a>
			</h3>
			<p class="board_container_p">궁금했던 질문을 관리자에게 질문하세요!</p>
		</div>
	</header>

	<article>
		<table>
			<thead>
				<tr>
					<th>No.${qna.qnaNo}</th>
					<th>ID : ${qna.qnaId}</th>
					<th>${qna.qnaTitle}</th>
					<th>${qna.qnaTime}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Question</th>
					<td colspan="3" id="userQuestion">${qna.qnaContent}</td>
				</tr>
				<tr>
					<th>Answer</th>
					<td colspan="3" id="adminAnswer">
						<c:if test="${not empty qna.qnaAnswer}">
							<b> ${qna.qnaAnswer}</b>
							<c:if test="${admin}">
								<button class="btn_detail answerBtn" id="qnaNo&#61;${qna.qnaNo}" type="button">Delete</button>
							</c:if>
						</c:if>
						<c:if test="${empty qna.qnaAnswer}">
							<c:if test="${admin}">
								<form action="qnaanswer?qnaNo&#61;${qna.qnaNo}" method="post" id="qnaAnswer">
									<textarea name="qnaAnswer" required></textarea>
									<button class="btn_answer" type="submit">Submit</button>
								</form>
							</c:if>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="wrap_paging qnaWrap">
			<c:if test="${qna.qnaId == nick && empty qna.qnaAnswer}">
				<button type="button" class="btn_detail" onclick="location.href='qnadetail?jCode=U&qnaNo=${qna.qnaNo}'">Modify</button>
			</c:if>
			<c:if test="${(qna.qnaId == nick && empty qna.qnaAnswer)|| admin}">
				<button type="button" class="btn_detail" onclick="location.href='qnadelete&qnaNo=${qna.qnaNo}'">Delete</button>
			</c:if>
			<button type="button" class="btn_detail" onclick="location.href='qnaboardlist'">Back</button>
		</div>
	</article>

	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2022
				- Company Name</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<script src="resources/home/js/jquery-3.2.1.min.js"></script>
	<script src="resources/home/js/scripts.js"></script>
	<script src="resources/home/js/main.js"></script>
	<script src="resources/qna/js/qnaDetail.js"></script>
	
</body>
</html>
