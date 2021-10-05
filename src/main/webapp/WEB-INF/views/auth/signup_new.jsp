<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원가입</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/vendor_for_formtag/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/vendor_for_formtag/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/vendor_for_formtag/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/vendor_for_formtag/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/vendor_for_formtag/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/vendor_for_formtag/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/login/css_for_formtag/main.css">
    <link rel="stylesheet" type="text/css" href="/login/css_for_formtag/util.css">
    <!--===============================================================================================-->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">

    <style>
        .limiter {
            background-image: -moz-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(/images/bg02.jpg);
            background-image: -webkit-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(/images/bg02.jpg);
            background-image: -ms-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(/images/bg02.jpg);
            background-image: linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(/images/bg02.jpg);
            background-attachment: fixed;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding-top: 0;}

        span{
            font-family: 'Do Hyeon', sans-serif !important;
        }
    </style>
</head>

<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="/auth/signup" method="post">
					<span class="login100-form-title p-b-26">
						회원가입
					</span>
                <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-account-circle"></i>
					</span>

                <div class="wrap-input100 validate-input" data-validate = "아이디를 넣어주세요!">
                    <input class="input100" type="text" name="username">
                    <span class="focus-input100" data-placeholder="아이디입력"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "이름를 입력해주세요!">
                    <input class="input100" type="text" name="name">
                    <span class="focus-input100" data-placeholder="이름입력"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "이메일형태:우산같이쓸래요@naver.com">
                    <input class="input100" type="email" name="email">
                    <span class="focus-input100" data-placeholder="이메일입력"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="비밀번호를 입력해주세요!">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                    <input class="input100" type="password" name="password">
                    <span class="focus-input100" data-placeholder="패스워드입력"></span>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            회원가입
                        </button>
                    </div>
                </div>

                <div class="text-center p-t-115">
						<span class="txt1">
							로그인하러 가기
						</span>

                    <a class="txt2" href="/auth/signin">
                        로그인
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="/login/vendor_for_formtag/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/login/vendor_for_formtag/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/login/vendor_for_formtag/bootstrap/js/popper.js"></script>
<script src="/login/vendor_for_formtag/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/login/vendor_for_formtag/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="/login/vendor_for_formtag/daterangepicker/moment.min.js"></script>
<script src="/login/vendor_for_formtag/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/login/vendor_for_formtag/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="/login/js_for_formtag/main.js"></script>

</body>

</html>