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

.memberList-wrapper {
   margin: 20px auto;
   padding: 20px;
   /* background-color: #f9fafc; */
   /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
   max-width: 1200px;
   border-radius: 10px;
}


table {
   width: 100%;
   border-collapse: collapse;
   box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
   text-align: center;
}

table th, table td {
   padding: 10px;
   text-align: center;
   border-bottom: 1px solid #ddd;
   border-right: 1px solid #ddd;
}

table th {
   background-color: #f2f2f2;
}

tr {
    transition: background-color 0.3s ease, cursor 0.3s ease;
}

tr:hover {
    background-color: #f5f5f5; /* 마우스를 올렸을 때 배경색 */
    cursor: pointer; /* 마우스 커서 */
}

.approval-status {
   cursor: pointer;
   transition: background-color 0.3s ease;
}

.approval-status:hover {
   background-color: #e0e0e0;
}


.search_wrap {
   margin-top: 20px;
   text-align: center; 
}

.search_input input[type=text], .search_input button {
   margin: 0 5px;
   padding: 5px 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
   font-size: 14px;
}

.search_input button {
   background-color: #007bff;
   color: #fff;
   border: none;
   cursor: pointer;
}

.search_input button:hover {
   background-color: #0056b3;
}

.pageMaker_wrap{
   text-align: center;
    margin-top: 30px;
    margin-bottom: 40px;
}
.pageMaker_wrap a{
   color : black;
}
.pageMaker{
    list-style: none;
    display: inline-block;
}   
.pageMaker_btn {
    float: left;
    width: 40px;
    height: 40px;
    line-height: 40px;
    margin-left: 20px;
}
.next, .prev {
    border: 1px solid #ccc;
    padding: 0 10px;
}
.next a, .prev a {
    color: #ccc;
}
.active{                     /* 현재 페이지 버튼 */
   border : 2px solid black;
   font-weight:400;
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
         <div class="memberList-wrapper">
            <h2 align="center">회원 목록</h2>
            <br>
            <table>
               <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>전화번호</th>
                  <th>가입일</th>
                  <th>승인</th>
               </tr>
               <c:forEach items="${ memberList }" var="member">
                  <tr onclick="showMemberDetail(event, ${member.memberNo})">
                     <td>${ member.memberNo }</td>
                     <td>${ member.memberName }</td>
                     <td>${ member.memberPhone }</td>
                     <td>${ member.memberEnrollDate }</td>
                     <td class="approval-status" onclick="changeApprovalStatus(${member.memberNo}); event.stopPropagation();">
                        <c:choose>
                           <c:when test="${member.memberCheckStatus == 'W'}">대기</c:when>
                           <c:when test="${member.memberCheckStatus == 'Y'}">승인</c:when>
                           <c:when test="${member.memberCheckStatus == 'N'}">미승인</c:when>
                        </c:choose>
                     </td>
                  </tr>

               </c:forEach>
            </table>
            <!-- 검색 영역 -->
            <div class="search_wrap">
               <form id="searchForm" action="/admin/member/list" method="get">
                  <div class="search_input">
                     <input type="text" name="keyword"
                        value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                     <input type="hidden" name="pageNum"
                        value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                     <input type="hidden" name="amount"
                        value='${pageMaker.cri.amount}'>
                     <button class='btn search_btn'>검 색</button>
                  </div>
               </form>
            </div>

            <!-- 페이지 이동 인터페이스 영역 -->
            <div class="pageMaker_wrap">

               <ul class="pageMaker">

                  <!-- 이전 버튼 -->
                  <c:if test="${pageMaker.prev}">
                     <li class="pageMaker_btn prev"><a href="${pageMaker.pageStart - 1}">이전</a></li>
                  </c:if>

                  <!-- 페이지 번호 -->
                  <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
                     <li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active" : ""}"><a href="${num}">${num}</a>
                     </li>
                  </c:forEach>

                  <!-- 다음 버튼 -->
                  <c:if test="${pageMaker.next}">
                     <li class="pageMaker_btn next"><a href="${pageMaker.pageEnd + 1 }">다음</a></li>
                  </c:if>

               </ul>

            </div>
            <form id="moveForm" action="/admin/member/list" method="get">
               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
               <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
               <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
            </form>
         </div>



      </div>
   </main>

   <!-- 푸터 연결 -->
   <%@ include file="../../common/footer.jsp"%>

</body>

<script>
let moveForm = $('#moveForm');
//페이지 이동 버튼
$(".pageMaker_btn a").on("click", function(e){
    e.preventDefault();
    let pageNum = $(this).attr("href");
    moveForm.find("input[name='pageNum']").val(pageNum);
    moveForm.submit();
});

function changeApprovalStatus(memberNo) {
   event.stopPropagation();
   
   if (window.confirm("승인 하시겠습니까?")) {
       $.ajax({
               url: "${ pageContext.servletContext.contextPath }/admin/status-y",
               type: "post",
               data: {memberNo: memberNo},
               success: function(data) {
                   if (data.trim() === 'success') {
                       alert("승인되었습니다.");
                       location.reload();
                   } else {
                       alert("승인 처리를 실패했습니다.");
                   }
               },
               error: function(error) {
                   alert("승인 처리 중 오류가 발생하였습니다.");
               }
           });
     } else {
        $.ajax({
               url: "${ pageContext.servletContext.contextPath }/admin/status-n",
               type: "post",
               data: {memberNo: memberNo},
               success: function(data) {
                   if (data.trim() === 'success') {
                       alert("미승인되었습니다.");
                       location.reload();
                   } else {
                       alert("미승인 처리를 실패했습니다.");
                   }
               },
               error: function(error) {
                   alert("미승인 처리 중 오류가 발생하였습니다.");
               }
           });
       
     }
}

function showMemberDetail(event, memberNo) {
   if (!$(event.target).hasClass('approval-status')) {
    window.location.href = '${pageContext.servletContext.contextPath}/admin/member/detail?memberNo=' + memberNo;
    }
}

</script>
</html>