<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>지도보기</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
	<style>
		#main > header p {
			color: inherit;
			letter-spacing: 0em;
			text-transform: uppercase;
			top: 0;
		}
		h3{
			font-size:1.5em;
		}

		.form-card p{
			margin:0px 0 -1.5em 0;
			font-size:1.7em;
			font-family: "Do Hyeon", sans-serif !important;
		}

		.form-card-free{
			position: relative;
			bottom:31px;
			right:9px;
		}

		.form-card-total-left{
			margin-top:23px;
			font-size:4.1em;
			margin-bottom: 0px;
		}

		.card{
			background-color: #0000001f;
		}
		.card-header{
			background-color: #ff0000ad;
		}
		.button-series{
			background-color: #ff5252;
			border-color: #ff5252;
		}

	</style>
</head>
<body class="is-preload">

<div id="page-wrapper">

	<jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

	<!-- Main -->
	<article id="main">
		<header>
			<h2>리스트로보기</h2>
			<p>내 주위 가까운 위치의 우산부스를 찾아보세요</p>
		</header>
		<section class="wrapper style5">
			<div class="inner">


				<section>
					<div class="d-grid gap-2 mx-auto" style="margin-bottom: 2em">
						<a class="btn btn-primary button-series" href="/map/mapPage"><i class="zmdi zmdi-google-maps"></i>지도보기</a>
					</div>

					<h4>내 위치 주변</h4>

					<c:forEach var="s" items="${boothList}">
					<div class="card">
						<h5 class="card-header">부스넘버${s.id}</h5>
						<div class="card-body form-card">
							<h3 class="card-title">${s.boothName}</h3>
							<p class="card-text">☂지역Edition: ${s.leftLocationUmbrella}개</p>
							<hr>
							<p class="form-card-free">🌂프리Edition: ${s.leftFreeUmbrella}개</p>
							<h2 class="form-card-total-left">${s.leftLocationUmbrella + s.leftFreeUmbrella}개</h2>
							<a href="/rental/showUmbrella/${s.id}" class="btn btn-primary">이용권사용</a>
						</div>
					</div>
					</c:forEach>
				</section>
			</div>
		</section>
	</article>

	<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</body>
</html>