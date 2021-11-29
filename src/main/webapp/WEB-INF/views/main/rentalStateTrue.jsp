<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	<title>반납페이지</title>
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>

	<style>
		.form_button li:hover{
			background-color:rgb(0 0 0 / 23%);
		}
		.special a{
			font-family: "Nanum Gothic",sans-serif !important;
		}
		.notification{
			font-family: 'Nanum Gothic',sans-serif !important;
			font-size: 22px;
			line-height: 1.7;
			color: #ffffff;
			margin: 13px;
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

			<ul class="actions special">
				<li><a href="#" class="button primary" onclick="showPopup(true)">대여정보</a></li>
			</ul>

			<%--팝업모달창--%>
			<div id="popup" class="hide">
				<div class="content">
					<p class="notification">
					🕒대여시간:6시간
					</p>
					<p class="notification">
						🗺대여장소:광운대역
					</p>
					<button class="button primary icon far fa-times-circle" onclick="closePopup()">닫기</button>
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
				<li class="far fa-bell">
					<a href="/report/breakdownReport" class="">
						<h3>신고하기</h3>
						<p>현 우산의 상태가 점검이 필요할 것으로 신고합니다.</p>
					</a>
				</li>
			</ul>
		</div>
		<!-- <a href="#three" class="more scrolly">내 주위우산</a> -->
	</section>


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

	function closePopup() {
		const popup = document.querySelector('#popup');
		popup.classList.add('hide');
	}
</script>
<script>
	var tmp=document.getElementById("header");
	tmp.classList.add("alt")
</script>
</body>
</html>
