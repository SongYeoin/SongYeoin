<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <style>
        /* 캘린더 컨테이너의 크기 조정 */
        #calendar {
            width: 80%; /* 너비를 페이지 너비의 80%로 설정 */
            height: 600px; /* 높이를 600px로 설정 */
            margin: 0 auto; /* 캘린더를 가운데 정렬 */
        }
        
        .journal_navi_wrap {
            margin-top: 20px;
        }

        .journal_navi_wrap ul {
            list-style: none;
            padding: 0;
        }

        .journal_navi_wrap ul li {
            display: inline;
            margin-right: 10px;
        }

        .journal_navi_wrap ul li a {
            text-decoration: none;
            color: #007bff;
        }

        .journal_navi_wrap ul li a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                initialDate: '2024-08-07',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                events: [
                    {
                        title: 'All Day Event',
                        start: '2024-08-01'
                    },
                    {
                        title: 'Long Event',
                        start: '2024-08-07',
                        end: '2024-08-10'
                    },
                    {
                        groupId: '999',
                        title: 'Repeating Event',
                        start: '2024-08-09T16:00:00'
                    },
                    {
                        groupId: '999',
                        title: 'Repeating Event',
                        start: '2024-08-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: '2024-08-11',
                        end: '2024-08-13'
                    },
                    {
                        title: 'Meeting',
                        start: '2024-08-12T10:30:00',
                        end: '2024-08-12T12:30:00'
                    },
                    {
                        title: 'Lunch',
                        start: '2024-08-12T12:00:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2024-08-12T14:30:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2024-08-13T07:00:00'
                    },
                    {
                        title: 'Click for Google',
                        url: 'https://google.com/',
                        start: '2024-08-28'
                    }
                ]
            });
            calendar.render();
        });
    </script>
</head>
<body>
  
    <%-- <!-- 메뉴바 연결 -->
    <%@ include file="../common/header.jsp"%>
    
    <!-- 사이드바 연결 -->    
    <%@ include file="aside.jsp"%> --%>
  
    <div id='calendar'></div>
    
    <div class="journal_navi_wrap">
        <ul>
            <li><a class="journal_list_01" href="/journal/journalEnroll">교육일지 등록</a></li>
            <li><a class="journal_list_02" href="/journal/journalList">교육일지 목록</a></li>
        </ul>
    </div>
    
    <%-- <!-- 푸터 연결 -->
    <%@ include file="../common/footer.jsp"%> --%>
</body>
</html>
