<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 라이브러리</title>
</head>
<body>
	<!-- 1번 -->
	<h1>1. JSTL core 변수</h1>
	<c:set var="number1" value="36" />
	<h4>첫번째 숫자 : ${number1}</h4>
	<c:set var="number2" value="3" />
	<h4>두번째 숫자 : ${number1}</h4>
	
	<!-- 2번 -->
	<h1>2. JSTL core 연산</h1>
	<h4>더하기 : ${number1 + number2}</h4>
	<h4>빼기 : ${number1 - number2}</h4>
	<h4>곱하기 : ${number1 * number2}</h4>
	<h4>나누기 : ${number1 / number2}</h4>
	
	<!-- 3번 -->
	<h1>3. core out</h1>
	<c:out value="<script>JSTL core out</script>" />
	
	<!-- 4번 -->
	<h1>3. core if</h1>
	<c:set var="number3" value="${(number1 + number2) / 2}" />
	<c:if test="${number3 > 10}">
		<h1>평균값 : ${number3}</h1>
	</c:if>
	<c:if test="${number3 < 10}">
		<h1>평균값 : ${number3}</h1>
	</c:if>
	
	<!-- 5번 -->
	<c:if test="${(number1 * number2) > 100 }">
		<c:out value="<script>alert('너무 큰 수입니다.')</script>" escapeXml="false" />
	</c:if>
</body>
</html>