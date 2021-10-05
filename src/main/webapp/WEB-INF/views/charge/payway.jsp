<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>(회원)이용권구매 페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>

    <style>


        .features li:nth-child(1) {
            background-color: #b9bad4;
        }

        .features li:nth-child(2) {
            background-color: #b9bad4;
        }

        .form_button li:hover{
            background-color:rgb(0 0 0 / 23%);
        }

        .spotlight:nth-child(1):hover{
            background-color:rgb(0 0 0 / 23%);
        }
        .spotlight:nth-child(2):hover{
            background-color:rgb(0 0 0 / 23%);
        }
        .spotlight:nth-child(1) {
            background-color: #dc3545;
        }

        .spotlight:nth-child(2) {
            background-color: #dc3545;
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
            <h2>이용권구매</h2>
            <p>이용권을 먼저 구매하시고 이용해주세요</p>
        </header>

        <section id="two" class="wrapper alt style2">
            <section class="spotlight">
                <div class="image"><img src="/images/shum_logo.png" alt="" /></div><div class="content">
                <a href="/charge/sortofticket" class="">
                    <h2>이용권으로 살래요!</h2>
                    <p>미리 선불로 이용권을 구매하여 일정시간만큼 사용합니다.</p>
                </a>
            </div>
            </section>
            <section class="spotlight">
                <div class="image"><img src="/images/pic01.jpg" alt="" /></div><div class="content">
                <a href="/charge/usingtime" class="">
                    <h2>사용한 시간만큼!</h2>
                    <p>사용한 시간만큼 후불로 비용이 결제됩니다.</p>
                </a>
            </div>
            </section>


        </section>
    </article>
    <jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>

</div>

<!-- Scripts -->
<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</body>
</html>