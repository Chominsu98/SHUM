<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>이용권종류페이지</title>
    <meta charset="utf-8" />
    <jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>

    <style>

        .form_button li:hover{
            background-color:rgb(0 0 0 / 23%);
        }

        a{
            border-bottom: 0px;
        }

        .wrapper.style1 {
            background-color: #dc3545;
            color: #c8ece9;
        }
        @media screen and (max-width: 736px){
            .icon.major {
                font-size: 2em;
            }
        }

        .icon.major {
            -moz-transform: rotate(-45deg);
            -webkit-transform: rotate(
                    -45deg);
            -ms-transform: rotate(-45deg);
            transform: rotate(
                    -45deg);
            border-radius: 3px;
            border: solid 2px #fff;
            display: inline-block;
            font-size: 3.35em;
            height: calc(3em + 2px);
            line-height: 3em;
            text-align: center;
            width: calc(3em + 2px);
        }

        .instruction{
            font-size: 2.35em;
            color: white;
            position: relative;
            bottom: 54px;
        }
        .instruction:hover{
            color:#00ffcc;
        }

        #popup {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .7);
            z-index: 1;
        }

        #popup.hide {
            display: none;
        }

        #popup.has-filter {
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
        }

        #popup .content {
            padding: 20px;
            background: rgb(255 255 255 / 20%);
            border-radius: 5px;
            color:white;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
        }
    </style>
</head>
<body class="landing is-preload">

<!-- Page Wrapper -->
<div id="page-wrapper">

    <jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

    <!-- Banner -->
    <section id="one" class="wrapper style1 special">
        <div class="inner">
            <header class="major">
                <h2>다양한 이용권 중 회원님의 니즈에 따라서 원하시는 이용권을 구매해보세요</h2>
                <p>일일권:<i style="color:#00ffcc" class="far fa-calendar-alt"></i><br>정기권:<i style="color:#00f0ff" class="far fa-clock"></i><br>지역권:<i style="color:#76ddff;" class="far fa-thumbs-up"></i></p>
                <a onclick="showPopup(true)" href="#"><i class="instruction far fa-question-circle"></i></a>
            </header>
            <ul class="icons major ticket-choices">
                <li >
                    <a href="/charge/payform/day">
									<span class="icon far fa-calendar-alt major style1" >
										<span class="label">Lorem</span>
									</span>
                        <h3>일일권</h3>
                    </a>
                </li>
                <li>
                    <a href="/charge/payform/subscribe">
									<span class="icon far fa-clock major style2">
										<span class="label">Ipsum</span>
									</span>
                        <h3>정기권</h3>
                    </a>
                </li>
                <li>
                    <a href="/charge/payform/areaEdition">
									<span class="icon solid far fa-thumbs-up major style3">
										<span class="label">Dolor</span>
									</span>
                        <h3>지역권</h3>
                    </a>
                </li>
            </ul>
        </div>
    </section>

    <div id="popup" class="hide">
        <div class="content">
            <p>
                <i style="color:#00ffcc" class="far fa-calendar-alt"></i>일일권은 하루동안 한 번 빌릴경우 횟수에 상관없이 최대한 1시간 쓸 수 있는 1시간권,2시간권으로 일반적으로 사용하실 고객들에게 추천합니다.<br><br>
                <i style="color:#00f0ff" class="far fa-clock"></i>정기권은 7일,30일,6개월 단위로 비교적 긴 기간동안 사용할 고객들에게 할인된 가격으로 추천드립니다.<br><br>
                <i style="color:#76ddff;" class="far fa-thumbs-up"></i>지역권은 지역광고가 붙은 우산들만을 사용할 수 있는 이용권으로 일반 일일권에 비해 더욱 저렴한 가격으로 사용할 고객들에게 추천드립니다.
            </p>
            <button class="button primary icon far fa-times-circle" onclick="closePopup()">닫기</button>
        </div>
    </div>


    <jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>

</div>

<!-- Scripts -->
<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>
<script>
    function showPopup(hasFilter) {
        const popup = document.querySelector('#popup');

        if (hasFilter) {
            popup.classList.add('has-filter');
        } else {
            popup.classList.remove('has-filter');
        }

        popup.classList.remove('hide');
    }

    function closePopup() {
        const popup = document.querySelector('#popup');
        popup.classList.add('hide');
    }
</script>

</body>
</html>