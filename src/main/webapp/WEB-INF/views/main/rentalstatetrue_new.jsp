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
	</style>
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

			<div id="popup" class="hide">
				<div class="content">
					<p>
						대여시간:6시간<br>대여부스:광운대역
					</p>
					<button class="button primary icon far fa-times-circle" onclick="closePopup()">닫기</button>
				</div>
			</div>

			<ul class="features form_button">
				<li class="far fa-map">
					<a href="/main/map" class="">
						<h3>지도보기</h3>
						<p>지도를 통해 내 위치 주변의<br>우산부스들을 확인합니다.</p>
					</a>
				</li>
				<li class="icon fa-flag">
					<a href="#" class="">
						<h3>반납하기</h3>
						<p>우산을 다 사용하여 QR코드를 키오스크에 찍고 반납합니다.</p>
					</a>
				</li>
				<li class="far fa-bell">
					<a href="#" class="">
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
