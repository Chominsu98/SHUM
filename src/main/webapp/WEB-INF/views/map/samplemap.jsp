<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>우산 같이 쓸래요?</title>
    <link rel="stylesheet" href="/css/map/main.css">
    <link rel="stylesheet" href="/css/map/mapstyle.css">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
    />
</head>
<body>
    <div class="GNB">
        <div class="menu">
            <i class="fas fa-bars fa-4x"></i>
            <div>메뉴</div>
        </div>

        <div class="logo">
            <h1>우산 같이 쓸래요?</h1>
        </div>

        <div class="searchAndMyPage">
            <div class="search">
                <i id="search" class="fas fa-search fa-4x"></i>
                <div>검색</div>
            </div>

            <div class="myPage">
                <i id="myPage" class="far fa-user fa-4x"></i>
                <div>내정보</div>
            </div>
        </div>
    </div>

    <div class="mainsource">
        <div id="map"></div>

        <div id="my_modal">
            <div class="my_modal_wbg">
                <div class="modal_header">
                    <img src="/images/map/close.png" class="modal_close_btn" />
                    <div class="search_booth">우산 부스 검색</div>

                    <input type="search" placeholder="부스명을 입력하세요." />
                    <button>검색</button>
                </div>

                <div class="search_result">
                    <span class="blank"></span>
                    <ul>
                        <li>검색 결과가 없습니다.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="getMyPos up">
            <img src="/images/map/getMyPos.png" alt="내 위치로 화면 이동">
        </div>

        <div class="reload">
            <img src="/images/map/reload.png" alt="새로고침">
        </div>

        <div class="booth invisible">
            <input type="hidden" value="0"/>
            <ul class="boothDesc">
                <ul id="boothName">
                    <li>이름</li>
                </ul>
                <ul id="boothCount">
                    <li>보유 갯수 : </li>
                    <li>대여 가능 갯수 : </li>
                    <li>점검 상태 : </li>
                </ul>
            </ul>
            <div class="icons">
                <img src="/images/map/navigator.png" alt="" id="navigatorIcon">
                <img src="/images/map/ticket.png" alt="">
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="nearBooth">
            <button type="button" onclick="location.href='/map/nearBoothPage'">주변 부스</button>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2238e5793485dc179dc4a96ebb0bf6d"></script>
    <script type="text/javascript">
        //부스 위치 받은 후 samplemap.js에 넘겨주기
        var boothPositions = [];

        var Position = function(id, title, latlng, left, fixed) {
            this.id = id;
            this.title = title;
            this.latlng = latlng;
            this.left = left;
            this.fixed = fixed;
        }

        var numberOfBooth = ${boothList.size()};
        <c:forEach var="s" items="${boothList}">
            var position = new Position(${s.id}, "${s.boothName}", new kakao.maps.LatLng(${s.latitude}, ${s.longitude}), ${s.leftUmbrella}, 0);
            boothPositions.push(position);
        </c:forEach>

    </script>
    <script type="text/javascript" src="/js/samplemap.js"></script>
</body>
</html>
