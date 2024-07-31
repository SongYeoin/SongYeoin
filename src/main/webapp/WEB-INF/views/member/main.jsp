<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>송파여성인력개발센터</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




<style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        

        main {
            padding: 0;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: 500px 300px;
            gap: 0;
            grid-template-areas:
                "section1 section2 section2"
                "section3 section4 section5";
                
            flex: 1;
            height: calc(100vh - 100px); /* Adjust based on header and footer height */
			position: relative; /* 헤더와 겹치지 않도록 설정 */
        }

        .section {
            margin: 0;
            padding: 0;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            padding: 20px;
		    background-color: gray; /* Default background color */
		    border: 1px solid #ddd; /* Optional border for better visibility */
		    overflow: hidden; /* 내용이 섹션을 넘치지 않도록 설정 */
            
        }

        .section1 { background-color: #EEEEEE; grid-area: section1; }
        .section2 { background-color: #FFC452; grid-area: section2; }
        .section3 { background-color: #C8C8C8; grid-area: section3; }
        .section4 { background-color: #F76C8D; grid-area: section4; }
        .section5 { background-color: #B5C9FF; grid-area: section5; }
        
        
        /* 메뉴 제목 스타일 */
		.menu-title {
		    font-size: 1.5em;
		    font-weight: bold;
		    font-size: 2em;
		    color: black;
		}
		
		/* 소메뉴 스타일 */
		.submenu {
		    display: none;
		    position: absolute;
		    top: 0; /* 섹션의 상단에 위치 */
		    left: 0; /* 섹션의 왼쪽에 위치 */
		    width: 100%; /* 섹션의 전체 너비 */
		    height: 100%; /* 섹션의 전체 높이 */
		    background-color: rgba(0, 0, 0, 0.8); /* 반투명 배경 */
		    color: #fff;
		    padding: 20px; /* 여백 설정 */
		    box-sizing: border-box; /* 박스 모델 설정 */
		    z-index: 10; /* 다른 요소들보다 위에 표시되도록 설정 */
		    flex-direction: column; /* 세로 정렬 */
		    justify-content: flex-start; /* 왼쪽 정렬 */
		    align-items: flex-start; /* 왼쪽 정렬 */
		    text-align: right; /* 소메뉴 내용의 텍스트 정렬 */
		}
				
		/* 소메뉴 글자 스타일 */
		.submenu p {
		    margin: 20px 0; /* 위아래 여백 설정 */
		    font-size: 1.25em; /* 폰트 크기 증가 */
		    font-weight: bold;
		    color: white;
		}
		
		/* 마우스 오버 시 소메뉴 표시 */
		.section:hover .submenu {
		    display: block;
		}



        
      
</style>
</head>
<body>


<!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>
	



	<main>
		<div class="section section1">
			<div class="menu-title">Attendance <br>출석</div>
			<div class="submenu">
				<p>출석부 조회</p>
				<p>출석하기</p>
			</div>
		</div>
		<div class="section section2">
			<div class="menu-title">Daily Log Submission <br>교육일지</div>
			<div class="submenu">
				<p>교육일지 제출</p>
				<p>교육일지 조회</p>
			</div>
		</div>
		<div class="section section3">
			<div class="menu-title">Room Booking <br>동아리 신청</div>
			<div class="submenu">
				<p>동아리실 신청</p>
				<p>동아리일지 제출</p>
			</div>
		</div>
		<div class="section section4">
			<div class="menu-title">Anonymous Board <br>익명게시판</div>
			<div class="submenu">
				<p>익명게시판</p>
			</div>
		</div>
		<div class="section section5">
			<div class="menu-title">Notices <br>공지사항</div>
			<div class="submenu">
				<p>공지사항</p>
			</div>
		</div>
	</main>



<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>
	

</body>
</html>