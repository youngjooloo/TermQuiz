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
<title>자유게시판</title>
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
<link href="resources/board/css/boardDetail.css" rel="stylesheet" />
<link href="resources/common/css/textarea.css" rel="stylesheet" />
<link href="resources/board/css/bcList.css" rel="stylesheet" />
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
						<li class="nav-item"><a class="nav-link" href="javascript:;"
							id="loginB">LogIn</a></li>
					</c:if>

					<c:if test="${not empty loginID}">
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
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<header class="board_container">
		<div class="board_container_div">
			<h3 class="board_container_intro">
				<a href="boardlist">자유게시판</a>
			</h3>
			<p class="board_container_p">자유롭게 적어주세요!</p>
		</div>
	</header>

	<article>
		<table class="content_table">
			<thead>
				<tr>
					<th>No.${board.bno}</th>
					<th>	
						<span class="nick-level">
							<c:if test="${board.adminRight}">
								<span class="levelIcon levelAdmin"></span>
							</c:if>
							<c:if test="${!board.adminRight}">
								<span class="levelIcon level${board.mlevel}"></span>
							</c:if>
							${board.bid}
					 	</span>
					</th>
					<th>${board.btitle}</th>
					<th>${board.btime}</th>
					<th>조회 수 ${board.bcount}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>내용</th>
					<td colspan="4" class="content_area">${board.bcontent}</td>
				</tr>
			</tbody>
		</table>

		<div class="wrap_paging boardWrap">
			<button id="commentList" type="button" class="btn_bcomments"
				onclick="bcommentsList();">댓글</button>
			<c:if test="${board.bid == nick || admin}">
				<button type="button" class="btn_detail"
					onclick="location.href='boarddetail?jCode=U&bno=${board.bno}&currPage=${board.currPage}'">Modify</button>
			</c:if>
			<c:if test="${board.bid == nick || admin}">
				<button type="button" class="btn_detail confirmBtn"
					id="boarddelete?bno=${board.bno}">Delete</button>
			</c:if>
			<button type="button" class="btn_detail"
				onclick="location.href='boardlist'">Back</button>
		</div>

		<div class="bcommentsList"></div>
		<div id="resultArea2"></div>

		<c:if test="${not empty nick}">
			<form action="rinsert?bno=${board.bno}&currPage=${board.currPage}" method="post" id="answerForm">
				<ul class="reply">
					<li class="comments_List">
						<div class="commentsId nick-level">
							<c:if test="${admin}">
								<span class="levelIcon levelAdmin"></span>
							</c:if>
							<c:if test="${!admin}">
								<span class="levelIcon level${level}"></span>
							</c:if>
							${nick}
						</div>
						<div class="comment_area">
							<textarea name="bcomment" id="answer_area" maxlength="150" class="boardComment" required></textarea>
							<p class="boardCommentP"></p>
							<input type="button" class="btn_ist commentAjax"  value="등록하기">
						</div>
					</li>
				</ul>
			</form>
		</c:if>
		<div class="board_List"></div>
	</article>

	<footer class="bg-light py-4">
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
	<script src="resources/common/js/textarea.js"></script>
	<script src="resources/board/js/bcommentsAjax.js"></script>
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
