<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>계정정보</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>


    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>
    <style>
        .limiter {
            background-image: -moz-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg01.jpg);
            background-image: -webkit-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg01.jpg);
            background-image: -ms-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg01.jpg);
            background-image: linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(../images/bg01.jpg);
            background-attachment: fixed;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding-top: 0;}

        span{
            font-family: 'Do Hyeon', sans-serif !important;
        }

        label,h2,button{
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
        p {
            font-family: 'Nanum Gothic',sans-serif !important;
            font-size: 22px;
            line-height: 1.7;
            color: #ffffff;
            margin: 13px;
        }
        .notify{
            color:white;
            text-align: center;
            font-size:23px;
        }

    </style>

</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" id="profileUpdate" name="profileUpdate">
					<span class="login100-form-title p-b-26">
						마이페이지
					</span>
                <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-check-circle"></i>
					</span>

                <div class="wrap-input100 validate-input" data-validate = "이름을 넣어주세요!">
                    <label>이름</label>
                    <input class="input100" type="text" name="name" value="${user.name}">
                </div>
                <div class="wrap-input100 validate-input" data-validate = "아이디를 입력해주세요!">
                    <label>아이디</label>
                    <input class="input100" type="text" name="username" value="${user.username}">
                </div>
                <div class="wrap-input100 validate-input" data-validate = "이메일형태:우산같이쓸래요@naver.com">
                    <label>이메일</label>
                    <input class="input100" type="text" name="email" value="${user.email}">

                </div>

                <!--비밀번호 변경 페이지-->
                <div class="btn-group" role="group" aria-label="Basic example">
                    <h2>비밀번호 재설정➡️</h2>
                    <button type="button" class="btn btn-primary" onclick="showPopup('#popup_check_verifynum',true)">비밀번호변경</button>
                </div>

                <div class="wrap-input100">
                    <label>전화번호(필수❌)</label>
                    <input class="input100" type="text" name="phone" value="${user.phone}">
                </div>
                <div class="wrap-input100 validate-input">
                    <label>대여횟수</label>
                    <c:set var="count" value="${user.times}번" />
                    <input class="input100" type="text" name="user-times" value="${count}" readonly>
                </div>
                <div class="wrap-input100 validate-input">
                    <label>등급</label>
                    <input class="input100" type="text" name="user-level" value="🥈실버등급" readonly>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" onclick="update()">
                            회원정보수정
                        </button>
                    </div>
                </div>

                <div class="text-center p-t-115">
						<span class="txt1">
							로그아웃하러 가기
						</span>

                    <a class="txt2" href="/logout">
                        로그아웃
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<%--팝업모달창-정보수정이 완료되었을때 알림창--%>
<div id="popup" class="hide" style="z-index: 9999;">
    <div class="content">
        <p id="notification_message">
            ✔회원정보가 수정되었습니다
        </p>
        <div class="d-grid gap-2 mx-auto">
            <button value="true" class="btn btn-primary" onclick="closePopup('#popup',this.value)" id="close_button"><i class="zmdi zmdi-check-circle"></i>닫기</button>
        </div>

    </div>
</div>

<%--팝업모달창-회원의 인증번호와 이메일 인증번호를 체크하고 이메일을 전송--%>
<div id="popup_check_verifynum" class="hide">
    <div class="content">
        <form class="login100-form validate-form" id="Send_email">
					<span class="login100-form-title p-b-26">
						인증번호입력
					</span>
            <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-lock"></i>
            </span>
            <p class="notify">회원님의 이메일로 도착한 이메일 속 인증번호를 입력해주세요 </p>
            <div class="wrap-input100 validate-input" data-validate = "인증번호를 입력해주세요">
                <label>인증번호</label>
                <input class="input100" type="text" name="verify_number" id="verify_number">

            </div>
            <div class="d-grid gap-2 mx-auto">
                <button type="submit" class="btn btn-primary" onclick="check_verifynum()" ><i class="zmdi zmdi-check-circle"></i>확인</button>
            </div>
        </form>


    </div>
</div>

<%--팝업모달창-새로운 비번 저장--%>
<div id="popup_set_new_password" class="hide">
    <div class="content">
        <form class="login100-form validate-form" id="new_password_change">
					<span class="login100-form-title p-b-26">
						비밀번호변경
					</span>
            <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-lock-open"></i>
            </span>
            <p class="notify">새로운 비밀번호로 변경해주세요 </p>
            <div class="wrap-input100 validate-input" data-validate = "현재비밀번호를 입력해주세요">
                <input class="input100" type="text" name="old_password" id="old_password">
                <span class="focus-input100" data-placeholder="현재비밀번호"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate = "새로운 비밀번호 입력해주세요">
                <input class="input100" type="text" name="new_password" id="new_password">
                <span class="focus-input100" data-placeholder="새비밀번호"></span>
            </div>
            <div class="wrap-input100 validate-input" data-validate = "비밀번호를 확인해주세요">
                <input class="input100" type="text" name="new_password_check" id="new_password_check" onkeyup="check_pw(this)">
                <span class="focus-input100" data-placeholder="새비밀번호확인"></span>
            </div>
            <p id="alert_password"></p>
            <div class="d-grid gap-2 mx-auto">
                <button type=button class="btn btn-primary" onclick="change_pw()" ><i class="zmdi zmdi-check-circle"></i>확인</button>
            </div>
        </form>

    </div>
</div>

<div id="dropDownSelect1"></div>

<jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>

<script>
    function showPopup(id,hasFilter) {
        const popup = document.querySelector(id);

        if (hasFilter) {
            popup.classList.add('has-filter');
        } else {
            popup.classList.remove('has-filter');
        }

        popup.classList.remove('hide');
        if(id=="#popup_check_verifynum"){
            send_email();//인증번호모달을 열면서 이메일을 전송시킨다
        }
    }

    function closePopup(id,state) {
        const popup = document.querySelector(id);
        popup.classList.add('hide');

        if(state=="new_password"){
            showPopup("#popup_set_new_password",true);
        }

        else if(JSON.parse(state)==true){
            window.location="/"//이용권큐알페이지로 다시 이동

        }
        else{
            return;//그냥 페이지이동없이 다시시도 하도록 함
        }

    }
</script>


<%--ajax로 수정된 회원정보를 보내는 용도--%>
<script src="/main_page/assets/myAccountPage/update_account.js"></script>


<%--ajax로 이메일을 보내는 용도--%>
<script src="/main_page/assets/myAccountPage/send_email.js"></script>

<%--ajax로 인증번호 보내고 체크하는 용도--%>
<script src="/main_page/assets/myAccountPage/check_verifynum.js"></script>
<%--ajax로 비밀번호 변경--%>
<script src="/main_page/assets/myAccountPage/change_pw.js"></script>

<script src="/main_page/assets/myAccountPage/live_check_pw.js"></script>

</body>
</html>