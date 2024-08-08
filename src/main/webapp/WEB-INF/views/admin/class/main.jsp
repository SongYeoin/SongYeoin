<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력개발센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
}

.box {
    height: 100%;
}

.classroom-header {
    background-color: #f1f1f1;
    padding: 20px;
    border-bottom: 2px solid #ccc;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    text-align: left;
}

.classroom-header .title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.classroom-header .details {
    font-size: 16px;
}

.content {
    padding: 20px;
    background-color: #fff;
}

.content h2 {
    margin-bottom: 20px;
}
</style>
</head>
<body>

    <!-- 메뉴바 연결 -->
    <%@ include file="../../common/header.jsp"%>

    <!-- 사이드바 연결 -->    
    <%@ include file="aside.jsp"%>

    <main>
        <!-- Main content -->
        <div class="classroom-header">
            <div class="title">${syclass.className}</div>
            <div class="details">담당자: ${syclass.managerName} | 강사명: ${syclass.teacherName}</div>
        </div>
        <div class="content">
            <!-- 강의실 홈의 다른 내용이 여기에 들어갑니다 -->
            <p>환영합니다! 이곳은 ${className} 강의실 홈입니다. 다양한 강의 자료와 정보를 확인하실 수 있습니다.</p>
        </div>
    </main>

    <!-- 푸터 연결 -->
    <%@ include file="../../common/footer.jsp"%>

</body>
</html>
