<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>임시비밀번호발급</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>


    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>
    <style>
        .limiter {
            background-image: -moz-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg02.jpg);
            background-image: -webkit-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg02.jpg);
            background-image: -ms-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg02.jpg);
            background-image: linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg02.jpg);
            background-attachment: fixed;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding-top: 0;}

        span{
            font-family: 'Do Hyeon', sans-serif !important;
        }

        label,h2,button,.notify{
            font-family: 'Do Hyeon', sans-serif !important;
            color:white;
        }

        .input100{
            font-family: 'Nanum Gothic',sans-serif !important;
            color:white;
        }

        .wrap-login100{
            background: #0000001c;
        }
        .notify{
            color:white;
            text-align: center;
            font-size:23px;
        }
        #notification{
            font-family: 'Nanum Gothic',sans-serif !important;
        }

    </style>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" id="name_id_input_form" onsubmit="return false;">
					<span class="login100-form-title p-b-26">
						임시비밀번호 설정
					</span>
                <span class="login100-form-title p-b-25">
						<i class="zmdi zmdi-key"></i>
					</span>

                <p class="notify"><i class="zmdi zmdi-email"></i>회원님의 이메일로 임시패스워드를<br>보내드립니다. </p>
                <div class="wrap-input100 validate-input" data-validate = "이름을 넣어주세요!">
                    <label>이름</label>
                    <input class="input100" type="text" name="user_name" id="user_name" >
                </div>
                <div class="wrap-input100 validate-input" data-validate = "아이디를 입력해주세요!">
                    <label>아이디</label>
                    <input class="input100" type="text" name="user_id" id="user_id">
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" onclick="check_account()">
                            임시비밀번호전송
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

<%--팝업모달창--%>
<div id="popup" class="hide">
    <div class="content">
        <p class="notify" id="notification">
            회원님의 이메일로 임시비밀번호가 발급되어 전송되었습니다.
        </p>
        <div class="d-grid gap-2 mx-auto">
            <button class="btn btn-primary button-color" onclick="closePopup(this.value)" value="close" id="close"><i class="zmdi zmdi-check-circle"></i>확인</button>
        </div>
    </div>
</div>

<div id="dropDownSelect1"></div>
<jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>

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

    function closePopup(state) {
        const popup = document.querySelector('#popup');
        popup.classList.add('hide');

        if(state=="success"){
            //성공적으로 이메일 전송으로 비밀번호의 변경 후 다시 로그인페이지로 리다이렉트
            window.location="/";
       }

    }
</script>
<%--전송된 유저의 아이디와 이름에 대한 인증체크 스크립트--%>
<script src="/login/find_password/check_account.js"></script>
<%--이메일로 임시비밀번호 발급 전송 스크립트--%>
<script src="/login/find_password/send_email.js"></script>
</body>
</html>