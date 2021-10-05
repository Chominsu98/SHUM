<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	<title>🚨대여페이지</title>
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>


	<style>
		.form_button li:hover{
			background-color:rgb(0 0 0 / 23%);
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
			<h2>🚨구해줘 우산즈!🚨</h2>
			<p>지금 바로 내 주위에 우산위치를 확인하고 빌려보세요!</p>
			<!-- <ul class="actions special">
                <li><a href="#" class="button primary">Activate</a></li>
            </ul> -->
			<ul class="features form_button">
				<li class="far fa-map">
					<a href="/main/map" class="">
						<h3>지도보기</h3>
						<p>지도를 통해 내 위치 주변의<br>우산부스들을 확인합니다.</p>
					</a>
				</li>
				<li class="icon fa-flag">
					<a href="/rental/rentalshowBooth" class="">
						<h3>리스트보기</h3>
						<p>리스트를 통해 현재 위치를 기준으로<br> 가까운 거리순으로 우산부스들을 <br>확인합니다.</p>
					</a>
				</li>
			</ul>
		</div>
		<!-- <a href="#three" class="more scrolly">내 주위우산</a> -->
	</section>

	<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>

</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>

<script>
	var tmp=document.getElementById("header");
	tmp.classList.add("alt")
</script>
</body>
</html>