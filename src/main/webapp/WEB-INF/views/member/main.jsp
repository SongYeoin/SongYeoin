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
/* 초기화 */
/* 	*{ margin: 0; padding: 0;}
	body{font-family: sans-serif;}
	li{list-style: none;}
	a{text-decoration: none;}
	img{border: 0;} */
      
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        main {
            padding: 0;
            display: grid;
            grid-template-columns: 1fr 2fr 1fr;
            grid-template-rows: 500px 300px;
            gap: 0;
            grid-template-areas:
                "section1 section2 section2"
                "section3 section4 section5";
        }
        
        .section {
            margin: 0;
            padding: 0;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .section1 { background-color: #EEEEEE; grid-area: section1; }
        .section2 { background-color: #FFC452; grid-area: section2; }
        .section3 { background-color: #C8C8C8; grid-area: section3; }
        .section4 { background-color: #F76C8D; grid-area: section4; }
        .section5 { background-color: #B5C9FF; grid-area: section5; }


        
      
</style>
</head>
<body>


<!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>
	



	<main>
        <div class="section section1">Section 1</div>
        <div class="section section2">Section 2</div>
        <div class="section section3">Section 3</div>
        <div class="section section4">Section 4</div>
        <div class="section section5">Section 5</div>
    </main>
















<!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%>
	
	
	

</body>
</html>