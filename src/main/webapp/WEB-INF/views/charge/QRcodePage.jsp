<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Duration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>이용권큐알페이지</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

    <script type="text/javascript" src="/main_page/assets/qrcode/jquery.min.js"></script>
    <script type="text/javascript" src="/main_page/assets/qrcode/qrcode.js"></script>

    <style>
        #main > header p {
            color: inherit;
            letter-spacing: 0em;
            text-transform: uppercase;
            top: 0;
        }

        h5 {
            font-size: 1.4em;
            line-height: 0.5em;
        }


        input[type="submit"].primary, input[type="reset"].primary, input[type="button"].primary, button.primary, .button.primary {
            background-color: #212529;
            box-shadow: none !important;
            color: #ffffff !important;
        }


        .head-background{
            background-color: #ff0000ad !important;
            font-family: 'Do Hyeon', sans-serif !important;
        }

        table th,td{
            text-align: center;
            font-size: 1.4em;
            font-family: 'Do Hyeon', sans-serif !important;
            color:white;
        }
        .table>:not(caption)>*>*{
            padding:1.4rem 0.5rem;
        }
        table tr{
            cursor:pointer;
        }


        .show_voucher{
            background: #dc3545cc;
        }

        .rental_info td{
            color:#2E3842;
        }

        .show_when_not_rent{
            color:#2E3842;
            text-align: justify;
        }

        .head-background-rental-info{
            background-color: #21b2a682;
        }
        .notification{
            font-family: 'Nanum Gothic',sans-serif !important;
            font-size: 22px;
            line-height: 1.7;
            color: #ffffff;
            margin: 13px;
        }
        .button-color{
            background-color: #0d6efd;
            border-color: transparent;
            font-family: 'Do Hyeon';
            box-shadow: inset 0 0 0 0px #fff;

        }
        canvas{
            width:100%;
        }

    </style>
</head>
<body class="is-preload">

<!-- Page Wrapper -->
<div id="page-wrapper">

    <jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

    <!-- Main -->
    <article id="main">
        <header>
            <c:choose>
                <c:when test="${user.state==true}">
                    <h2>📢반납하기</h2>
                </c:when>
                <c:otherwise>
                    <h2>📢대여하기</h2>
                </c:otherwise>
            </c:choose>
            <p>해당 큐알코드를 키오스크 앞에서 스캔해주세요</p>


        </header>

        <!--일일권일때-->
        <section class="wrapper style5">
            <div class="inner">
                <c:choose>
                    <c:when test="${user.haveTicket==true}">
                        <c:choose>
                            <c:when test="${user.state==true}">
                                <h4>✔반납하기</h4>
                            </c:when>
                            <c:otherwise>
                                <h4>✔대여하기</h4>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <h4>❌미보유</h4>
                    </c:otherwise>
                </c:choose>

                <div class="box alt">
                    <div class="row gtr-50 gtr-uniform" style="margin-right: 0.05em;">
                        <div class="col-12">
                            <c:choose>
                                <c:when test="${user.haveTicket == true}">
                                    <span class="image fit" id="qrcode"></span>
                                </c:when>
                                <c:otherwise>
                                    <table class="table table-hover">
                                        <thead class="head-background-rental-info">
                                        <tr >
                                            <th colspan=2 scope="col" class="show_when_not_rent">📢${user.name}님께서는 아직<br>이용권을 구매하시지 않으셨어요..😢</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>
                </div>
            </div>
        </section>



        <!--결제정보 -->
        <section id="one" class="wrapper style1 special">
            <div class="inner">
                <h4 class="show_voucher">이용권정보</h4>
                <c:choose>
                    <c:when test="${user.haveTicket == true}">
                        <c:choose>
                            <c:when test="${voucher.voucherStartDate != null}">
                                <c:set var="returnTime" value="${voucher.voucherStartDate}"/>
                                <%
                                    LocalDateTime returnTime = (LocalDateTime)pageContext.getAttribute("returnTime");

                                    returnTime = returnTime.plusDays(1);
                                    System.out.println(returnTime);

                                    long hour, min, sec;

                                    Duration duration = Duration.between(LocalDateTime.now(), returnTime);
                                    sec = duration.getSeconds();

                                    min = sec / 60;
                                    sec = sec % 60;

                                    hour = min / 60;
                                    min = min % 60;
                                %>
                                <table class="table table-hover">
                                    <thead class="head-background">

                                    <tr >
                                        <th colspan=2 scope="col">예약번호:${voucher.reservationCode}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="moveto_ticket">
                                        <th scope="row">🌧이용권명:</th>
                                        <td>📆${voucher.ticketType}</td>

                                    </tr>
                                    <tr class="moveto_ticket">
                                        <th scope="row">🌧사용가능시간:</th>
                                        <td>🕒24시간</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">📢남은시간</th>
                                        <td>🕒<%=hour%>시간 <%=min%>분</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">📢이용자명</th>
                                        <td>😀${user.name}</td>

                                    </tr>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-hover">
                                    <thead class="head-background">

                                    <tr >
                                        <th colspan=2 scope="col">예약번호:${voucher.reservationCode}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="moveto_ticket">
                                        <th scope="row">🌧이용권명:</th>
                                        <td>📆${voucher.ticketType}</td>

                                    </tr>
                                    <tr class="moveto_ticket">
                                        <th scope="row">🌧사용가능시간:</th>
                                        <td>🕒24시간</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">📢남은시간</th>
                                        <td>🕒사용 전</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">📢이용자명</th>
                                        <td>😀${user.name}</td>

                                    </tr>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <h2>구매한 이용권이 없습니다.</h2>
                        <a href="/charge/payform" class="button fit ">구매하러 가기</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </article>

    <jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
