<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>통나무 팬션</title>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/finalTest.css">
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
            
            <h2 class="text-center mt-3">예약 목록 보기</h2>
            <table class="table text-center mt-3">
            	<thead>
            		<tr>
            			<th>이름</th>
            			<th>예약 날짜</th>
            			<th>숙박일수</th>
            			<th>숙박인원</th>
            			<th>전화번호</th>
            			<th>예약상태</th>
            		</tr>
            	</thead>
            	<tbody>
            		<c:forEach var="booking" items="${booking}" varStatus="status">
            			<tr>
            				<td>${booking.name}</td>
            				<td>
            					<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 dd일"/>
            				</td>
            				<td>${booking.day}</td>
            				<td>${booking.headcount}</td>
            				<td>${booking.phoneNumber}</td>
      
            					<c:choose>
            						<c:when test="${booking.state eq '대기중'}" >
            							<td class="text-danger">${booking.state}</td>
            						</c:when>
            						<c:when test="${booking.state eq '확정'}" >
            							<td class="text-warning">${booking.state}</td>
            						</c:when>
            					
            					</c:choose>
            				
            				<td>
            					<button type="button" class="btn btn-danger btn-sm deleteBtn" data-booking-id="${booking.id }">삭제</button>
            				</td>
            				
            			</tr>
            		</c:forEach>
            	</tbody>
            </table>
	</div>
	
	<script>
		$(document).ready(function(){
			$(".deleteBtn").on("click", function(){
				let id = $(this).data("booking-id");
				
				$.ajax({
					type:"get"
					,url:"/lesson06/test03/delete_booking"
					,data:{"id":id}
					,success:function(data) {
						if(data == "success") {
							alert("삭제 성공");
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					,error:function(){
						alert("에러 발생");
					}
				});
			});
		});
	</script>
            
</body>
</html>