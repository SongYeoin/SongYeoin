<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력센터</title>
</head>

<style>
#login-wrap{
	/* height:80vh; */
 	/* position:relative; */
	width:100%
}

.login-wrapper {
    width: 400px; 
    padding: 20px; 
    background-color: #fff; 
    border-radius: 15px; 
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); 
    margin: 0 auto; 
}

#join {
	text-align: right;
}

p a {
	text-decoration:none;
}
</style>

<body>

	<!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>

	<div id="login-wrap">

		<div class="login-wrapper">
			<h2>Login</h2>
			<form action="${ pageContext.servletContext.contextPath }/member/login"
				method="post" id="login-form">
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요"><br>
				<span id="userIdError" class="error"></span><br> 
				
				<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"><br>
				<span id="userPwdError" class="error"></span><br>
				<input type="submit" id="loginBtn" value="로그인"><br>
			</form>
			<p id="join"> <a href="${ pageContext.servletContext.contextPath }/member/join">SignUp</a>
		</div>

	</div>

	<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>

	<script>
		$(document).ready(function() {

			$('#login-form').submit(function(event) {

				$('#userIdError').text("");
				$('#userPwdError').text("");

				let valid = true;

				if ($('#userId').val().trim() === "") {
					$('#userIdError').text("아이디를 입력하세요.");
					valid = false;
				}

				if ($('#userPwd').val().trim() === "") {
					$('#userPwdError').text("비밀번호를 입력하세요.");
					valid = false;
				}

				if (!valid) {
					event.preventDefault();
				}
			});

		});
	</script>

</body>
</html>