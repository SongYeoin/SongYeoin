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
</head>
<body>

</body>
<script>

	$(document).ready(function() {
		var enrollResult = '${enroll_result}';
		var delete_result = '${delete_result}';

		if (enrollResult === 'success') {
			alert("정상적으로 수정되었습니다");
		} else if(enrollResult === 'fail') {
			alert("회원정보 수정에 실패하였습니다");
		} else {
			alert("처리 중 오류가 발생하였습니다.");
		}
		
		if(delete_result === 'fail') {
			alert("회원 탈퇴에 실패하였습니다.");
		}
	});
</script>
</html>