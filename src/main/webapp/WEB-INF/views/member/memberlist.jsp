<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member List</title>

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
<link href="resources/ranking/css/list.css" rel="stylesheet" />
<link href="resources/ranking/css/style.css" rel="stylesheet" />
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="resources/ranking/css/style.css"> -->
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 mlcheck" id="mainNav">
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
					<li class="nav-item"><a class="nav-link" href="mdetail"><span class="levelIcon level${level}"></span> ${nick}</a></li>
					<li class="nav-item"><a class="nav-link  confirmBtn2" id="mlogout">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<section class="ftco-section2">
		<div class="container2">
			<div class="row2">
				<div class="col-md-11">
					<div class="table-wrap2">
						<table class="table2 table-dark2">
						  <thead>
						    <tr class="bg-dark2">
						      <th>Email</th>
						      <th>Nickname</th>
						      <th>Name</th>
						      <th>Phone Number</th>
						      <th>Birthday</th>
						      <th>Admin</th>
						      <th>Delete</th>
						    </tr>
						  </thead>
						  <tbody>
							<c:forEach var="list" items="${member}" varStatus="listNo">
								<c:choose>
									<c:when test="${listNo.count%5 == 1}">
										<tr class="bg-primary2">
									</c:when>
									<c:when test="${listNo.count%5 == 2}">
			 						    <tr class="bg-success2">
									</c:when>
									<c:when test="${listNo.count%5 == 3}">
									    <tr class="bg-warning2">
									</c:when>
									<c:when test="${listNo.count%5 == 4}">
									    <tr class="bg-danger2">
									</c:when>
									<c:otherwise>
									    <tr class="bg-info2">
									</c:otherwise>
								</c:choose> 
							      <th scope="row">${list.email}</th>
							      <td>${list.nickname}</td>
							      <td>${list.name}</td>
							      <td>${list.phoneNumber}</td>
							      <td>${list.scNumF}-${list.scNumL}</td>
							      <td>
							      	<c:if test="${list.adminRight and !(nick eq list.nickname)}">
										<button id="${list.nickname}" class="removeAdmin">Remove</button>  
				    				</c:if>
				    				<c:if test="${!list.adminRight and !(nick eq list.nickname)}">
										<button id="${list.nickname}" class="addAdmin">Add</button>  
				    				</c:if>
							      </td>
							      <td>
							    	<c:if test="${!(nick eq list.nickname)}">
										<button id="mdeletea?email=${list.email}" class="confirmBtn">Delete</button>  
					    			</c:if>
							      </td>
							    </tr>
						    </c:forEach>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/home/js/jquery-3.2.1.min.js"></script>
    <script src="resources/home/js/scripts.js"></script>
    <script src="resources/home/js/main.js"></script>
    <script src="resources/ranking/js/memberList.js"></script>
	<script src="resources/ranking/js/main.js"></script>
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