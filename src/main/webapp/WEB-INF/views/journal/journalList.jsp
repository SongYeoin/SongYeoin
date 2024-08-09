<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육일지 목록</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* CSS Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	height: 100%; /* 전체 높이 설정 */
	font-family: Arial, sans-serif;
}

body {
	display: flex;
	flex-direction: column;
}

main {
	flex: 1;
	margin-left: 250px;
	padding-top: 90px;
	overflow-y: auto;
}

.box {
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

h1 {
	margin-bottom: 20px;
	color: #333;
}

.search_area {
	display: flex;
	flex-wrap: wrap;
	gap: 10px; /* 요소 간 간격 */
	margin-bottom: 20px;
}

.search_area label {
	margin-right: 10px;
	font-weight: bold;
}

.search_area select, 
.search_area input, 
.search_area button {
	height: 30px;
}

.search_area select {
	padding: 0 10px;
}

.search_area input {
	width: 250px;
	padding: 0 10px;
}

.search_area button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.search_area button:hover {
	background-color: #0056b3;
}

.table_wrap {
	margin: 0 auto; /* 가운데 정렬 */
	padding: 0 20px; /* 좌우 여백 조정 */
}

table {
	border-collapse: collapse;
	width: 100%; /* 테이블 너비를 100%로 설정 */
	margin-top: 20px;
	text-align: center;
}

table th, table td {
	border: 2px solid #ddd; /* 연한 회색 테두리 */
	padding: 10px; /* 셀 내 여백 */
}

table th {
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
}

table tbody tr:hover {
	background-color: #f1f1f1; /* 마우스 오버 시 배경색 변경 */
}

.pageInfo_wrap {
	margin: 20px 0;
	text-align: center;
}

.pageInfo {
	list-style: none;
	padding: 0;
	display: inline-block;
}

.pageInfo li {
	display: inline;
	margin: 0 5px;
}

.pageInfo a {
	text-decoration: none;
	color: #007bff;
	font-size: 16px;
	padding: 6px 12px;
	border-radius: 4px;
}

.pageInfo a:hover {
	background-color: #007bff;
	color: #fff;
}

.active a {
	background-color: #007bff;
	color: #fff;
}

</style>
</head>
<body>

	<!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>

	<!-- 사이드바 연결 -->
	<%@ include file="../member/aside.jsp"%>
	
	<main>
		<div class="box">
			<h1>교육일지 목록</h1>
			
			<div class="search_area">
				<form id="searchForm" method="get" action="/club/list">
				
					<label for="classNo">반 선택:</label>
					<select id="classNo" name="classNo">
						<option value="">전체</option>
						<c:forEach items="${classes}" var="cls">
							<option value="${cls.classNo}" ${param.classNo == cls.classNo ? 'selected' : ''}>
								<c:out value="${cls.className}" />
							</option>
						</c:forEach>
					</select>
					
					<label for="year">작성년도:</label>
					<select id="year" name="year">
						<option value="">전체</option>
						<c:forEach var="year" items="${years}">
							<option value="${year}" ${param.year == year ? 'selected' : ''}>
								<c:out value="${year}" />
							</option>
						</c:forEach>
					</select>

					<label for="month">작성월:</label>
					<select id="month" name="month">
						<option value="">전체</option>
						<c:forEach var="m" begin="1" end="12">
							<option value="${m}" ${param.month == m ? 'selected' : ''}>
								<c:out value="${m}" />
							</option>
						</c:forEach>
					</select>

					<label for="keyword">제목 검색:</label>
					<input type="text" id="keyword" name="keyword" value="${param.keyword}" placeholder="제목으로 검색">

					<button type="submit">검색</button>
				</form>
			</div>
			
			<div class="table_wrap">
				<table>
					<thead>
						<tr>
							<th class="bno_width">번호</th>
							<th class="title_width">제목</th>
							<th class="regdate_width">작성일자</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${journalList}" var="journal">
						<tr>
							<td><c:out value="${journal.journalNo}" /></td>
							<td><c:out value="${journal.journalTitle}" /></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${journal.journalWriteDate}" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">

							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
							</c:if>

							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active" : ""}">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a href="${pageMaker.endPage+1}">Next</a></li>
							</c:if>

						</ul>
					</div>
				</div>

				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
				</form>
			</div>
		</div>
	</main>
	
	<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>

</body>
</html>