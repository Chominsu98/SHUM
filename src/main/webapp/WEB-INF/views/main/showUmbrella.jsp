<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>대여 가능 우산 확인</title>
</head>
<body>
<h2>대여 가능 우산</h2>
<table border="1">
    <tr>
        <th>우산 번호</th><th>대여하기</th>
    <c:forEach var="umbrella" items="${booth.umbrellas}">
        <c:choose>
            <c:when test="${umbrella.rentalState == false && umbrella.brokenState == false}">
                <tr>
                    <td>${umbrella.umbrellaNumber}번 우산</td>
                    <td><button type="button" onclick="location.href='/main/umbrellaRental/${booth.id}/${umbrella.id}'">대여하기</button></td>
                </tr>
            </c:when>
        </c:choose>
    </c:forEach>

    <button type="button" onclick="location.href='/'">메인 화면으로</button>
    <button type="button" onclick="history.back()">뒤로 가기</button>

</table>
</body>
</html>