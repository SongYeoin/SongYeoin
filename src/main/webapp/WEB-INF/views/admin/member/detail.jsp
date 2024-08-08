<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력센터</title>
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
             <div class="memberDetail-wrapper">
                <h2>회원 정보 상세조회</h2>
                <p><strong>이름:</strong> ${member.memberName}</p>
                <p><strong>생년월일:</strong> ${member.memberBirthday}</p>
                <p><strong>성별:</strong> ${member.memberGender}</p>
                <p><strong>전화번호:</strong> ${member.memberPhone}</p>
                <p><strong>이메일:</strong> ${member.memberEmail}</p>
                <p><strong>주소:</strong> (${member.memberAddress}) ${member.memberStreetAddress} ${member.memberDetailAddress}</p>
                <p><strong>프로그램:</strong>
                <c:forEach var="enroll" items="${ enrollList }" >
                	${ enroll.syclass.className }
                </c:forEach>
                </p>
                
                <h2>프로그램 등록</h2>
                <label for="classNo">프로그램 선택:</label>
                <select id="classNo">
                    <option value="" disabled selected>선택하세요</option>
                    <c:forEach var="syclass" items="${classList}">
                        <option value="${syclass.classNo}">${syclass.className}</option>
                    </c:forEach>
                </select>
                <button id="submitButton">등록하기</button>
            </div>
        </div>
    </main>
    <!-- 푸터 연결 -->
    <%@ include file="../../common/footer.jsp"%>
</body>

<script>
$(document).ready(function() {
    $('#submitButton').on('click', function() {
        var memberNo = '${member.memberNo}'; 
        var classNo = $('#classNo').val();

        if (!classNo) {
            alert("프로그램을 선택해주세요.");
            return;
        }

        $.ajax({
            url: '${pageContext.servletContext.contextPath}/admin/member/enroll',
            type: 'POST',
            data: {
                memberNo: memberNo,
                classNo: classNo
            },
            success: function(response) {
                if (response === 'success') {
                    alert("수강신청이 완료되었습니다.");
                    location.reload();
                } else {
                    alert("수강신청에 실패하였습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("서버와의 통신에 문제가 발생했습니다.");
            }
        });
    });
});
</script>
</html>