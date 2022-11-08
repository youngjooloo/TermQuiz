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
						<li class="nav-item"><a class="nav-link" href="javascript:;"
							id="loginB">LogIn</a></li>
					</c:if>

					<c:if test="${not empty loginID}">
						<li class="nav-item"><a class="nav-link" href="mdetail">My
								Info</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	
	<header class="board_container">
		<div class="board_container_div">
			<h3 class="board_container_intro"><b>자유게시판</b></h3>
			<p class="board_container_p">
				자유롭게 적어주세요!
			</p>
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
	                    <th scope="col" class="th-cnt">조회수</th>
	                </tr>
	                </thead>
	                <tbody>
	                <tr>
	                    <td>1</td>
	                    <td>작성자 1</td>
	                    <th>
	                      <a href="#!">게시글 1</a>
	                      <p>테스트</p>
	                    </th>
	                    <td>2022.11.07</td>
	                    <td>1</td>
	                </tr>
	
	                <tr>
	                   <td>2</td>
	                    <td>작성자 2</td>
	                    <th>
	                      <a href="#!">게시글 2</a>
	                      <p>테스트</p>
	                    </th>
	                    <td>2022.11.07</td>
	                    <td>2</td>
	                </tr>
	
	                <tr>
	                    <td>3</td>
	                    <td>작성자 3</td>
	                    <th>
	                      <a href="#!">게시글 3</a>
	                      <p>테스트</p>
	                    </th>
	                    <td>2022.11.07</td>
	                    <td>3</td>
	                </tr>
	                </tbody>
	            </table>
	    </div>
	    
	    <!-- 페이징  -->
	    <div class="wrap_paging">
		<a href="" class="paging_num_on"> 
		<span class="screen_out">현재 페이지</span> 
		1
		</a>
		 <button type="button" class="btn_insert" onclick="board/boardDetail;">글 등록</button>
	   </div>
	    <!-- board seach area -->
	    <div id="board-search">
	            <div class="search-window">
	                <form action="">
	                    <div class="search-wrap">
	                        <label for="search" class="blind">자유게시판 내용 검색</label>
	                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
	                        <button type="submit" class="btn btn-dark">검색</button>
	                    </div>
	                </form>
	        </div>
	    </div>
	</section>

	
	<!-- Footer-->
    <footer class="bg-light py-5">
    	<div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div></div>
    </footer>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<script src="resources/home/js/jquery-3.2.1.min.js"></script>
	<script src="resources/home/js/scripts.js"></script>
	<script src="resources/home/js/main.js"></script>
</body>
</html>