</div>

<%--팝업모달창--%>
<div id="popup" class="hide">
    <div class="content">
        <p class="notification" id="notification">
            ❗❗회원님의 대여기간이 24시간보다 초과되어 연체료가 부과되었으니 연체료를 결제하시기바랍니다.
        </p>
        <div class="d-grid gap-2 mx-auto">
            <button class="btn btn-primary button-color" onclick="closePopup(this.value)" id="close" value="close"><i class="zmdi zmdi-check-circle"></i>확인</button>
            <button class="btn btn-primary button-color" onclick="closePopup(this.value)" id="using_more" value="using_more"><i class="zmdi zmdi-run"></i>좀더 사용하기</button>
        </div>
    </div>
</div>

<!-- Scripts -->

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>
<script>
    class User{
        constructor(name,email,phone,lateFee) {
            this.name=name;
            this.email=email;
            this.phone=phone;
            this.lateFee=lateFee;
        }
    }

    var name='<c:out value="${user.name}"/> ';
    var email='<c:out value="${user.email}"/>';
    var phone='<c:out value="${user.phone}"/>';
    var lateFee='<c:out value="${user.lateFee}"/> ';

    var user=new User(name,email,phone,lateFee);

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

        if(state=="using_more"){
            window.location="/";
            //이미 이용권 보유하고 있으니 홈화면으로 돌아간다.
        }
        else if(state=="paying_lateFee"){
            paying_system("ticket_info",user)//결제툴가동
        }
        else if(state=="sending_lateFee_info"){
            sending_lateFee_info();//서버로 결제가 완료됐음을 보냄
        }
        //state가 close이면 그냥 아무조건도 아니라 닫는걸로 설정..

    }
</script>
<script>
    var rental_latefee='<c:out value="${user.lateFee}"/>';
    var close_button=document.getElementById("close");
    if(rental_latefee>0){//연체료가 있을 때 모달창,계산 진행
        showPopup(true);
        close_button.setAttribute("value","paying_lateFee");
    }
</script>

<script type="text/javascript">

    var varUA = navigator.userAgent.toLowerCase();//운영체제 파악

    if(varUA.indexOf('android')>-1){
        //안드로이드
        document.getElementById("qrcode").classList.add("android_qr");

    }
    var code='<c:out value="${voucher.reservationCode}"/> '
    var qrcode = new QRCode(document.getElementById("qrcode"), {
        width : 100,
        height : 100,
        text:code,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });


</script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%--결제툴-아이포트추가--%>
<script src="/main_page/assets/payform/paying_system.js"></script>
<script src="/main_page/assets/qrcode/sending_lateFee_info.js"></script>
</body>
</html>