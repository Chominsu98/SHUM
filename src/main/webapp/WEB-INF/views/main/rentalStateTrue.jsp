<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Duration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>반납페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>

	<style>
		.form_button li:hover{
			background-color:rgb(0 0 0 / 23%);
		}
		/*.special a{*/
		/*	font-family: "Nanum Gothic",sans-serif !important;*/
		/*}*/
		.notification{
			font-family: 'Do Hyeon',sans-serif !important;
			font-size: 22px;
			line-height: 1.7;
			color: #ffffff;
			margin: 13px;
		}
		.button-series{
			font-family: "Do Hyeon",sans-serif !important;
			background-color: #ff5252;
			border-color: #ff5252;
		}

	</style>
	<jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>
</head>
<body class="landing is-preload">

<!-- Page Wrapper -->
<div id="page-wrapper">

	<jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

	<!-- Banner -->
	<section id="banner" class="wrapper style4 special">
		<div class="inner" style="font-family: 'Nanum Gothic';">
			<h2>🚨반납해줘 우산즈!🚨</h2>
			<p>우산 잘 쓰셨나요??부스위치를 확인하시고 반납해주세요</p>

			<div class="d-grid gap-2 mx-auto" style="margin-bottom: 2em">
				<a class="btn btn-primary button-series" onclick="showPopup(true)"><i class="zmdi zmdi-info"></i>대여정보</a>
			</div>

			<%--팝업모달창--%>
			<div id="popup" class="hide">
				<div class="content">
					<c:set var="returnTime" value="${voucher.voucherStartDate}"/>
					<%
						long sec;
						LocalDateTime returnTime = (LocalDateTime)pageContext.getAttribute("returnTime");
						Duration duration = Duration.between(LocalDateTime.now(), returnTime);

						sec = -1*(duration.getSeconds());
						System.out.println("초는 여기에서:"+sec);

					%>
					<p class="notification" id="time">
						로딩중..
					</p>
					<p class="notification">
						✔대여우산타입:${rental.umbrella.umbrellaType}
					</p>
					<p class="notification">
						✔대여우산번호:${rental.umbrella.id}
					</p>
					<div class="d-grid gap-2 mx-auto" style="margin-bottom: 2em">
						<a class="btn btn-primary button-series" onclick="closePopup('turn_off')"><i class="zmdi zmdi-info"></i>닫기</a>
					</div>
				</div>
			</div>

			<ul class="features form_button">
				<li class="far fa-map">
					<a href="/map/mapPage" class="">
						<h3>지도보기</h3>
						<p>지도를 통해 내 위치 주변의<br>우산부스들을 확인합니다.</p>
					</a>
				</li>
				<li class="icon fa-flag">
					<a href="/charge/QRcodePage" class="">
						<h3>반납하기</h3>
						<p>우산을 다 사용하여 QR코드를 키오스크에 찍고 반납합니다.</p>
					</a>
				</li>
<%--				<li class="far fa-bell">--%>
<%--					<a href="/report/breakdownReport" class="">--%>
<%--						<h3>신고하기</h3>--%>
<%--						<p>현 우산의 상태가 점검이 필요할 것으로 신고합니다.</p>--%>
<%--					</a>--%>
<%--				</li>--%>
			</ul>
		</div>
		<!-- <a href="#three" class="more scrolly">내 주위우산</a> -->
	</section>


	<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>

</div>

<!-- Scripts -->
<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>

<script>
	var timer;
	var time_pass=<%=sec%>
			function timer_machine(){


				 	timer=setInterval(function (){
					time_pass++;
					min = Math.floor(time_pass/60);
					hour = Math.floor(min/60);
					sec = time_pass%60;
					min = min%60;

					if(hour>=24 && min>=0 && sec>=0){
						document.getElementById("time").innerHTML="<span style='color:red'>❗연체</span>"+"🕒이용시간:"+hour+"시간"+min+"분"+sec+'초';
					}
					document.getElementById("time").innerHTML="🕒이용시간:"+hour+"시간"+min+"분"+sec+'초';
				},1000);
			}
	function showPopup(hasFilter) {
		const popup = document.querySelector('#popup');

		if (hasFilter) {
			popup.classList.add('has-filter');
		} else {
			popup.classList.remove('has-filter');
		}

		popup.classList.remove('hide');
		timer_machine();
	}

	function closePopup(state) {
		const popup = document.querySelector('#popup');
		popup.classList.add('hide');
		if(state=="turn_off"){
			clearInterval(timer);
		}
	}
</script>
<script>
	var tmp=document.getElementById("header");
	tmp.classList.add("alt")
</script>
</body>
</html>
