<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- Header -->
<style>


    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: relative;
        min-width: 160px;
        overflow: auto;
    }

    .dropdown-content a {
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        border-bottom: inherit;
    }

    .dropdown a:hover {background-color: #f1f1f1}

    .show {display:block;}
</style>
<header id="header">
    <h1><a href="/">SHUM💧</a></h1>
    <nav id="nav">
        <ul>
            <li class="special">
                <a href="#menu" class="menuToggle"><span>메뉴</span></a>
                <div id="menu">
                    <ul>
                        <li><a href="/map/mapPage">내 주위우산</a></li>
                        <li><a href="/charge/payway">이용권 구매</a></li>
                        <li><a href="elements.html">이용안내</a></li>
                        <li><a href="#">오늘의 날씨</a></li>
                        <li>
                            <a onclick="myFunction()" class="dropbtn">회원정보⬇️</a>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="/main/myPageAccount">계정정보</a>
                                <a href="/main/myPage">이용권정보</a>
                            </div>
                        </li>

                        <li><a href="/logout">로그아웃</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
</header>
