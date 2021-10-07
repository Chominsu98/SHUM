<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Duration" %>
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>My 페이지</title>


	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


	<script type="text/javascript" src="/main_page/assets/qrcode/jquery.min.js"></script>
	<script type="text/javascript" src="/main_page/assets/qrcode/qrcode.js"></script>

	<style>
		#main > header p {
			color: inherit;
			letter-spacing: 0em;
			text-transform: uppercase;
			top: 0;
		}

		h5 {
			font-size: 1.4em;
			line-height: 0.5em;
		}


		input[type="submit"].primary, input[type="reset"].primary, input[type="button"].primary, button.primary, .button.primary {
			background-color: #212529;
			box-shadow: none !important;
			color: #ffffff !important;
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
			font-family: 'Do Hyeon', sans-serif !important;
			color:white;
		}
		.table>:not(caption)>*>*{
			padding:1.4rem 0.5rem;
		}
		table tr{
			cursor:pointer;
		}


		.spotlight:nth-child(2) {
			background-color: rgb(0 0 0 / 0%);
		}
	</style>
</head>
<body class="is-preload">
<div id="page-wrapper">
	<jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

	<!-- Main -->
	<article id="main">
		<header>
			<h2>마이 페이지</h2>
		</header>

		<section class="wrapper style5">
			<h2>${user.name}님</h2>
			<c:choose>
				<c:when test="${user.state == true}">
					<h4>${umbrella.umbrella.id}번 우산을 대여 중입니다.</h4>
				</c:when>
				<c:otherwise>
					<h4>대여중인 우산이 없습니다.</h4>
				</c:otherwise>
			</c:choose>

			<button type="button" onclick="location.href='/'">메인 화면으로</button>
			<button type="button" onclick="history.back()">뒤로 가기</button>
		</section>

		<section id="one" class="wrapper style1 special">
			<div class="inner">
				<c:choose>
					<c:when test="${user.haveTicket == true}">
						<c:choose>
							<c:when test="${voucher.voucherStartDate != null}">
								<c:set var="returnTime" value="${voucher.voucherStartDate}"/>
								<%
									LocalDateTime returnTime = (LocalDateTime)pageContext.getAttribute("returnTime");

									returnTime = returnTime.plusDays(1);
									System.out.println(returnTime);

									long hour, min, sec;

									Duration duration = Duration.between(LocalDateTime.now(), returnTime);
									sec = duration.getSeconds();

									min = sec / 60;
									sec = sec % 60;

									hour = min / 60;
									min = min % 60;
								%>
								<table class="table table-hover">
									<thead class="head-background">

									<tr >
										<th colspan=2 scope="col">예약번호:12345432345</th>
									</tr>
									</thead>
									<tbody>
									<tr class="moveto_ticket">
										<th scope="row">🌧이용권명:</th>
										<td>📆${voucher.ticketType}</td>

									</tr>
									<tr class="moveto_ticket">
										<th scope="row">🌧사용가능시간:</th>
										<td>🕒24시간</td>

									</tr>
									<tr>
										<th scope="row">📢남은시간</th>
										<td>🕒<%=hour%>시간 <%=min%>분</td>

									</tr>
									<tr>
										<th scope="row">📢이용자명</th>
										<td>😀${user.name}</td>

									</tr>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<table class="table table-hover">
									<thead class="head-background">

									<tr >
										<th colspan=2 scope="col">예약번호:12345432345</th>
									</tr>
									</thead>
									<tbody>
									<tr class="moveto_ticket">
										<th scope="row">🌧이용권명:</th>
										<td>📆${voucher.ticketType}</td>

									</tr>
									<tr class="moveto_ticket">
										<th scope="row">🌧사용가능시간:</th>
										<td>🕒24시간</td>

									</tr>
									<tr>
										<th scope="row">📢남은시간</th>
										<td>🕒사용 전</td>

									</tr>
									<tr>
										<th scope="row">📢이용자명</th>
										<td>😀${user.name}</td>

									</tr>
									</tbody>
								</table>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<h2>구매한 이용권이 없습니다.</h2>
						<a href="/charge/payform/day" class="button fit ">구매하러 가기</a>
					</c:otherwise>
				</c:choose>
			</div>
		</section>

		<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>
	</article>
</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>
<script type="text/javascript">

	var qrcode = new QRCode(document.getElementById("qrcode"), {
		width : 100,
		height : 100
	});

	function makeCode () {
		var elText = document.getElementById("text");



		qrcode.makeCode("내이름은조민수");
	}

	makeCode();

</script>

</body>
</html>