<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>☔Shum_우산같이쓸래요☔</title>
    <link rel="stylesheet" href="/login/background/css/main.css" />
    <link rel="icon" type="image/png" href="/login/images/favicon.ico"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>

    <style>
    h1,h5,a,p{
        font-family: 'Do Hyeon', sans-serif !important;
        color:white;
    }

    #main_box{
        padding: inherit;
        margin:10px;
        background-color: rgba(0,0,0,0.3);
        display: block;
    }

    /*체크박스 관련 css*/
    .checkbox-wrap {
    display: block;
    position: relative;
    padding-left: 30px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    }
    .checkmark:after {
    content: "\f0c8";
    font-family: "FontAwesome";
    position: absolute;
    color: rgba(255, 255, 255, 0.1);
    font-size: 20px;
    margin-top: -4px;
    -webkit-transition: 0.3s;
    -o-transition: 0.3s;
    transition: 0.3s;
    }

    /* Hide the browser's default checkbox */
    .checkbox-wrap input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
    }

    /* Create a custom checkbox */
    .checkmark {
    position: absolute;
    top: 0;
    left: 0;
    }
    .checkbox-wrap input:checked ~ .checkmark:after {
    display: block;
    content: "\f14a";
    font-family: "FontAwesome";
    color: rgba(0, 0, 0, 0.2); }

    /* Style the checkmark/indicator */
    .checkbox-primary {
    color: #fbceb5; }
    .checkbox-primary input:checked ~ .checkmark:after {
    color: #fbceb5;
    }

    .px-2{
    padding-right:2.5rem!important;
    }

    img{
        width: 108%;
        height: 235px;
        overflow: hidden;
        position: relative;
        padding: -101px;
        left: -9px;
        top: 60px;

    }

    @media screen and (max-width: 480px){
        img{
            width: 96%;
            height: 222px;
            overflow: hidden;
            position: relative;
            top: 104px;
            left: -1px;

        }
    }
    @media screen and (max-width: 480px){
        h2{
            display: none;
        }
    }
    .logo{
        font-family: 'Permanent Marker', cursive;
        font-size:64px;
        color:white;
    }
    .notify{
        color:white;
        text-align: center;
        font-size:23px;
    }
    .notification{
        font-family: 'Nanum Gothic',sans-serif !important;
        font-size: 22px;
        line-height: 1.7;
        color: #ffffff;
        margin: 13px;
    }
    .button-color{
        background-color:#ca0707;
        border-color:transparent;
    }

    </style>
    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>
</head>

<body class="is-preload">

        <div class="limiter">
            <div class="container-login100" style="margin-top:50px;">
                <header id="header" style="padding-top: 0px;">
                    <img src="/images/로고디자인4.PNG">
                    <h2 class="logo" >Don't waste it<br>Just rent it! </h2>
                </header>
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="/auth/signin" method="POST">
                                    <span class="login100-form-title p-b-5">
                                        <h1>로그인</h1>
                                    </span>
                        <span class="login100-form-title p-b-25">
                                        <i class="zmdi zmdi-lock-outline"></i>
                        </span>

                        <p class="notify">혹시 지금 우산이 없으신가요❓<br>사지말고 빌려서 쓰세요 </p>
                        <div class="wrap-input100 validate-input" data-validate = "아이디를 입력해주세요">
                            <input class="input100" type="text" name="username" id="id">
                            <span class="focus-input100" data-placeholder="유저네임"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="비밀번호를 입력해주세요">
                                        <span class="btn-show-pass">
                                            <i class="zmdi zmdi-eye"></i>
                                        </span>
                            <input class="input100" type="password" name="password" id="password">
                            <span class="focus-input100" data-placeholder="비밀번호"></span>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" >
                                    SignIn
                                </button>
                            </div>
                        </div>

                        <div class="form-group d-md-flex">
                            <div class="w-50">
                                <label class="checkbox-wrap checkbox-primary">🔑자동로그인
                                    <input type="checkbox" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="/auth/find_password" style="color: #fff">비밀번호찾기</a>
                            </div>
                        </div>
                        <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                        <div class="social d-flex text-center" style="position: relative; right:-20px;">
                            <a href="./Main_UI_2/(non_rent)form_gui.html" class="px-2 py-2 mr-md-1 rounded" style="color: white;"><span class="ion-logo-facebook mr-2"></span> 비회원서비스</a>
                            <a href="./Main_UI_2/map_page.html" class="px-2 py-2 ml-md-1 rounded" style="color: white;"><span class="ion-logo-twitter mr-2"></span>지도보기</a>
                        </div>
                        <div class="text-center p-t-115">
                            <span class="txt1">
                                아직 회원이 아니신가요?
                            </span>

                            <a class="txt2" href="/auth/signup">
                                회원가입하기
                            </a>
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <%--팝업모달창--%>
            <div id="popup" class="hide">
                <div class="content">
                    <p class="notification">
                        ❌아이디 또는 비밀번호가 틀립니다.
                    </p>
                    <div class="d-grid gap-2 mx-auto">
                        <button class="btn btn-primary button-color" onclick="closePopup()" ><i class="zmdi zmdi-check-circle"></i>확인</button>
                    </div>
                </div>
            </div>

        <!-- Footer -->
        <footer id="footer" style="margin-top: 10px;">
            <ul class="icons">
                <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                <li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
                <li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
            </ul>
            <ul class="copyright" style="color:black">
                <li>&copy; 우산같이쓸래요?</li><li>Credits: <a href="https://www.instagram.com/sharingumbrella/">Developed by 우산같이쓸래요?</a></li>
            </ul>
        </footer>

        <script src="/login/background/js/main.js"></script>

        <jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>

        <script>

            var error_value='<c:out value="${error}"/>';
            if (JSON.parse(error_value)==true){
                showPopup(true);
            }

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