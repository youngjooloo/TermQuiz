<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Comments List</title>
<link href="resources/home/css/styles.css" rel="stylesheet" />
<link href="resources/home/css/main.css" rel="stylesheet" />
<link href="resources/board/css/bcList.css" rel="stylesheet" />
<link href="resources/common/css/textarea.css" rel="stylesheet" />
<link href="resources/board/css/bcList.css" rel="stylesheet" />
</head>
<body>

<c:if test="${not empty commentList}">
	<ul class="answer_list">
		<c:forEach var="bcomments" items="${commentList}">
			
			<li class="comments_List indent_${bcomments.indent}">
				<div class="commentsId">${bcomments.bcId}</div>
				<div class="list_Form">
					<div class="bcommentP">
						<p class="contentp">${bcomments.bcomment}</p>
						<div class="commentsTime">
							<p>${bcomments.bcommentTime}</p>
							<c:if test="${!(bcomments.bcomment eq '삭제된 댓글입니다')}">
								<c:if test="${not empty nick && bcomments.indent < 1 }">
									<input type="button" class="commentsTime_btn third_btn" id="bcNo&#61;${bcomments.bcNo}" value="답글">
								</c:if>
								<c:if test="${bcomments.bcId == nick}">
									<input type="button" class="commentsTime_btn first_btn" id="bcNo&#61;${bcomments.bcNo}" value="수정">
									<input type="button" class="commentsTime_btn second_btn confirmBtn" value="삭제" id="bcommentdelete?bno=${bcomments.bno}&bcno=${bcomments.bcNo}">
								</c:if>
							</c:if>
						</div>
					</div>		
					<div class="modifyForm  formHidden">
						<form action="bcommentupdate?bno&#61;${bcomments.bno}&amp;bcNo&#61;${bcomments.bcNo}" class="bcUpdateF" id="bc${bcomments.bcNo}" method="post">
							<textarea name="bcomment" class="update_area boardComment" maxlength="150" required>${bcomments.bcomment}</textarea>
							<p class="boardCommentModify"></p>
							<div class="btn_div">
								<input type="button" class="commentsTime_btn upBtn submit_Confirm" value="등록">
								<input type="button" class="commentsTime_btn cancelBtn" value="취소">
							</div>
						</form>
					</div>
				</div>
			</li>
			<c:if test="${bcomments.indent < 1}">
				<li class="comments_List indent_1">
					<div class="reReplyForm formHidden">
						<form action="rinsert?bno&#61;${bcomments.bno}&root&#61;${bcomments.root}&amp;step&#61;${bcomments.step}&amp;indent&#61;${bcomments.indent}" 
							class="reReplyF" id="bcNo&#61;${bcomments.bcNo}" method="post">
							<div class="commentsId">${nick}</div>
							<textarea name="bcomment" class="reReply_area boardComment" maxlength="150" required></textarea>
							<p class="boardReCommentModify"></p>
							<div class="btn_div">
								<input type="button" class="commentsTime_btn commentAjax2" value="등록">
								<input type="button" class="commentsTime_btn cancelBtn2" value="취소">
							</div>
						</form>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</c:if>	

<script src="resources/home/js/jquery-3.2.1.min.js"></script>
<script src="resources/home/js/scripts.js"></script>
<script src="resources/home/js/main.js"></script>
<script src="resources/board/js/boardDetail.js"></script>
<script src="resources/board/js/commentUpdate.js"></script>
<script src="resources/board/js/reReply.js"></script>
<script src="resources/common/js/textarea.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="resources/common/js/confirm.js"></script>

</body>
</html>