<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/finalTest.css">
<title>통나무 펜션 예약하기</title>
</head>
<body>
	<div id="wrap" class="container">
            <header class="bg-light d-flex justify-content-center align-items-center">
                <div class="display-4">통나무 팬션</div>
            </header>
            <nav>
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약안내</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">커뮤니티</a></li>
                </ul>
            </nav>
            
            <h2 class="text-center">예약하기</h2>
            <form method="post" action="/lesson06/test03/add_booking" id="joinForm">
            	<label class="w-75">이름 <input type="text" class="form-control" name="name" id="nameInput"></label><br>
            	<label class="w-75">예약날짜 <input type="text" class="form-control" name="date" id="dateInput"></label><br>
            	<label class="w-75">숙박일수 <input type="text" class="form-control" name="day" id="dayInput"></label><br>
            	<label class="w-75">숙박인원 <input type="text" class="form-control" name="headcount" id="headcountInput"></label><br>
            	<label class="w-75">전화번호 <input type="text" class="form-control" name="phoneNumber" id="phoneNumberInput"></label><br>
           		
           		<button type="button" id="addBooking" class="btn btn-warning btn-block">예약하기</button>
            </form>
     </div>
     
     
     
     <script>
     	$(document).ready(function(){
     		
     		$("#dateInput").datepicker({
     			dateFormat : "yy-mm-dd"
     			,changeMonth : true
     			,changeYear : true
     		});
     		
     		
     		$("#addBooking").on("click", function(){
     			let name = $("#nameInput").val();
     			let date = $("#dateInput").val();
     			let day = $("#dayInput").val();
     			let headcount = $("#headcountInput").val();
     			let phoneNumber = $("#phoneNumberInput").val();
     			
     			if(name == "") {
     				alert("이름을 입력하세요.");
     				return;
     			}
     			if(date == "") {
     				alert("예약날짜를 입력하세요.");
     				return;
     			}
     			if(day == "") {
     				alert("숙박일수를 입력하세요.");
     				return;
     			}
     			if(isNaN(headcount)) {
     				alert("숙박인원은 숫자만 입력하세요.");
     				return;
     			}
     			if(phoneNumber == "") {
     				alert("전화번호를 입력하세요.");
     				return;
     			}
     			
     			$.ajax({
     				type:"get"
     				,url:"/lesson06/test03/add_booking"
     				,data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
     				,success:function(data){
     					if(data.result == "success") {
     						alert("입력 성공");
     					} else {
     						alert("입력 실패")
     					}
     				}
     				,error:function(){
     					alert("에러발생");
     				}
     			});
     		});
     		
     		
     	});
     </script>
</body>
</html>