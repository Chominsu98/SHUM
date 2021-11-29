<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>지도보기</title>
	<link rel="stylesheet" href="/css/map/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="/css/map/css_for_only_map.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



	<style>
		.search{
			position: relative;
			left: 2em;

		}
		.result_booth{
			font-size: 1.5em;
			font-family: 'Do Hyeon';
			list-style: disc;
			margin: 0px 1em 2em 0em;
		}
		.result_booth li{
			margin:1em;
		}

		.result_booth li:hover {
			color:deepskyblue;
		}
		.wrapper.style5 h3{
			color:white;
		}
		.center_home_button{
			font-size: 1.25rem;
			border-radius: 5.25rem;
			padding: 0.375rem 2.75rem;
			box-shadow: inset 0 0 0 5px #2e384230;
			color:black;
			border: 7px solid #04275a;
			background-color: #f0f1ff;
			border-color: #0dcaf082;
			font-family: "Do Hyeon", sans-serif;

		}
		.search_button{
			font-family: "Do Hyeon", sans-serif;
			color:white;
			box-shadow: inset 0 0 0 0px #dfdfdf !important;
			background-color: #dc3545;
			border-color: #2125297a;
		}

		.mobile-bottom-nav {
			position: fixed;
			bottom: 0;
			left: 0;
			right: 0;
			z-index: 1000;
			will-change: transform;
			transform: translateZ(0);
			display: flex;
			height: 7em;
			box-shadow: 0 -2px 5px -2px #333;
			background-color: #bc1215;
		}
		.mobile-bottom-nav__item {
			flex-grow: 1;
			text-align: center;
			font-size: 20px;
			display: flex;
			flex-direction: column;
			justify-content: center;
		}
		.mobile-bottom-nav__item--active {
			color: red;
		}
		.mobile-bottom-nav__item-content {
			display: flex;
			flex-direction: column;
		}
		.notification{
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
		span{
			font-family: 'Do Hyeon', sans-serif !important;
		}
		p {
			margin: 0 0 1.5em 0;
			font-size: 1.4em;
		}
		label {
			color: #fff;
			display: block;
			font-size: 0.9em;
			font-weight: 600;
			margin: 0 0 1em 0;
			font-family: 'Nanum Gothic';
		}
	</style>
	<jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>
</head>
<body class="is-preload">
<div id="mappage">
<div id="page-wrapper">
		<jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

		<div class="search" id="search_scope">
			<i id="search_m" class="fas fa-search fa-4x"></i>
		</div>
	<article id="main">
<%--	<div id="mappage">--%>

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

							</ul>
							<form class="d-flex" onsubmit="return false">
								<input class="form-control me-2" type="search" placeholder="🔎지역검색" aria-label="Search">
								<button id="search_web" class="btn btn-outline-success" type="button">검색</button>
							</form>
						</div>
					</div>
				</nav>
				<div id="invisible">
					<h4>지도</h4>
				</div>

				<div class="box alt">
					<div class="row gtr-50 gtr-uniform">
						<div class="col-12">
							<div class="mainsource">
								<div id="map">
									<!--이 위치에 동적으로 자바스크립토 밑에 버튼관련 코드 삽입됨-->
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
											<img src="/images/map/ticket.png" alt="" id="ticketIcon">
										</div>
									</div>
								</div>

								<!--
								<footer class="footer">
									<div class="d-grid gap-2 mx-auto">
										<button class="btn btn-primary button-color" onclick="location.href='/map/nearBoothPage'"><i class="zmdi zmdi-check-circle"></i>확인</button>
									</div>
								</footer>
								-->
								<nav class="mobile-bottom-nav">
									<div class="mobile-bottom-nav__item mobile-bottom-nav__item--active">
										<div class="mobile-bottom-nav__item-content" id="mobile_1">
											<div class="getMyPos" id="mylocation_mobile">
												<img src="/images/map/getMyPos.png" alt="내 위치로 화면 이동">
											</div>
											<h3>현위치</h3>
										</div>
									</div>
									<div class="mobile-bottom-nav__item">
										<div class="mobile-bottom-nav__item-content">
											<div class="d-grid gap-2 mx-auto">
												<button class="btn btn-primary center_home_button" onclick="location.href='/map/nearBoothPage'"><i class="zmdi zmdi-check-circle"></i>리스트</button>
											</div>
										</div>
									</div>

									<div class="mobile-bottom-nav__item">
										<div class="mobile-bottom-nav__item-content" id="mobile_2">
											<div class="reload" id="reload_mobile">
												<img src="/images/map/reload.png" alt="새로고침">
											</div>
											<h3>새로고침</h3>
										</div>
									</div>
								</nav>

<%--								<div id="my_modal">--%>
<%--									<div class="my_modal_wbg">--%>
<%--										<div class="modal_header">--%>
<%--											<img src="/images/close.png" class="modal_close_btn" />--%>
<%--											<div class="search_booth">우산 부스 검색</div>--%>

<%--											<input id="modal_input" type="search" placeholder="부스명을 입력하세요." />--%>
<%--											<button id="modal_button">검색</button>--%>
<%--										</div>--%>

<%--										<div class="search_result">--%>
<%--											<span class="blank"></span>--%>
<%--											<ul>--%>
<%--												<li>검색 결과가 없습니다.</li>--%>
<%--											</ul>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--								</div>--%>
							</div>
						</div>
					</div>
				</div>
			</section>
			<%--팝업모달창 검색창--%>
			<div id="popup" class="hide">
				<div class="content">
					<form class="login100-form validate-form" id="booth_search" onsubmit="return false;">
					<span class="login100-form-title p-b-26">
						부스검색
					</span>
						<span class="login100-form-title">
							<i class="zmdi zmdi-google-maps"></i>
            			</span>
						<p class="notify">원하시는 부스를 검색하세요</p>
						<div class="wrap-input100 validate-input" data-validate = "부스를 입력해주세요">
							<label>부스명</label>
							<input class="input100" type="text" name="booth_name" id="booth_name" placeholder="ex)광운대역">

						</div>
						<div class="d-grid gap-2 mx-auto">
							<button class="btn btn-primary search_button" id="search_button" ><i class="zmdi zmdi-search-in-file"></i>검색</button>
							<button class="btn btn-primary search_button" onclick="closePopup('#popup')" ><i class="zmdi zmdi-check-square"></i>닫기</button>
						</div>

					</form>
				</div>
			</div>

			<%--팝업모달창 결과창--%>
			<div id="popup_check_verifynum" class="hide">
				<div class="content">
					<form class="login100-form validate-form" id="" onsubmit="return false;">
						<span class="login100-form-title p-b-26">
							검색결과
						</span>
						<span class="login100-form-title">
							<i class="zmdi zmdi-google-maps"></i>
            			</span>

						<div class="search_result_1">
							<span class="blank"></span>
							<ul class="result_booth">
								<li>검색 결과가 없습니다.</li>
							</ul>
						</div>

						<div class="d-grid gap-2 mx-auto">
							<button class="btn btn-primary search_button" onclick="closePopup('#popup_check_verifynum')" ><i class="zmdi zmdi-check-square"></i>닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>
</article>
</div>
	<div id="invisible">
		<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
	</div>

</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>
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
<%--모바일 ui와 웹 ui에서의 지도버튼과 리셋버튼의 위치적 변화 스크립트파일--%>
<script>
	var mylocation_mobile=document.getElementById("mylocation_mobile")
	var reload_mobile=document.getElementById("reload_mobile");
	var nav_bar=document.getElementsByClassName("mobile-bottom-nav");
	var search_scope=document.getElementById("search_scope");
	var varUA = navigator.userAgent.toLowerCase();
	if(matchMedia("screen and (min-width: 736px)").matches){//웹사이즈뷰일때-딱 들어오자마자 이 사이즈일때만 구동됌-따라서 새로고침필요
		$("#map").prepend("<div class='reload' id='mylocation_websize' > <img src='/images/map/reload.png' alt='새로고침'> </div>");//웹사이즈때의 전용 버튼태그 추가
		$("#map").prepend("<div class='getMyPos' id='reload_websize' > <img src='/images/map/getMyPos.png' alt='내 위치로 화면 이동'> </div>");
		mylocation_mobile.remove();//모바일 용 버튼들은 잠시 삭제
		reload_mobile.remove();
		nav_bar[0].style.display='none';//웹뷰에는 하단 nav바 안보이게
		search_scope.style.display='none';//모바일용 돋보기는 안보이게

	}
	else{//모바일 ui로 들어오는 애들에 대해서는 밑에 버튼들의 postion이 변경이 필요했음
		$(".getMyPos img").css("position","inherit");
		$(".reload img").css("position",'inherit');
	}

	window.onresize=function (event){
		if(varUA.indexOf("android")>-1){//안드로이드 모바일 기기시에는 키보드가 열릴시 화면의 크기 변함
			$("#booth_name").click(function (){
				return;
			})
			return;
		}
		location.reload();
	}

</script>
<%--모달팝업창용--%>
<script>
	function showPopup(hasFilter,id) {
		const popup = document.querySelector(id);

		if (hasFilter) {
			popup.classList.add('has-filter');
		} else {
			popup.classList.remove('has-filter');
		}

		popup.classList.remove('hide');
	}

	function closePopup(id) {
		const popup = document.querySelector(id);
		popup.classList.add('hide');
	}
</script>

<script type="text/javascript" src="/js/map.js"></script>

<script>
	var navItems = document.querySelectorAll(".mobile-bottom-nav__item");
	navItems.forEach(function(e, i) {
		e.addEventListener("click", function(e) {
			navItems.forEach(function(e2, i2) {
				e2.classList.remove("mobile-bottom-nav__item--active");
			})
			this.classList.add("mobile-bottom-nav__item--active");
		});
	});
</script>
<jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>

</body>
</html>