<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>지도보기</title>
	<link rel="stylesheet" href="/css/map/main.css">
	<link rel="stylesheet" href="/css/map/mapstyle.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>

</head>
<body class="is-preload">

<div id="page-wrapper">

	<jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

<article id="main">
	<header>
		<h2>지도보기</h2>
		<p>내 주위 가까운 위치의 우산부스를 찾아보세요</p>
	</header>
	<section class="wrapper style5">
		<div class="inner">
			<section>
				<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position:inherit;background-color: white!important;">
					<div class="container-fluid">
						<a class="navbar-brand" href="#"><h5 style="font-family:'Nanum Gothic',sans-serif !important;"><i class="far fa-compass"></i>현위치:"광운대"</h5></a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item">
									<a class="nav-link " aria-current="page" href="/map/nearBoothPage">📄리스트 보기</a>
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
				<h4>지도</h4>

				<div class="box alt">
					<div class="row gtr-50 gtr-uniform">
						<div class="col-12">
							<div class="mainsource">
								<div id="map">
									<div class="getMyPos up">
										<img src="/images/map/getMyPos.png" alt="내 위치로 화면 이동">
									</div>

									<div class="reload">
										<img src="/images/map/reload.png" alt="새로고침">
									</div>

									<div class="booth invisible">
										<input type="hidden" value="-1000"/>
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
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

	</section>
</article>

<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2238e5793485dc179dc4a96ebb0bf6d"></script>
<script type="text/javascript">
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
		var position = new Position(${s.id}, "${s.boothName}", new kakao.maps.LatLng(${s.latitude}, ${s.longitude}), ${s.leftFreeUmbrella + s.leftLocationUmbrella}, 0);
		boothPositions.push(position);
	</c:forEach>

</script>
<script type="text/javascript" src="/js/map.js"></script>


</body>
</html>