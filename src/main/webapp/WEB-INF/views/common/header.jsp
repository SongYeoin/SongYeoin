<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕스쿨</title>
	
	<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: black;
            color: white;
            padding: 40px;
            display: flex;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .menu-button {
            font-size: 24px;
            cursor: pointer;
            margin-right: 20px;
        }

        .logo {
            font-size: 24px;
        }

        .logo .highlight {
            font-weight: bold;
        }
		
		
      

    </style>
	
	
	
</head>
<body>

	<!-- header 영역 -->
	<header>
        <div class="menu-button">
            &#9776;
        </div>
        <div class="logo">
            <span class="highlight">S</span>ongpa <span class="highlight">W</span>oman
        </div>
    </header>


			<%-- <!-- 로그인 영역 -->

			<div class="login-area">
				<div class="login-form">
					<c:if test="${empty sessionScope.loginMember}">
						<div class="btns">
							<button class="btn">
								<a href="${pageContext.servletContext.contextPath}/member/login">로그인</a>
							</button>
							<button class="btn">
								<a
									href="${pageContext.servletContext.contextPath}/member/regist">회원가입</a>
							</button>
						</div>
					</c:if>

					<c:if test="${!empty sessionScope.loginMember}">
						<div class="welcome-message">
							<c:out value="${sessionScope.loginMember.memberName}" />
							님, 환영합니다.
						</div>
						<div class="btns">
							<c:choose>
								<c:when test="${ sessionScope.loginMember.roleCode == 1}">
									<button class="btn">
										<a
											href="${pageContext.servletContext.contextPath}/master/mypage">정보수정</a>
									</button>
								</c:when>
								<c:when test="${ sessionScope.loginMember.roleCode == 2}">
									<button class="btn">
										<a
											href="${pageContext.servletContext.contextPath}/teacher/mypage">정보수정</a>
									</button>
								</c:when>
								<c:when test="${ sessionScope.loginMember.roleCode == 3}">
									<button class="btn">
										<a
											href="${pageContext.servletContext.contextPath}/member/mypage">정보수정</a>
									</button>
								</c:when>
							</c:choose>
							<button class="btn">
								<a
									href="${pageContext.servletContext.contextPath}/member/logout">로그아웃</a>
							</button>
						</div>
					</c:if>
				</div>
			</div> --%>

</body>
</html>