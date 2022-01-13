<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favorite}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${favorite.name}</td>
						<td><a href="${favorite.url}">${favorite.url}</a></td>
						<td>
							<button type="button" class="btn btn-danger btn-sm deleteBtn" data-favorite-id="${favoerite.id}">삭제</button> 
							<%--id="deleteBtn"를 쓰면 다들 동일한 값을 가진다. 어떤 삭제 버튼을 눌렀는지 모른다. class에 deleteBtn을 넣어서 해결 가능 --%>
							<%-- 반복문 돌리면서 가져온 favoerite.id를 추가해서 버튼마다 다른 value를 넣으랴고 했는데... value대신 data속성으로 아래에서 $(this).data("favorite-id") 이렇게 사용 가능 --%>
							<%-- data- 하고 뒤에 내가 원하는 이름 지어주기 --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function(){
			//여러개의 버튼에서 삭제하기
			$(".deleteBtn").on("click", function(){ // id가 아닌 class로 접근해서 .deleteBtn다 #아님
				var id = $(this).data("favorite-id"); //this를 넣으면 많은 삭제버튼중에서 누른 특정버튼에 대한 객체를 가져올 수 있다.
				// 아이디 받아오는 방식 확인
				
				$.ajax({
					type:"get"
					,url:"/lesson06/test02/delete_favorite"
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
				return false;
			});
			
		});
	</script>
</body>
</html>