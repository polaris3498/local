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
<script type="text/javascript">
	$(function(){
		// 수정페이지
		$('#btnChangePage').on('click', function(){
			location.href='${contextPath}/admin/bookChangePage?bookNo=${book.bookNo}&value=${value}';
		})
		
		// 목록
		$('#btnList').on('click', function(){
			location.href='${contextPath}/admin/bookList?value=${value}';
		})
		
		
		
	})
	
	
	
	
</script>

</head>
<body>
	<h1>책 상세 보기</h1>
	
	번호 ${book.bookNo}<br>
	ISBN ${book.bookIsbn}<br>
	제목 ${book.bookTitle}<br>
	작가 ${book.bookAuthor}<br>
	출판사 ${book.bookPublisher}<br>
	출판날짜 ${book.bookPubdate}<br>
	설명 ${book.bookDescription}<br>
	이미지주소 ${book.bookImage}<br>
	분야 ${book.bookField}<br>
	
	<input type="button" value="수정페이지" id="btnChangePage">
	<input type="button" value="목록" id="btnList">
</body>
</html>