<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/weatherStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">

<title>과거 날씨 조회</title>
</head>
<body>
	<div id="wrap">
		<div class="content d-flex">
			<nav class="col-2">
				<div class="logo d-flex dustify-content-center mt-3">
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png"
						width="25"> 
					<span class="text-white font-weight-bold ml-2">기상청</span>
				</div>
				
				<ul class="nav flex-column mt-4">
					<li class="nav-item"><a href="/lesson05/weatherView" class="nav-link menu-font">날씨</a></li>
					<li class="nav-item"><a href="/lesson05/addWeather" class="nav-link menu-font">날씨입력</a></li>
					<li class="nav-item"><a href="#" class="nav-link menu-font">테마날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link menu-font">관측기후</a></li>
				</ul>
			</nav>

	
		<section class="weather-history col-10 mt-3 ml-5">
			<h3>과거 날씨</h3>
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="weatherList" items="${weatherList}" varStatus="status">
						<tr>
						
							<td>
								<fmt:formatDate value="${weatherList.date}" pattern="yyyy년 M월 dd일"/>
							</td>
							
							<td>
								<c:if test="${weatherList.weather == '비'}" >
									<img src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg">
								</c:if>
								<c:if test="${weatherList.weather == '맑음'}" >
									<img src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg">
								</c:if>
								<c:if test="${weatherList.weather == '구름조금'}" >
									<img src="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg">
								</c:if>
								<c:if test="${weatherList.weather == '흐림'}" >
									<img src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg">
								</c:if>
							</td>
							<td>${weatherList.temperatures}℃</td>
							<td>${weatherList.precipitation}mm</td>
							<td>${weatherList.microDust}</td>
							<td>${weatherList.windSpeed}km/h</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		</div>
		<footer class="d-flex align-items-center">
			<div class="footer-logo ml-4">
				<img class="foot-logo-image" src="https://www.weather.go.kr/w/resources/image/foot_logo.png" width="120">
			</div>
			<div class="copyright ml-4">
				<small class="text-secondary"> 
					(07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright@2020 KMA. All Rights RESERVED.
				</small>
			</div>
		</footer>
	</div>
</body>
</html>