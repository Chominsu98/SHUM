<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Shum</title>
</head>
<body>
<h2>마이 페이지</h2>

<form class="myPage">
	<h2>${user.name}님</h2>
	<h4>잔액 : ${user.money}원</h4>
	<c:choose>
		<c:when test="${user.state == true}">
			<h4>${umbrella.umbrella.id}번 우산을 대여 중입니다.</h4>
			<form class="login__input">
				<button type="button" onclick="location.href='/return/returnshowBooth'">반납하기</button>
				<button type="button" onclick="location.href='/report/breakdownReport'">고장 신고</button>
				<button type="button" onclick="location.href='/charge/charge'">돈 충전</button>
				<button type="button" onclick="location.href='/logout'">로그아웃</button>
			</form>
		</c:when>
		<c:otherwise>
			<h4>대여중인 우산이 없습니다.</h4>
			<form class="login__input">
				<button type="button" onclick="location.href='/rental/rentalshowBooth'">대여 하기</button>
				<button type="button" onclick="location.href='/charge/charge'">돈 충전</button>
				<button type="button" onclick="location.href='/logout'">로그아웃</button>
			</form>
		</c:otherwise>
	</c:choose>
</form>
<button type="button" onclick="location.href='/'">메인 화면으로</button>
<button type="button" onclick="history.back()">뒤로 가기</button>

</body>
</html>