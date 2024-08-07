<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력센터 회원관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

/* CSS Reset */

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	height: 1080px;
}

body {
	display: flex;
	flex-direction: column;
	/* min-height: 100vh; */
}

main {
	flex: 1;
	margin-left: 250px;
	padding: 20px;
	padding-top: 90px;
	overflow-y: auto;
}

.memberList-wrapper {
	margin: 20px auto;
	padding: 20px;
	background-color: #f9fafc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 1200px;
	border-radius: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}



table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	text-align: center;
}

table th, table td {
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

table th {
	background-color: #f2f2f2;
}

.search_wrap {
	margin-top: 20px;
}

.search_input input[type=text], .search_input button {
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

.search_input button {
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
}

.search_input button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	
	<!-- 메뉴바 연결 -->
	<%@ include file="../../common/header.jsp"%>

	<!-- 사이드바 연결 -->	
	<%@ include file="../aside.jsp"%>

   <main>
        <!-- Main content -->
        <div class="box">
			<div class="memberList-wrapper">
				<h2 align="center">회원 목록</h2>
				<table>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>가입일</th>
						<th>승인</th>
					</tr>
					<c:forEach items="${ memberList }" var="member">
						<tr> 
						<!-- <tr onclick="showMemberDeatil(${member.memberNo})"> -->
							<td>${ member.memberNo }</td>
							<td>${ member.memberName }</td>
							<td>${ member.memberPhone }</td>
							<td>${ member.memberEnrollDate }</td>
							<td onclick="changeApprovalStatus(${member.memberNo}, '${member.memberCheckStatus}')">
								<c:choose>
									<c:when test="${member.memberCheckStatus == 'W'}">대기</c:when>
                                	<c:when test="${member.memberCheckStatus == 'Y'}">승인</c:when>
                                	<c:when test="${member.memberCheckStatus == 'N'}">미승인</c:when>
								</c:choose>
							</td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
			
			<!-- 검색 영역 -->
			<div class="search_wrap">
				<form id="searchForm" action="/admin/member/list" method="get">
					<div class="search_input">
						<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
						<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<button class='btn search_btn'>검 색</button>
					</div>
				</form>
			</div>

		</div>
	</main>

	<!-- 푸터 연결 -->
	<%@ include file="../../common/footer.jsp"%>

</body>

<script>

function changeApprovalStatus(memberNo, memberCheckStatus) {
	if (window.confirm("승인 하시겠습니까?")) {
		 $.ajax({
	            url: "${ pageContext.servletContext.contextPath }/admin/status-y",
	            type: "post",
	            data: {memberNo: memberNo,
	            	memberCheckStatus: memberCheckStatus},
	            success: function(data) {
	            	console.log(data.trim());
	                if (data.trim() === 'success') {
	                    alert("승인되었습니다.");
	                    location.reload();
	                } else {
	                    alert("승인 처리를 실패했습니다.");
	                }
	            },
	            error: function(error) {
	                console.error("승인 처리 중 오류 발생:", error);
	                alert("승인 처리 중 오류가 발생하였습니다.");
	            }
	        });
	  } else {
		  $.ajax({
	            url: "${ pageContext.servletContext.contextPath }/admin/status-n",
	            type: "post",
	            data: {memberNo: memberNo,
	            	memberCheckStatus: memberCheckStatus},
	            success: function(data) {
	            	console.log(data.trim());
	                if (data.trim() === 'success') {
	                    alert("미승인되었습니다.");
	                    location.reload();
	                } else {
	                    alert("미승인 처리를 실패했습니다.");
	                }
	            },
	            error: function(error) {
	                console.error("미승인 처리 중 오류 발생:", error);
	                alert("미승인 처리 중 오류가 발생하였습니다.");
	            }
	        });
	    
	  }
}




</script>
</html>