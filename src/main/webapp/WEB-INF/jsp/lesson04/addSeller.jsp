<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>회원정보 추가</title>
</head>
<body>
	<div class="container">
		<h1>판매자 추가</h1>
		
		<form method="post" action="/lesson04/test01/add_seller"> <%-- action을 통해 /lesson04/ex01/add_user controller에 있는 이 부분으로 자료들을 넘겨준다 --%>
			<label>닉네임 : </label> <input type="text" class="form-control" name="nickname"> 
			<label>프로필사진 url : </label> <input type="text" class="form-control" name="profileImageUrl">
			<label>온도 : </label><input type="text" class="form-control" name="temperature">
			
			<input type="submit" value="추가" class="btn btn-success">
		</form>
		
	</div>
</body>
</html>