<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Detail</title>

<link rel="icon" type="image/x-icon"
	href="resources/home/assets/favicon.ico" />

<!-- Font Icon -->
<link rel="stylesheet"
	href="resources/join/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/home/css/main.css">
<link rel="stylesheet" href="resources/home/css/styles.css">
<link rel="stylesheet" href="resources/join/css/style.css">
<link rel="stylesheet" href="resources/memberDetail/css/memberDetail.css">
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
					<li class="nav-item"><a class="nav-link" href="mdetail">
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

	<div class="main" id="detailMain">
	    <div class="container">
	        <form action="mdetailup" method="POST" class="appointment-form" id="appointment-form">
	            <h2>Personal information</h2>
	            
	            <div class="form-group-1">
	  				<label for="email" class="label-agree-term">Email</label>          
	                <input type="email" class="joininput" name="email" id="email" value="${user.email}" required readonly />
	
	  				<label for="nickname" class="label-agree-term">Nickname</label> 
	                <input type="text" class="joininput nickname" name="nickname" id="nickname" value="${user.nickname}"
	                    placeholder="Nick Name (4글자 이상, 10글자 이하)" maxlength="10" minlength="4" required />
	
	  				<label for="changePW" class="label-agree-term">Password</label>          
	            	<button type="button" id="changepwf" class="submitBtn changePW confirmBtn2">Password Change</button>
	
	  				<label for="name" class="label-agree-term">Name</label>          
	                <input type="text" class="joininput" name="name" id="name" value="${user.name}"  required readonly />
	
	  				<label for="phone_number" class="label-agree-term">Phone Number</label>          
	                <input type="number" class="joininput" oninput="numcheck(this);" name="phoneNumber" id="phone_number"
	                value="${user.phoneNumber}"
	                    placeholder="Phone Number" maxlength="11" required />
	
	  				<label class="label-agree-term">Social Number</label>          
	                <div id="socialnf" class="label-agree-term">
	                    <input type="number" class="joininput" name="scNumF" id="socialnumf" value="${user.scNumF}" maxlength="6" required
	                        readonly />
	                    <p>&nbsp;&mdash;&nbsp;</p>
	
	                    <input type="number" class="joininput" name="scNumL" id="socialnuml"  value="${user.scNumL}"  maxlength="1" required
	                        readonly />
	
	                    <input id="socialnumb" value="******" disabled="disabled" />
	                </div>
	            </div>
	            <div class="form-submit">
	                <button type="button" class="submitBtn submit_Confirm2">Modify</button>
	                <button type="button" id="mdeletef" class="submitBtn confirmBtn">Delete</button>
	                <button type="button" id="reset" class="submitBtn" onclick="history.back();">Back</button>
	            </div>
	        </form>
	    </div>
	</div>

	<!-- JS -->
	<script src="resources/join/vendor/jquery/jquery.min.js"></script>
	<script src="resources/join/js/main.js"></script>
	<script src="resources/memberDetail/js/detailUpdate.js"></script>
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