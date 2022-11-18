<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ranking</title>
<link href="resources/ranking/css/ranking.css" rel="stylesheet" />
</head>
<body>
	<main>
		<ul id="listBody">
			<c:forEach var="memberList" items="${member}">
				<li>
					<ul id="bodyUl">
						<li class="bodyList ListF">
							<span>${memberList.nickname }</span>
						</li>
						<li class="bodyList ListE">
							<span>${memberList.totalScore }</span>
						</li>
						<li class="bodyList ListE">
							<span>${memberList.movieScore }</span>
						</li>
						<li class="bodyList ListE">
							<span>${memberList.musicScore }</span>
						</li>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</main>	
</body>
</html>