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
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	/* min-height: 100vh; */
}

main {
	flex: 1;
	margin-left: 250px;
	padding-top: 90px;
	overflow-y: auto;
	top: 120px;
	left: 250px;
	/* background-color: yellow; */
}

.box{
	height: 100%;

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
        <!-- <h2>수강생 관리</h2> -->
			<div class="memberList-wrapper">
				<h2 align="center">수강생 관리</h2>
				<table>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>가입일</th>
						<th>승인</th>
					</tr>
					<!-- (LV.2 > ST.1) 1. EL, JSTL 활용해서 목록 현출되게 하기  -->
					<c:forEach items="${ memberList }" var="member">
						<tr onclick="showMemberDeatil(${member.memberNo})">
							<td>${ member.memberName }</td>
							<td width=500>${ member.memberPhone }</td>
							<td>${ member.memberEnrollDate }</td>
							<td>${ member.memberCheckStatus }</td>
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
</html>