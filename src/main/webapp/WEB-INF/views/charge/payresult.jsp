<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>이용권정보</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


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

        }


        .rental_info td{
            color:#2E3842;
        }

        .head-background-rental-info{
            background-color: #c91c1ac2;

        }

        .rental_info td{
            color:#2E3842;
        }

    </style>
</head>
<body class="is-preload">
<div id="page-wrapper">
    <jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

    <!-- Main -->
    <article id="main">
        <header>
            <h2>결제완료</h2>
            <p>저희 이용권을 구매해주셔서 감사합니다.결제내역을 확인하시기 바랍니다.</p>
        </header>


        <section class="wrapper style5">
            <div class="inner">
                <h4>💰결제완료</h4>

                <table class="table table-hover">
                    <thead class="head-background-rental-info">
                        <tr >
                            <th colspan=2 scope="col">💧결제내역💧</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="rental_info">
                            <th scope="row">💸상품명:</th>
                            <td>${ticketType}</td>
                        </tr>
                        <tr class="rental_info">
                            <th scope="row">💸결제금액:</th>
                            <td>${ticket_price}원</td>
                        </tr>
                        <tr class="rental_info">
                            <th scope="row">💳결제수단:</th>
                            <td>카카오페이</td>
                        </tr>
                        <tr class="rental_info">
                            <th scope="row">📆결제시기:</th>
                            <td>${paying_date}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>


        <section id="one" class="wrapper style1 special">
            <div class="inner">
                <h5 class="show_voucher">☔그럼 서비스이용하러<br></br>가볼까요?</h5>
                <a href="/map/mapPage" class="button fit ">내 주위 우산</a>
                <a href="/main/myPage" class="button fit ">내 이용권 보기</a>

            </div>
        </section>
        <jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
    </article>
</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>


</body>
</html>