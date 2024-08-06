<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반 수정</title>
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

.form-container {
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
    width: 60%;
    margin: auto;
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input, .form-group textarea {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.form-group button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

.form-group button:hover {
    background-color: #218838;
}                                  

.form-group button#cancelButton {
    background-color: #dc3545;
    color: white;
}

.form-group button#cancelButton:hover {
    background-color: #c82333;
}
</style>
</head>
<body>

	<!-- 메뉴바 연결 -->
	<%@ include file="../../common/header.jsp"%>

	<!-- 사이드바 연결 -->
	<%@ include file="../../admin/aside.jsp"%>

   	<main>
        <!-- Main content -->
	    <div class="form-container">
	        <h2>반 수정</h2>
	        <form id="class-update-form">
	            <div class="form-group">
	                <label for="className">반 이름:</label>
	                <input type="text" id="className" name="className" value="${classDtail.className}" disabled required>
	            </div>
	            <div class="form-group">
	                <label for="description">설명:</label>
	                <textarea id="description" name="description" disabled required>${classDtail.description}</textarea>
	            </div>
	            <div class="form-group">
	                <label for="managerName">관리자명:</label>
	                <input type="text" id="managerName" name="managerName" value="${classDtail.managerName}" disabled required>
	            </div>
	            <div class="form-group">
	                <label for="teacherName">강사명:</label>
	                <input type="text" id="teacherName" name="teacherName" value="${classDtail.teacherName}" disabled required>
	            </div>
	            <div class="form-group">
	                <label for="classroom">강의실:</label>
	                <input type="text" id="classroomName" name="classroomName" value="${classDtail.classroomName}" disabled required>
	            </div>
	            <div class="form-group">
	                <label for="startDate">개강일:</label>
	                <input type="date" id="startDate" name="startDate" value="${classDtail.startDate}" disabled required>
	            </div>
	            <div class="form-group">
	                <label for="endDate">종강일:</label>
	                <input type="date" id="endDate" name="endDate" value="${classDtail.endDate}" disabled required>
	            </div>
	            <div class="form-group">
	                <button type="button" id="editButton">수정</button>
	                <button type="button" id="cancelButton">취소</button>
	            </div>
	        </form>
	    </div>
    </main>

	<!-- 푸터 연결 -->
	<%@ include file="../../common/footer.jsp"%>

<script>
$(document).ready(function() {
	// 수정 버튼 클릭 시 입력 필드 활성화
	$('#editButton').on('click', function() {
		$('#class-update-form input, #class-update-form textarea').prop('disabled', false);
		$('#editButton').text('수정완료');
		$('#editButton').attr('id', 'saveButton');
	});

	// 저장 버튼 클릭 시 AJAX로 수정 요청
	$(document).on('click', '#saveButton', function() {
		$.ajax({
			url: '/admin/class/update',
			type: 'POST',
			data: $('#class-update-form').serialize(),
			success: function(response) {
				if (response === 'success') {
					alert('수정이 성공적으로 완료되었습니다.');
					$('#class-update-form input, #class-update-form textarea').prop('disabled', true);
					$('#saveButton').text('수정');
					$('#saveButton').attr('id', 'editButton');
				} else {
					alert('수정에 실패하였습니다. 다시 시도해 주세요.');
				}
			},
			error: function() {
				alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
			}
		});
	});

	// 취소 버튼 클릭 시 어드민 메인화면으로 이동
	$('#cancelButton').on('click', function() {
		location.href = "/admin/class/getClassList";
	});
});
</script>

</body>
</html>
