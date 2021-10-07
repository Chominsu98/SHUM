<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>특정부스페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <style>
        h3{
            font-size:1.5em;
        }


        .head-background{
            background-color: #ff0000ad !important;
            font-family: 'Do Hyeon', sans-serif !important;
        }

        .total-count{
            border-top:dotted 4px;
            border-color:#ff0000ad !important;
            font-family: 'Do Hyeon', sans-serif !important;

        }
        table th,td{
            text-align: center;
            font-size: 1.4em;
        }
        .table>:not(caption)>*>*{
            padding:1.4rem 0.5rem;
        }
        table tr{
            cursor:pointer;
        }

        #popup {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .7);
            z-index: 1;
        }

        #popup.hide {
            display: none;
        }

        #popup.has-filter {
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
        }

        #popup .content {
            padding: 20px;
            background: rgb(255 255 255 / 20%);
            border-radius: 5px;
            color:white;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
        }

        button{
            font-family: 'Do Hyeon', sans-serif !important;
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
                <h2>사용가능우산</h2>
                <p>광운대의 우산정보들을 한 눈에 봐보세요</p>
            </header>
        <section class="wrapper style5">
            <div class="inner">


        <section>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="position:inherit;background-color: white!important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><h5 style="font-family:'Nanum Gothic',sans-serif !important;"><i class="far fa-compass"></i>현위치:</h5></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="./map_page.html">📄지도보기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">⭐즐겨찾기</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">💦최근이용</a>
                        </li>
                        </li>

                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="🔎지역검색" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">검색</button>
                    </form>
                </div>
            </div>
        </nav>
        <h4>부스넘버${booth.id}</h4>

        <%--팝업모달창--%>
        <div id="popup" class="hide">
            <div class="content">
                <c:choose>
                    <c:when test="${user.haveTicket==true}">
                        <p>이용권을 사용하시겠습니까?</p>
                        <button  class="button primary icon far fa-check-square" onclick="closePopup(this.id)" id="useticket">이용권사용</button>
                        <button class="button primary icon far fa-check-square" onclick="closePopup(this.id)" style="margin-left: 37px;" id="close" >닫기</button>
                    </c:when>
                    <c:otherwise>
                        <p>
                            회원님께서는 보유하고 있는 이용권이 없습니다.
                        </p>
                        <button  class="button primary icon far fa-check-square" onclick="closePopup()" id="buyticket">이용권사러가기</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <table class="table table-hover">
            <thead class="head-background">

            <tr >
                <th scope="col">가능</th>
                <th scope="col">거치대</th>
                <th scope="col">타입</th>
                <th scope="col">상태</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="umbrella" items="${booth.umbrellas}">
                    <c:choose>
                        <c:when test="${umbrella.brokenState == false}">
                            <tr class="moveto_ticket">
                                <th scope="row">
                                    <c:choose>
                                        <c:when test="${umbrella.rentalState==true}">
                                            ❌
                                        </c:when>
                                        <c:otherwise>
                                            ✔
                                        </c:otherwise>
                                    </c:choose>
                                </th>
                                <td>${umbrella.umbrellaNumber}</td>
                                <td>${umbrella.umbrellaType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${umbrella.rentalState==true}">
                                            대여중
                                        </c:when>
                                        <c:otherwise>
                                            대여가능
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </tbody>
            <tfoot class="total-count">
                <tr>
                <th scope="">대여가능개수</th>
                <td colspan="3" style="font-size:30px">${booth.leftFreeUmbrella + booth.leftLocationUmbrella}</td>
                </tr>
            </tfoot>
            </table>



            </section>

            </div>
            </section>
            </article>

            <jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
            </div>

    <!-- Scripts -->
    <script>



    $(".moveto_ticket").click(function(){
        showPopup(true);
    // window.location="#";
    });

    function showPopup(hasFilter) {
    const popup = document.querySelector('#popup');

    if (hasFilter) {
        popup.classList.add('has-filter');
    } else {
        popup.classList.remove('has-filter');
    }

    popup.classList.remove('hide');
    }

    function closePopup(id) {
    const popup = document.querySelector('#popup');
    var way;
    if(id=="useticket"){
        way="/charge/charge"//이용권큐알페이지로 바로 이동
    }
    else if(id=="close"){
        popup.classList.add('hide');
        return;
    }
    else{
        way="/charge/payway";
    }
    popup.classList.add('hide');
    window.location=way;
    }
    </script>


    <jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    </body>
</html>