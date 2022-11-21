<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error 404</title>

<link rel="icon" type="image/x-icon"
	href="resources/home/assets/favicon.ico" />

<!-- Font Icon -->
<link rel="stylesheet"
	href="resources/join/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="resources/error/css/error404.css">
</head>
<body>
	<main>
		<img alt="error" src="resources/error/img/error.png">
		<div>
			<h2>Error 404</h2>
			<h2>죄송합니다. 해당 페이지를 찾을 수 없습니다.</h2>
			<button type="button" onclick="javascript:history.back();">Back</button>
			<button type="button" onclick="location.href='home';">Home</button>
		</div>
	</main>
</body>
</html>