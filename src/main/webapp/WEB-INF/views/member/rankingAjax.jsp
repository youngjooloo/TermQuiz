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
	<main id="listMain">
		<ul id="listBody">
			<c:forEach var="memberList" items="${member}" varStatus="status">
				<li>
					<ul class="bodyUl">
						<li class="bodyList ListF">
							<span>${((maker.currPage-1)*maker.rowsPerPage)+status.count}</span>
						</li>
						<li class="bodyList ListN">
							<span>
								<span class="levelIcon level${memberList.mlevel}"></span>
								${memberList.nickname}
							</span>
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
		<div class="wrap_paging">
			<div class="boardBtnBox">
				<div class="boardBtnLeft">
					<c:if test="${maker.prev && maker.spageNo>1}">
						<a href="javascript:;" id="rankingajax${maker.searchQuery(1)}" class="rankingPage">&Lt;</a>
					</c:if>

					<c:if test="${maker.prev}">
						<a href="javascript:;" id="rankingajax${maker.searchQuery(maker.spageNo-1)}"
							class="pageBtn rankingPage">&lt;</a>
					</c:if>
				</div>

			<div class="boardNumBox">
				<c:forEach var="i" begin="${maker.spageNo}" end="${maker.epageNo}">
						<c:if test="${i==maker.currPage}">
							<a href="javascript:;" id="rankingajax${maker.searchQuery(i)}" class="paging_num_on rankingPage">
								<span class="screen_out">현재페이지</span>${i}
							</a>

						</c:if>
						<c:if test="${i !=maker.currPage}">
							<a href="javascript:;" id="rankingajax${maker.searchQuery(i)}" class="rankingPage">${i}</a>
						</c:if>
					</c:forEach>
				</div>

				<div class="boardBtnRight">
					<c:if test="${maker.next}">
						<a href="javascript:;" id="rankingajax${maker.searchQuery(maker.epageNo+1)}"
							class="pageBtn rankingPage">&gt;</a>
					</c:if>

					<c:if test="${maker.next && maker.epageNo>0}">
						<a href="javascript:;" id="rankingajax${maker.searchQuery(maker.lastPageNo)}" class="rankingPage">&Gt;</a>
					</c:if>
				</div>
			</div>
			<input type="text" name="sortName" id="sortName" value="${maker.sortName}">
		</div>
	</main>	
	
	<script src="resources/home/js/jquery-3.2.1.min.js"></script>
    <script src="resources/ranking/js/rankingPage.js"></script>
</body>
</html>