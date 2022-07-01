<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ok {
		color: limegreen;
	}
	.dont {
		color: crimson;
	}
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	
	// 페이지 로드 이벤트
	$(function(){
	
		fnIsbnCheck();
		fnBookAdd();
	})
	
	
	// 함수
	
	// 2. 책추가
	function fnBookAdd(){
		$('#f').on('submit', function(event){
			if(isbnPass == false){
				alert('형식에 맞지 않는 ISBN입니다.');
				event.preventDefault();
				return false;
			} else if(isbnOverlapPass == false){
				alert('이미 등록된 ISBN입니다.');
				event.preventDefault();
				return false;
			} else if($('#isbn').val() == '' || $('#title').val() == '' || $('#author').val() == '' || $('#publisher').val() == '' || $('#pubdate').val() == '' || $('#description').val() == '' || $('#image').val() == '' || $('#field').val() == ''){
				alert('내용을 모두 입력해주세요.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}

	
	// 1. ISBN 정규식 & 중복체크
	let isbnOverlapPass = false;
	let isbnPass = false;
	function fnIsbnCheck(){
		$('#isbn').on('keyup', function(){
			// 정규식 체크하기
			let regIsbn = /^[0-9]{1,10}$/;  // 소문자 1~32자 사이(실제 서비스는 바꿔야 함)
			if(regIsbn.test($('#isbn').val())==false){
				$('#isbnMsg').text('ISBN은 숫자 1~10자입니다.').addClass('dont').removeClass('ok');
				isbnPass = false;
				return;
			}
			// isbn 중복 체크
			$.ajax({
				url: '${contextPath}/admin/bookIsbnCheck',
				type: 'get',
				data: 'isbn=' + $('#isbn').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#isbnMsg').text('멋진 Isbn이네요!').addClass('ok').removeClass('dont');
						isbnPass = true;
						isbnOverlapPass = true;
					} else {
						$('#isbnMsg').text('이미 사용중인 ISBN입니다.').addClass('dont').removeClass('ok');
						isbnPass = true;
						isbnOverlapPass = false;
					}
				},
				error: function(jqXHR){
					$('#isbnMsg').text(jqXHR.responseText).addClass('dont').removeClass('ok');
					isbnPass = true;
					isbnOverlapPass = false;
				}
			})
		})
	}
	
	
</script>
</head>
<body>
	
	
	
	<h1>책추가화면</h1>
	
	<form id="f" action="${contextPath}/admin/bookSave?value=${value}" method="post">
		<label for="isbn">
			ISBN<br>
			<input type="text" name="isbn" id="isbn"><br>
			<span id="isbnMsg"></span>
		</label><br><br>
		<input type="text" name="title" id="title" placeholder="제목"><br>
		<input type="text" name="author" id="author" placeholder="작가"><br>
		<input type="text" name="publisher" id="publisher" placeholder="출판사"><br>
		<input type="text" name="pubdate" id="pubdate" placeholder="출판날짜"><br>
		<input type="text" name="description" id="description" placeholder="설명"><br>
		<input type="text" name="image" id="image" placeholder="이미지주소"><br>
		<input type="text" name="field" id="field" placeholder="분야"><br>
		<button>작성완료</button>
	</form>
	
</body>
</html>