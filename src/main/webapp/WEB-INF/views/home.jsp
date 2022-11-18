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
        <title>Term Quiz on a Bus</title>
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
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 mlcheck" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand " href="#page-top">Term Quiz on a Bus</a>
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
                        <li class="nav-item"><a class="nav-link" href="#about">Quiz</a></li>
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
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-baseline">
                        <a class="btn btn-primary btn-xl" id="startBtn" href="#about">Start Quiz</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="page-section bg-primary" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">Choose Quiz Category</h2>
                        <hr class="divider divider-light" />
                        <p class="text-white-75 mb-4">Start Bootstrap has everything you need to get your new website up and running in no time! Choose one of our open source, free to download, and easy to use themes! No strings attached!</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-6 col-sm-6">
                        <div class="portfolio-box" onclick='location.href="moviequiz";' >
                            <img class="img-fluid" src="resources/home/assets/img/portfolio/thumbnails/movie.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Movie</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="portfolio-box" onclick='location.href="musicquiz";' >
                            <img class="img-fluid" src="resources/home/assets/img/portfolio/thumbnails/music.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Music</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="portfolio-box" >
                            <img class="img-fluid" src="resources/home/assets/img/portfolio/thumbnails/game.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Game</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="portfolio-box">
                            <img class="img-fluid" src="resources/home/assets/img/portfolio/thumbnails/book.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Book</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div></div>
        </footer>
        
        
		
	    <div id="afterJoin" class="ajhidden">
	      <div class="card bg-dark text-white" style="border-radius: 1rem;">
	        <div class="card-body p-5 text-center">
	            <h2 class="fw-bold mb-2 text-uppercase">Success</h2>
	            <p class="text-white-50 mb-5">Use after login</p>
	            <button class="btn btn-outline-light btn-lg px-5" type="button" id="ajBtn">Login</button>
	        </div>
	      </div>
	    </div>
	    
	    <div id="mainlogin" class="mlhidden mlcheck"></div>
		<div id="mainlogin2" class="mlhidden"></div>
	        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/home/js/jquery-3.2.1.min.js"></script>
        <script src="resources/home/js/scripts.js"></script>
        <script src="resources/home/js/main.js"></script>
    </body>
</html>
