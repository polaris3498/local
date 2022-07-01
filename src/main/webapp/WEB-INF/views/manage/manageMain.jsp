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
<script>
	
	$(function(){
		
	})

</script>
<style>
	
   
  
</style>
</head>
<body>
	
	<a href="${contextPath}/admin/memberList?value=15">활동회원관리</a>
	<a href="${contextPath}/admin/dormantMemberList?value=15">휴면회원관리</a>
	<a href="${contextPath}/admin/signOutMemberList?value=15">탈퇴회원관리</a>
	<a href="${contextPath}/admin/bookList?value=15">도서관리</a>
	
	
	
																	
</body>
</html>