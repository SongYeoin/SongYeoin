<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육일지 목록</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .filter-container {
        margin-bottom: 20px;
    }
</style>
<script>
    function filterData() {
        var year = document.getElementById('year').value;
        var month = document.getElementById('month').value;
        var table = document.getElementById('journalTable');
        var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName('td');
            var date = cells[2].textContent.split('-');
            var rowYear = date[0];
            var rowMonth = date[1];

            if ((year === '' || rowYear === year) && (month === '' || rowMonth === month)) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }
</script>
</head>
<body>

	<%-- <!-- 메뉴바 연결 -->
	<%@ include file="../common/header.jsp"%>
	 --%>
	<%-- <!-- 사이드바 연결 -->	
	<%@ include file="aside.jsp"%> --%>
	
    <div class="journal_content_wrap">
        <div class="journal_content_subject">
            <span>교육일지 목록</span>
        </div>
        
        <!-- 관리자인 경우에만 수강생 필터 버튼이 보여짐 -->
			<c:if test="${ sessionScope.loginMember.role eq 'ROLE_ADMIN' }">
				<label for="student">수강생:</label>
                <select id="student" onchange="filterData()">
                    <option value="">전체</option>
                    <!-- 수강생 목록을 여기에 추가 -->
                    <option value="Student1">수강생 1</option>
                    <option value="Student2">수강생 2</option>
                    <option value="Student3">수강생 3</option>
                </select>
			</c:if>
        
        <div class="filter-container">
            <label for="year">년도:</label>
            <select id="year" onchange="filterData()">
                <option value="">전체</option>
                <option value="2024">2024</option>
                <option value="2023">2023</option>
                <!-- 추가적인 년도는 여기에 추가할 수 있습니다. -->
            </select>
            
            <label for="month">월:</label>
            <select id="month" onchange="filterData()">
                <option value="">전체</option>
                <option value="01">1월</option>
                <option value="02">2월</option>
                <option value="03">3월</option>
                <option value="04">4월</option>
                <option value="05">5월</option>
                <option value="06">6월</option>
                <option value="07">7월</option>
                <option value="08">8월</option>
                <option value="09">9월</option>
                <option value="10">10월</option>
                <option value="11">11월</option>
                <option value="12">12월</option>
            </select>
        </div>

        <table id="journalTable">
            <thead>
                <tr>
                    <th>교육일지 번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>교육일지 제목 1</td>
                    <td>2024-08-01</td>
                </tr>
                <tr>
                    <td>002</td>
                    <td>교육일지 제목 2</td>
                    <td>2024-07-15</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td>교육일지 제목 3</td>
                    <td>2023-12-10</td>
                </tr>
                <!-- 추가적인 행은 여기서 계속 추가하시면 됩니다. -->
            </tbody>
        </table>
    </div>
    
    
    <%-- <!-- 푸터 연결 -->
	<%@ include file="../common/footer.jsp"%> --%>
</body>
</html>
