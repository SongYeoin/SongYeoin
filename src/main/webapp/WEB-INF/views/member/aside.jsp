<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
		.sidebar {
            padding-top: 40px;
            width: 250px;
            background-color: #F2F2F2;
            color: #333333;
            height: calc(100vh - 70px); 
            position: fixed;
            top: 70px;
            overflow-y: auto;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }

        .menu-item {
            padding: 13px 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
            position: relative;
            flex-direction: column;
            font-size: 12px;
        }

        .menu-item:not(:first-child) {
            border-top: 1px solid black;
        }

        .menu-title {
            display: flex;
            justify-content: start; 
            align-items: center;
            width: 100%;
            flex-direction: row;
        }

        .menu-item i {
            margin-right: 10px;
        }

        .submenu {
            display: none;
            padding-top: 10px;
            padding-left: 30px;
            width: 100%; 
        }

        .submenu-item {
            padding: 10px 0;
            display: flex;
            align-items: center;
            width: 100%;
        }

        .submenu-item i {
            margin-right: 10px;
        }

        .menu-item.active .submenu {
            display: block;
        }

        .menu-item:hover, .submenu-item:hover {
            background-color: #ECECEC;
        }
        
        .arrow {
            margin-left: auto;
        }
        
</style>
</head>
<body>

	<div class="sidebar">
        <div class="menu-item">
            <div class="menu-title">
                <div>
                    <i class="fas fa-user"></i>
                    <span>회원 관리</span>
                </div>
                <i class="fas fa-chevron-down arrow"></i>
            </div>
            <div class="submenu">
                <div class="submenu-item"><i class="fas fa-users"></i>수강생 관리</div>
                <div class="submenu-item"><i class="fas fa-user-tie"></i>직원 관리</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu-title">
                <i class="fas fa-chalkboard-teacher"></i>
                <span>반 관리</span>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu-title">
                <i class="fas fa-heart"></i>
                <span>마음의 소리</span>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu-title">
                <i class="fas fa-home"></i>
                <span>반별 홈</span>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu-title">
                <i class="fas fa-cog"></i>
                <span>Settings</span>
            </div>
        </div>
    </div>
    
    
    <script>
        document.querySelectorAll('.menu-title').forEach(item => {
            item.addEventListener('click', event => {
                const menuItem = item.parentElement;
                menuItem.classList.toggle('active');
            });
        });
    </script>

</body>
</html>