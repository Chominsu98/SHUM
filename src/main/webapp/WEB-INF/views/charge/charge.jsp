<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>돈 충전</title>
</head>
<body>
<h2>돈 충전</h2>

<form action="/charge/charge" method="post">
    <h4>얼마를 충전하시겠습니까?</h4>
    <input type="text" name="chargeMoney"/>
    <button>충전</button>
</form>
<button type="button" onclick="location.href='/'">메인 화면으로</button>
<button type="button" onclick="history.back()">뒤로 가기</button>

</body>
</html>