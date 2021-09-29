<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>우산 대여하기</title>
</head>
<body>
    <h2>우산 대여하기</h2>

    <form action="/main/umbrellaRental/${booth.id}/${umbrella.id}" method="post">
        <h4>${user.name}님의 잔액은 ${user.money}원 입니다. </h4>
        <h4>대여하시겠습니까?</h4>
        <button>대여</button>
    </form>
    <button type="button" onclick="location.href='/'">메인 화면으로</button>
    <button type="button" onclick="history.back()">뒤로 가기</button>

</body>
</html>