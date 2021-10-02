<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/map/nearBoothPage.css">
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
            <h1>주변 부스</h1>
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

    <div class="nearBooth">
        <ul class="nearBoothList">
            <li id="head">부스명 ( 대여 가능 갯수 )</li>
        </ul>
    </div>

    <div class="footer">
        <div class="nearBooth">
            <button type="button" onclick="location.href='/map/samplemap'">지도로 보기</button>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2238e5793485dc179dc4a96ebb0bf6d"></script>
    <script>
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
    <script type="text/javascript" src="/js/nearBoothPage.js"></script>

</body>
</html>