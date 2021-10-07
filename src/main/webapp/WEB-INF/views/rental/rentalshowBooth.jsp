<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>부스 목록</title>
</head>
<body>
<h2>부스 목록</h2>
<table border="1">
    <tr>
        <th>부스 이름</th><th>전체 우산</th><th>남은 우산</th><th>고장난 우산</th><th>위도</th><th>경도</th>
    <c:forEach var="s" items="${booth}">
        <tr>
            <td><button type="button" onclick="location.href='/rental/showUmbrella/${s.id}'">${s.boothName}</button></td>
            <td>${s.totalUmbrella}</td>
            <td>${s.leftFreeUmbrella + s.leftLocationUmbrella}</td>
            <td>${s.brokenUmbrella}</td>
            <td>${s.latitude}</td>
            <td>${s.longitude}</td>
        </tr>
    </c:forEach>


    <button type="button" onclick="location.href='/'">메인 화면으로</button>
</table>
</body>
</html>