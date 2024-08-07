<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>게시판 등록</h1>

	<form action="/club/enroll" method="post">
		<div class="input_wrap">
			<!-- <label>작성자</label> <input name="title"> 
			<div class="input_wrap">
        <label>신청자</label>
        <input name="applicant" value="자동으로 로그인한 사용자의 이름을 서버에서 입력" readonly>
    </div>-->
		</div>
		<div class="input_wrap">
			<label>참여자</label> <input type="text" name="join">
		</div>
		<div class="input_wrap">
			<label>활동일</label> <input type="date" name="studyDate">
		</div>
		<div class="input_wrap">
			<label>내용</label>
			<textarea rows="3" name="content"></textarea>
		</div>

		<input type="submit" value="등록">

	</form>

	
</body>
</html>