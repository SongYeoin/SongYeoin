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
/* #login-wrap{
	position:relative;
	width:100%;
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
} */

body, h2, p, form {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

#login-wrap {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-wrapper {
    width: 400px;
    padding: 30px;
    background-color: #ececec;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

form input[type="text"], 
form input[type="password"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
}

form input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #000000;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

.error {
    color: #e74c3c;
    font-size: 14px;
}

#join {
	text-align: right;
}

p a {
    /* text-decoration: none; */
    color: #000000;
}

</style>

<body>

	<div id="login-wrap">

		<div class="login-wrapper">
			<!-- <h2>Login</h2> -->
			<form action="${ pageContext.servletContext.contextPath }/member/login" method="post" id="login-form">
				<p>ID</p>
				<input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요"><br>
				<span id="userIdError" class="error"></span><br> 
				
				<p>Password</p>
				<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"><br>
				<span id="userPwdError" class="error"></span><br>
				<input type="submit" id="loginBtn" value="Login"><br>
			</form>
			<p id="join"> <a href="${ pageContext.servletContext.contextPath }/member/join">SignUp</a>
		</div>

	</div>

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