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
	#holder{    
	height:350px;    
	width:850px;
	background-color:#F5F5F5;
	border:1px solid #A4A4A4;
	margin-left:10px;   
	}
	#place {
	position:relative;
	margin:7px;
	}
	#place a{
	font-size:0.6em;
	}
	#place li
	{
	 list-style: none outside none;
	 position: absolute;   
	}    
	#place li:hover
	{
	background-color:yellow;      
	} 
	#place .seat{
	background:url("") no-repeat scroll 0 0 transparent;
	height:33px;
	width:33px;
	display:block;   
	}
	#place .selectedSeat
	{ 
	background-image:url("");          
	}
	#place .selectingSeat
	{ 
	background-image:url("");        
	}
	#place .row-3, #place .row-4{
	margin-top:10px;
	}
	#seatDescription li{
	verticle-align:middle;    
	list-style: none outside none;
	padding-left:35px;
	height:35px;
	float:left;
	}
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function(){
		
		var settings = {
	               rows: 10,
	               cols: 10,
	               rowCssPrefix: 'row-',
	               colCssPrefix: 'col-',
	               seatWidth: 35,
	               seatHeight: 35,
	               seatCss: 'seat',
	               selectedSeatCss: 'selectedSeat',
	               selectingSeatCss: 'selectingSeat'
	           };
	
		var init = function (reservedSeat) {
            var str = [], seatNo, className;
            for (i = 0; i < settings.rows; i++) {
                for (j = 0; j < settings.cols; j++) {
                    seatNo = (i + j * settings.rows + 1);
                    className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                    if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                        className += ' ' + settings.selectedSeatCss;
                    }
                    str.push('<li class="' + className + '"' +
                              'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                              '<a title="' + seatNo + '">' + seatNo + '</a>' +
                              '</li>');
                }
            }
            $('#place').html(str.join(''));
        };
        //case I: Show from starting
        //init();

        //Case II: If already booked
        var bookedSeats = [5, 10, 25];
        init(bookedSeats);

        
        
        
        
        $('.' + settings.seatCss).click(function () {
        	if ($(this).hasClass(settings.selectedSeatCss)){
        	    alert('This seat is already reserved');
        	}
        	else{
        	    $(this).toggleClass(settings.selectingSeatCss);
        	    }
        	});
        	 
        	$('#btnShow').click(function () {
        	    var str = [];
        	    $.each($('#place li.' + settings.selectedSeatCss + ' a, #place li.'+ settings.selectingSeatCss + ' a'), function (index, value) {
        	        str.push($(this).attr('title'));
        	    });
        	    alert(str.join(','));
        	})
        	 
        	$('#btnShowNew').click(function () {
        	    var str = [], item;
        	    $.each($('#place li.' + settings.selectingSeatCss + ' a'), function (index, value) {
        	        item = $(this).attr('title');                   
        	        str.push(item);                   
        	    });
        	    alert(str.join(','));
        	})
	})
	
	

	
</script>
</head>
<body>
	<i class="fa-solid fa-trash-can"></i>
	<i class="fa-solid fa-trash"></i>
	<i class="fa-solid fa-seat-airline"></i>
	<h2> Choose seats by clicking the corresponding seat in the layout below:</h2>
    <div id="holder"> 
        <ul  id="place">
        </ul>    
    </div>
    <div style="float:left;"> 
    <ul id="seatDescription">
        <li style="background:url('') no-repeat scroll 0 0 transparent;">Available Seat</li>
        <li style="background:url('') no-repeat scroll 0 0 transparent;">Booked Seat</li>
        <li style="background:url('') no-repeat scroll 0 0 transparent;">Selected Seat</li>
    </ul>
    </div>
        <div style="clear:both;width:100%">
        <input type="button" id="btnShowNew" value="Show Selected Seats" />
        <input type="button" id="btnShow" value="Show All" />           
        </div>

</body>
</html>