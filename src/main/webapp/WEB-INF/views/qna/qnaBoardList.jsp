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
<title>QnA List</title>
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
</head>
<body id="page-top">
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
						<li class="nav-item"><a class="nav-link" href="mdetail">${nick}</a></li>
						<li class="nav-item"><a class="nav-link confirmBtn2" id="mlogout">Log
								Out</a></li>
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

	<section class="notice">
		<!-- board list area -->
		<div id="board-list">
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col" class="th-num">번호</th>
						<th scope="col" class="th-id">작성자</th>
						<th scope="col" class="th-title">제목</th>
						<th scope="col" class="th-date">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qnaList" items="${qna}">
						<tr class="qna_list" id="qnaNo&#61;${qnaList.qnaNo}">
							<td>${qnaList.qnaNo}</td>
							<td>${qnaList.qnaId}</td>
							<td>${qnaList.qnaTitle}<c:if
									test="${not empty qnaList.qnaAnswer }">
									<b>&nbsp;[답변 완료]</b>
								</c:if> <c:if test="${empty qnaList.qnaAnswer }">
									<b>&nbsp;[미답변]</b>
								</c:if>
							</td>
							<td>${qnaList.qnaTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 페이징  -->
		<div class="wrap_paging">
			<div class="boardBtnBox">
				<div class="boardBtnLeft">
					<c:if test="${maker.prev && maker.spageNo>1}">
						<a href="qnaboardlist${maker.searchQuery(1)}">&Lt;</a>
					</c:if>
					
					<c:if test="${maker.prev}" >
						<a href="qnaboardlist${maker.searchQuery(maker.spageNo-1)}" class="pageBtn">&lt;</a>
					</c:if>
				</div>
				
				<div class="boardNumBox" >
					<c:forEach  var="i" begin="${maker.spageNo}" end="${maker.epageNo}">
					   	<c:if test="${i==maker.currPage}">
							 <a href="qnaboardlist${maker.searchQuery(i)}" class="paging_num_on">
								<span class="screen_out">현재페이지</span>${i}
							 </a>
							
				       	</c:if>
					    <c:if test="${i !=maker.currPage}">
					        <a href="qnaboardlist${maker.searchQuery(i)}" >${i}</a>
					    </c:if>
					</c:forEach>
				</div> 
				
				<div class="boardBtnRight">
					<c:if test="${maker.next}">
						<a href="qnaboardlist${maker.searchQuery(maker.epageNo+1)}" class="pageBtn">&gt;</a>
					</c:if>
					
					<c:if test="${maker.next && maker.epageNo>0}">
						<a href="qnaboardlist${maker.searchQuery(maker.lastPageNo)}" class="">&Gt;</a>
					</c:if>
				</div>
			</div>
			<c:if test="${not empty loginID}">
				<button type="button" class="btn_insert"
					onclick="location.href='qnainsertf';">글 등록</button>
			</c:if>
		</div>
		<!-- board seach area -->
		<div id="board-search">
			<div class="search-window">
				<form action="qnaboardlist" method="post" class="search-wrap">
					<select class="search-wrap" name="searchType" id="searchType">
						<option value="n" ${maker.searchType==null ? 'selected' : ''}>검색 조건</option>
						<option value="all" ${maker.searchType=='all' ? 'selected' : ''}>전체</option>
						<option value="t" ${maker.searchType=='t' ? 'selected' : ''}>제목</option>
						<option value="c" ${maker.searchType=='c' ? 'selected' : ''}>내용</option>
						<option value="a" ${maker.searchType=='a' ? 'selected' : ''}>답변</option>
					</select> <label for="search" class="blind">QNA 내용 검색</label> <input
						id="keyword" type="search" name="keyword"
						placeholder="검색어를 입력해주세요." value="${maker.keyword}">
					<button type="submit" id="searchBtn" class="btn btn-dark">검색</button>
				</form>
			</div>
		</div>
	</section>
	
	<div id="mainlogin" class="mlhidden mlcheck"></div>
	<div id="mainlogin2" class="mlhidden"></div>

	<!-- Footer-->
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
	<script src="resources/qna/js/qnaList.js"></script>

	<script>
		$(function() {
			$('#searchType').change(function() {
				if ($(this).val() == 'n')
					$('#keyword').val('');
			});

			$('#searchBtn').click(
					function() {
						self.location = "qnaboardlist"
								+ "${maker.makeQuery(1)}" + "&searchType="
								+ $('#searchType').val() + "&keyword="
								+ $('#keyword').val()
					}); //click
		}); //ready
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