<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/* Add styles for detail page */
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

.detail-wrapper {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.detail-wrapper h2 {
	margin-bottom: 20px;
}

.detail-wrapper table {
	width: 100%;
	border-collapse: collapse;
}

.detail-wrapper table th, .detail-wrapper table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

.detail-wrapper table th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<div class="detail-wrapper">
		<h2>회원 상세 정보</h2>
		<table>
			<tr>
				<th>번호</th>
				<td>${member.memberNo}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${member.memberId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${member.memberName}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.memberPhone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.memberEmail}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${member.memberEnrollDate}</td>
			</tr>
			<tr>
				<th>상태</th>
				<td><c:choose>
						<c:when test="${member.memberCheckStatus == 'W'}">대기</c:when>
						<c:when test="${member.memberCheckStatus == 'Y'}">승인</c:when>
						<c:when test="${member.memberCheckStatus == 'N'}">미승인</c:when>
					</c:choose></td>
			</tr>
			<!-- Add more fields as needed -->
		</table>
		<a href="javascript:history.back()">뒤로 가기</a>
	</div>
</body>
</html>