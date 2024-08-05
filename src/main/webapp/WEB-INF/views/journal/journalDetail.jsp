<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육일지 상세정보</title>
<style>
    .journal_content_wrap {
        margin: 20px;
    }
    .journal_content_subject {
        font-size: 24px;
        font-weight: bold;
    }
    .journal_content_details {
        margin-top: 20px;
    }
    .journal_content_details span {
        display: block;
        margin-bottom: 10px;
    }
    .journal_content_details label {
        font-weight: bold;
    }
    .journal_content_details a {
        color: #007bff;
        text-decoration: none;
    }
    .button {
        display: inline-block;
        padding: 10px 20px;
        margin-top: 20px;
        font-size: 16px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
    }
    .button:hover {
        background-color: #0056b3;
    }
    .admin-button {
        background-color: #28a745;
    }
    .admin-button:hover {
        background-color: #218838;
    }
    .delete-button {
        background-color: #dc3545;
    }
    .delete-button:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>

	<%-- <!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>
	
	<!-- 사이드바 연결 -->	
	<%@ include file="aside.jsp"%> --%>
	
	
	<div class="journal_content_wrap">
		<div class="journal_content_subject">
			<span>교육일지 상세정보</span>
		</div>
		<div class="journal_content_details">
			<span>
                <label for="journalTitle">제목:</label>
                <%= request.getAttribute("journalTitle") %>
            </span>
            <span>
                <label for="journalDate">작성일자:</label>
                <%= request.getAttribute("journalDate") %>
            </span>
            <span>
                <label for="journalAttachment">첨부파일:</label>
                <%
                    String attachment = (String) request.getAttribute("attachment");
                    if (attachment != null && !attachment.isEmpty()) {
                %>
                    <a href="<%= attachment %>" target="_blank">첨부파일 다운로드</a>
                <%
                    } else {
                %>
                    없음
                <%
                    }
                %>
            </span>
		</div>
		<a href="journalList.jsp" class="button">목록</a>
		
		<%-- 수강생으로 로그인한 경우만 수정 및 삭제 버튼을 표시 --%>
		<c:if test="${ sessionScope.loginMember.role eq 'ROLE_STUDENT' }">
			<a href="journalModify.jsp" class="button admin-button">수정</a>
			<%-- <a href="journalDelete.jsp?id=<%= request.getAttribute('journalNo') %>" class="button delete-button" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a> --%>
		</c:if>
	</div>
	
	<%-- <!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%> --%>
</body>
</html>
