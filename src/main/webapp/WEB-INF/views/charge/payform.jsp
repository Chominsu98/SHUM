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

        .time-button{
            margin-top: 17px;
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

        .modal {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.4);
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
            <c:set var="URL" value="${requestScope['javax.servlet.forward.servlet_path']}" />
            <c:set var="URL" value="${fn:split(URL, '/')[2]}" />
            <c:choose >
                <c:when test="${URL=='day'}">
                    <h2>일일권 결제</h2>
                    <p>24시간동안 대여횟수 제한없이 대여할 수 있습니다.</p>
                </c:when>
                <c:when test="${URL=='subscribe'}">
                    <h2>정기권 결제</h2>
                    <p>구독한 기간동안에는 대여횟수 제한없이 대여가능</p>
                </c:when>
                <c:otherwise>
                    <h2>지역에디션 결제</h2>
                    <p>지역에디션으로 더욱 할인된 가격으로 사용가능</p>
                </c:otherwise>
            </c:choose>

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

                                <c:choose>
                                    <c:when test="${URL=='areaEdition'}">

                                    </c:when>
                                    <c:otherwise>
                                        <option value="free">프리Edition일일권</option>
                                    </c:otherwise>
                                </c:choose>

                                <option value="ad">지역Edition일일권</option>



                            </select>
                        </div>
<%--                        <ul class="actions day-ticket-time">--%>
<%--                            <li value="1" class="time-button button primary fit">12시간</li>--%>
<%--                            <li value="2" class="time-button button fit">24시간</li>--%>
<%--                        </ul>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${URL=='subscribe'}">--%>
<%--                                <ul class="actions subscribe-ticket-days">--%>
<%--                                    <li value="6" class="time-button button primary fit">7일</li>--%>
<%--                                    <li value="28" class="time-button button fit">30일</li>--%>
<%--                                    <li value="170" class="time-button button fit">180일</li>--%>
<%--                                    <li value="350" class="time-button button fit">365일</li>--%>
<%--                                </ul>--%>
<%--                            </c:when>--%>
<%--                        </c:choose>--%>
                    </div>
                </section>



        <!--결제정보 -->
        <section id="one" class="wrapper style1 special">
            <div class="inner">
                <header class="major">
                    <h2>결제금액</h2>
                    <c:choose>
                        <c:when test="${URL=='areaEdition'}">
                            <p id="total-selected-ticket">지역Edition일일권(24시간)</p>
                            <h4 id="total-price">700원</h4>
                        </c:when>
                        <c:otherwise>
                            <p id="total-selected-ticket">프리Edition일일권(24시간)</p>
                            <h4 id="total-price">1000원</h4>
                        </c:otherwise>
                    </c:choose>
                </header>
                <form action="/charge/payform" method="post">
                    <c:choose>
                        <c:when test="${URL=='areaEdition'}">
                            <input type="hidden" name="ticketType" value="지역Edition일일권">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="ticketType" value="프리Edition일일권">
                        </c:otherwise>
                    </c:choose>
                    <button class="button fit ">구매</button>
                </form>
            </div>
        </section>
    </article>

    <jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
</div>

<!-- Scripts -->
<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>


<script>
    const menuWrap = document.querySelector('.day-ticket-time');
    var ticket_hour=1;
    var ticket_day=1;

    function select(ulEl, liEl){
        Array.from(ulEl.children).forEach(
            v => v.classList.remove('primary')
        )
        if(liEl) liEl.classList.add('primary');
    }
    try{
        selectWrap=document.querySelector('.subscribe-ticket-days')

        selectWrap.addEventListener('click', e => {
            const selected = e.target;
            select(selectWrap, selected);
            ticket_day=selected.value;
            change_select();


        })
    }catch(error){
        console.log("여긴 정기권");
    }
    finally {


        menuWrap.addEventListener('click', e => {
            const selected = e.target;
            select(menuWrap, selected);
            ticket_hour=selected.value;
            change_select();


        })


    }


    function change_select(){
        var URL='<c:out value="${URL}"/>'
        var selectOption=document.getElementById("tickets");
        var price=0;
        var message;
        var type;
        var time;
        var days;
        var total_tag=document.getElementById("total-price");
        var ticket_tag=document.getElementById("total-selected-ticket");
        selectOption=selectOption.options[selectOption.selectedIndex].value;



        ticket_hour=parseInt(ticket_hour)
        switch (ticket_hour){
            case 1:
                time="24";
                break;
            case 2:
                time="24";
                break;
        }

        switch (selectOption){
            case 'free':
                type='프리Edition';
                break;
            case 'ad':
                type="지역Edition";
                break;
        }


        ticket_day=parseInt(ticket_day);
       switch (ticket_day){
           case 6:
                days="7일";
               break;
           case 28:
               days="30일";
               break;
           case 170:
               days="180일";
               break;
           case 350:
               days="365일";
               break;
           default:
               days="일일";
               break;
        }


       message=type+days+"권"+'('+time+'시간'+')';
        if(selectOption=="free"){
            price=parseInt(ticket_hour)*1000;

        }
        else{
            price=parseInt(ticket_hour)*700;

        }
        if(URL=='subscribe'){
            price*=ticket_day;
        }

        ticket_tag.innerText=message;
        total_tag.innerText=price+"원";
    }
</script>
</body>
</html>