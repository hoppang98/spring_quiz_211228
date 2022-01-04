<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>공인중개사 정보</title>
</head>
<body>
	<h1>공인중개사 정보</h1>
	
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<td>${result.id}</td>
			</tr>
			<tr>
				<th>상호명</th>
				<td>${result.office}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${result.phoneNumber}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${result.address}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${result.grade}</td>
			</tr>
		</table>
		
	</div>
</body>
</html>