<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>우산 반납하기</title>
</head>
<body>
    <h2>우산 반납하기</h2>

    <form action="/return/umbrellaReturn/${booth.id}" method="post">
        <h4>${booth.id}번 부스에 반납하시겠습니까? </h4>
        <button>반납</button>
    </form>
    <button type="button" onclick="location.href='/'">메인 화면으로</button>
    <button type="button" onclick="history.back()">뒤로 가기</button>

</body>
</html>