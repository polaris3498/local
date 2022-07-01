<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
	
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	// 페이지 로드
	$(document).ready(function(){
		fnReserveCheck();
	})
	
	
	// 함수
	
	// 1. 좌석 번호 가져와서 seatStatus, seatUsingState 파악하기.
	
	function fnReserveCheck(){
		$('.td').on('click', function(){
			
			$.ajax({
				url: '${contextPath}/reservation/reserveCheck',
				type: 'GET',
				data: 'seatNo=' + $(this).text(),
				dataType: 'json',
				success: function(obj){
					if(obj.seats.seatStatus == 1 && obj.seats.seatUsingState == 1) {
						
						if(confirm(obj.seats.seatNo + '번 좌석을 예약할까요?')){
							alert('예약되었습니다.');
							location.href='${contextPath}/reservation/upSeatUsingState?seatNo=' + obj.seats.seatNo;
							
						}
					}
				}
			})
			
		})
	}
	
</script>
</head>
<body>

	<br><h3>여기에 좌석 선택 클릭화면 띄우기</h3>

	<h2> 아래에서 해당 좌석을 클릭하여 좌석선택해요</h2>
    <table border="1">
    	<caption>좌석표</caption>
    	<thead>
    		<tr>
    			<td colspan="10">출입문  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    앞</td>
    		</tr>
    	</thead>
    	<tbody class="tbody">
    		
    			<tr>
    				<c:forEach begin="0" end="9" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="10" end="19" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="20" end="29" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="30" end="39" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="40" end="49" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="50" end="59" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="60" end="69" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="70" end="79" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}</td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="80" end="89" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}<i class="fa-solid fa-trash-can"></i></td>
    				</c:forEach>
    			</tr>
    			<tr>
    				<c:forEach begin="90" end="99" items="${seats}" var="seat">
    					<td class="td">${seat.seatNo}<i class="fa-solid fa-trash-can"></i></td>
    				</c:forEach>
    			</tr>
    	</tbody>
    	<tfoot>
    		<tr>
    			<td colspan="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뒤</td>
    		</tr>
    	</tfoot>
    </table>
</body>
</html>