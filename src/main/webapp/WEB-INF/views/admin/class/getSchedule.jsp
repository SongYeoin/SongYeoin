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

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
    height: 100%;
}

body {
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

main {
    flex: 1;
    margin-left: 250px;
    padding-top: 130px; /* 헤더 높이만큼 추가 */
    background-color: white;
}

.box {
    height: 100%;
}

.content {
    padding: 20px;
    position: relative;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f4f4f4;
}

/* 반 별 홈 세미헤더 */
.classroom-header {
    background-color: #f1f1f1;
    padding: 10px 20px;
    border-bottom: 2px solid #ccc;
    text-align: left;
    padding-top: 91px;
    position: fixed;
    width: 100%;
    z-index: 999;
    
    display: flex;
    align-items: center;
}

.classroom-header .title {
    font-size: 20px;
    font-weight: bold;
    margin-left: 10px;
}

.classroom-header .details {
    font-size: 12px;
    margin-left: 10px;
}

/* 시간표 추가하기 버튼 스타일 */
.add-schedule-btn {
    position: absolute;
    right: 20px;
    top: 20px;
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    text-align: center;
}

.add-schedule-btn:hover {
    background-color: #218838;
}
</style>
</head>
<body>

    <!-- 메뉴바 연결 -->
    <%@ include file="../../common/header.jsp"%>

    <!-- 반별 홈 세미헤더 -->
    <div class="classroom-header">
        <i class="bi bi-house-fill" onclick="location.href='${pageContext.servletContext.contextPath}/admin/class/getClassList'"></i>
        <div class="title">${syclass.className}</div>
        <div class="details">담당자: ${syclass.managerName} | 강사명: ${syclass.teacherName}</div>
    </div>

    <!-- 사이드바 연결 -->    
    <%@ include file="aside.jsp"%>

    <main>
        <!-- Main content -->
        <div class="content">
            <button class="add-schedule-btn" onclick="location.href='${pageContext.servletContext.contextPath}/admin/class/enrollSchedule'">시간표 추가하기</button>
            <h2>등록된 시간표 조회</h2>
            <c:choose>
                <c:when test="${result == 'null'}">
                    <p>등록된 시간표가 없습니다.</p>
                </c:when>
                <c:when test="${result == 'error'}">
                    <script>
                        alert("시간표 조회 중 오류 발생");
                    </script>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>요일</th>
                                <th>교시</th>
                                <th>시작 시간</th>
                                <th>종료 시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="lastDayOfWeek" value="" />
                            <c:forEach var="period" items="${schedule.periods}">
                                <tr>
                                    <c:choose>
                                        <c:when test="${period.dayOfWeek != lastDayOfWeek}">
                                            <td>${period.dayOfWeek}</td>
                                            <c:set var="lastDayOfWeek" value="${period.dayOfWeek}" />
                                        </c:when>
                                        <c:otherwise>
                                            <td></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${period.periodName}</td>
                                    <td>${period.startTime}</td>
                                    <td>${period.endTime}</td>
                                </tr>                             
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <!-- 푸터 연결 -->
    <%@ include file="../../common/footer.jsp"%>
    
    <c:if test="${not empty message}">
        <script>
            alert('${message}');
        </script>
    </c:if>

</body>
</html>
