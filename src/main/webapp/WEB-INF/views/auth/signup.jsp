<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원가입</title>
    <jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>

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

<jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>

</body>

</html>