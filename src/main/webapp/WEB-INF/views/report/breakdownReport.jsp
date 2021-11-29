<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Shum</title>
</head>
<body>
<h2>고장 신고하기</h2>

<form class="reportPage" action="/report/breakdownReport" method="post">
    <h2>${umbrella.umbrella.id}번 우산을 고장 신고 하시겠습니까?</h2>
    <h4>어떤 부분이 고장났는지 알려주시면 수리에 큰 도움이 됩니다.</h4>
    <input type="text" name="message" />
    <h4>고장 신고 후 가까운 부스의 수거함에 넣어주세요</h4>
    <button>고장 신고하기</button>
</form>
<button type="button" onclick="location.href='/'">메인 화면으로</button>
<button type="button" onclick="history.back()">뒤로 가기</button>

</body>
</html>