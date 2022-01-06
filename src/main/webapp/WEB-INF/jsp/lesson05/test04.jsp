<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
</head>
<body>
	<div class="conatiner">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="members" items="${members}" varStatus="status" >
					<tr>
						<td>${status.count}</td>
						<td>${members.name}</td>
						
						<c:set var="phoneNumber" value="${members.phoneNumber}" />
						<c:choose>
							<c:when test="${fn:startsWith(phoneNumber,'010')}" >
								<td>${members.phoneNumber}</td>
							</c:when>
							<c:otherwise>
								<td>유효하지 않은 전화번호</td>
							</c:otherwise>
						</c:choose>
						
						<c:set var="nationality" value="${members.nationality}" />
						<td>${fn:replace(nationality, "삼국시대", "삼국-") }</td>
						
						<c:set var="email" value="${members.email}" />
						<td><b>${fn:split(email, "@")[0]}</b>@${fn:split(email, "@")[1]}</td>
						<td>${members.introduce}</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
	</div>
</body>
</html>