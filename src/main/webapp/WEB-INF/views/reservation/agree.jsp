<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="../resources/js/jquery-3.6.0.js"></script>

</head>
<body>

	<h1>좌석 예약 약관 동의 페이지 입니다</h1>
	<br>
	<hr>
	<br>
	<h3>주의사항</h3>
	<h3>약관 동의하기</h3>
	<form action="${contextPath}/reservation/seatPage">
		<button>좌석보기</button>
	</form>

</body>
</html>