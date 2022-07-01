<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

	<form id='f' action="${contextPath}/member/login" method="post" >
	
		<input type="hidden" name="url" value="${url}">
		
		아이디
		<input type="text" name="id" id="id">
		
		비밀번호
		<input type="password" name="pw" id="pw">
		
		<button>로그인</button>
		
		<label for="rememberId"><input type="checkbox" id="rememberId">아이디 저장</label>
		
	</form>

	<div>
		<a href="${contextPath}/member/findIdPage">아이디 찾기</a> | 
		<a href="${contextPath}/member/findPwPage">비밀번호 찾기</a> | 
		<a href="${contextPath}/member/agreePage">회원가입</a>
	</div>
	
</body>
</html>