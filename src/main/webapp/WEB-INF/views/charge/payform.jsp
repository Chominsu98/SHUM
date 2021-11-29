<!DOCTYPE HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<html>
<head>
    <title>결제페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>


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

        .button{
            font-family: "Do Hyeon", sans-serif;
            font-size: 0.9em;
        }


        input[type="submit"].primary, input[type="reset"].primary, input[type="button"].primary, button.primary, .button.primary {
            background-color: #212529;
            box-shadow: none !important;
            color: #ffffff !important;
        }

        @media screen and (max-width: 480px){


            ul.actions:not(.fixed) li {
                -moz-flex-grow: 1;
                -webkit-flex-grow: 1;
                -ms-flex-grow: 1;
                flex-grow: 1;
                -moz-flex-shrink: 1;
                -webkit-flex-shrink: 1;
                -ms-flex-shrink: 1;
                flex-shrink: 1;
                padding: 0em 0 0 0;
                text-align: center;
                width: 100%;
            }
        }

        .spotlight:nth-child(2) {
            background-color: rgb(0 0 0 / 0%);
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
        button{
            font-family: "Nanum Gothic", sans-serif;
            outline: none !important;
            border: none;
            background: transparent;
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

            <h2>일일권 결제</h2>
            <p>24시간동안 대여횟수 제한없이 대여할 수 있습니다.</p>

            <!-- <p>첫 대여 후 이용기간 동안 무제한 반복 대여 가능</p>정기권 설명서 -->

        </header>
                <section class="wrapper style5">
                    <div class="inner">
                        <h4>결제하기</h4>
                        <section class="spotlight">
                            <div class="image"><img src="/images/pic01.jpg" alt="" /></div>
                        </section>
                        <h5>기본대여시간</h5>
                        <div class="col-12">
                            <select name="demo-category" id="tickets" onchange="change_select()">
                                <option value="ad">지역Edition일일권</option>
                                <option value="free">프리Edition일일권</option>
                            </select>
                        </div>

                    </div>
                </section>



        <!--결제정보 -->
        <section id="one" class="wrapper style1 special">
            <div class="inner">
                <header class="major">
                    <h2>결제금액</h2>
                        <p id="total-selected-ticket">지역Edition일일권(24시간)</p>
                        <h4 id="total-price">1500원</h4>
                </header>
                <form onsubmit="return false;">
                    <input type="hidden" name="ticketType" value="지역Edition일일권" id="ticketType">
                    <button class="button fit " id="purchase_button">구매</button>
                </form>
            </div>
        </section>
    </article>

    <%--팝업모달창--%>
    <div id="popup" class="hide">
        <div class="content">
            <p class="notification" id="notification">
                ❌회원님께서는 이미 이용권을 보유하고 있어 구매가 불가능합니다.
            </p>
            <div class="d-grid gap-2 mx-auto">
                <button class="btn btn-primary button-color" onclick="closePopup(this.value)" id="close" value="get_back_to_home"><i class="zmdi zmdi-check-circle"></i>확인</button>
            </div>
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

    function closePopup(state) {
        const popup = document.querySelector('#popup');
        popup.classList.add('hide');

        if(state=="get_back_to_home"){
            window.location="/";
            //이미 이용권 보유하고 있으니 홈화면으로 돌아간다.
        }
        else if(state=="send_paying_info"){
            send_paying_info();//티켓타입과 결제정보를 보내줌
        }
        //state가 close이면 그냥 아무조건도 아니라 닫는걸로 설정..

    }
</script>
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

    let button=document.getElementById("purchase_button");
    var user=new User(name,email,phone,lateFee);

    button.onclick=function (){
        paying_system("ticket_payform",user);
    }

    let state='<c:out value="${user.haveTicket}"></c:out> ';

    if(JSON.parse(state)==true){
        button.setAttribute("type","button");
        showPopup(true);
    }

    function change_select(){
        var selectOption=document.getElementById("tickets");
        var price=0;
        var message;
        var type;
        var ticket_type=document.getElementById("ticketType");
        var total_tag=document.getElementById("total-price");
        var ticket_tag=document.getElementById("total-selected-ticket");
        selectOption=selectOption.options[selectOption.selectedIndex].value;



        switch (selectOption){
            case 'free':
                type='프리Edition';
                ticket_type.setAttribute("value","프리Edition일일권");
                break;
            case 'ad':
                type="지역Edition";
                ticket_type.setAttribute("value","지역Edition일일권");
                break;
        }


       message=type+"일일권(24시간)";
        if(selectOption=="free"){
            price=2000;

        }
        else{
            price=1500;

        }

        ticket_tag.innerText=message;
        total_tag.innerText=price+"원";
    }
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%--결제툴-아이포트추가--%>
<script src="/main_page/assets/payform/paying_system.js"></script>

</body>
</html>