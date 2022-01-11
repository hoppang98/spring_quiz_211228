<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가</h1>
		<form method="post" action="/lesson06/test01/add_favorite" id="joinForm">
			<label class="w-50">제목: <input type="text" class="form-control" name="name" id="nameInput"></label><br>
			<label class="w-50">주소: <input type="text" class="form-control" name="url" id="urlInput"></label>
			
			<div class="mt-3">
				<button type="submit" id="submitBtn">추가</button>
			</div>
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#joinForm").on("submit", function() {
				
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				if(name == "") {
					alert("사이트 제목을 입력하세요");
					return false;
				}
				if(url == "") {
					alert("사이트 주소를 입력하세요");
					return false;
				}
				
				$.ajax({
					type:"post"
					,url:"/lesson06/test01/add_favorite"
					,data:{"name":name, "url":url}
					,success:function(data){
						if(data == "success") {
							alert("입력 성공");
						} else {
							alert("입력실패");
						}
					}
					,error:function() {
						alert("에러발생");
					}
					
				});
				return false;
			});
		});
		
		
	</script>
</body>
</html>