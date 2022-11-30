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
			<c:forEach var="memberList" items="${member}" varStatus="status">
				<li>
					<ul class="bodyUl">
						<li class="bodyList ListF">
							<span>${status.count}</span>
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
						<a href="boardlist${maker.searchQuery(1)}">&Lt;</a>
					</c:if>

					<c:if test="${maker.prev}">
						<a href="boardlist${maker.searchQuery(maker.spageNo-1)}"
							class="pageBtn">&lt;</a>
					</c:if>
				</div>

				<div class="boardNumBox">
					<c:forEach var="i" begin="${maker.spageNo}" end="${maker.epageNo}">
						<c:if test="${i==maker.currPage}">
							<a href="boardlist${maker.searchQuery(i)}" class="paging_num_on">
								<span class="screen_out">현재페이지</span>${i}
							</a>

						</c:if>
						<c:if test="${i !=maker.currPage}">
							<a href="boardlist${maker.searchQuery(i)}">${i}</a>
						</c:if>
					</c:forEach>
				</div>

				<div class="boardBtnRight">
					<c:if test="${maker.next}">
						<a href="boardlist${maker.searchQuery(maker.epageNo+1)}"
							class="pageBtn">&gt;</a>
					</c:if>

					<c:if test="${maker.next && maker.epageNo>0}">
						<a href="boardlist${maker.searchQuery(maker.lastPageNo)}" class="">&Gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</main>	
</body>
</html>