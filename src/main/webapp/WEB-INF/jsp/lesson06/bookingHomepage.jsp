<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <section class="banner bg-info">
                <img id="bannerImage" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" alt="banner" width="1110px" height="500px">
            </section>
            <section class="reserve bg-primary d-flex">
                <section class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
                    <div class="display-4 text-white">실시간<br>예약하기</div>
                </section>
                <section class="confirm col-4">
                    <!-- 예약 확인, 회원 비회원 라디오 버튼 -->
                    <div class="m-3">
                        <span class="reserve-confirm mr-3">예약 확인</span>

                    </div>

                    <!-- 아이디 비밀번호(회원용)-->
                    <div id="memberInputBox" class="m-2">
                        <div class="d-flex justify-content-end mr-3">
                            <span class="text-white">아이디:</span>
                            <input type="text" id="id" class="form-control input-form">
                        </div>
                        <div class="d-flex mt-2 justify-content-end mr-3">
                            <span class="text-white">비밀번호:</span>
                            <input type="password" id="password" class="form-control input-form">
                        </div>

                        <!-- 버튼 -->
                        <div class="text-right mt-3">
                            <button type="button" class="btn btn-success submit-btn">조회 하기</button>
                        </div>
                    </div>

                </section>
                <section class="inquiry col-4 d-flex justify-content-center align-items-center">
                    <div class="text-white">
                        <h4 class="font-weight-bold">예약문의:</h4>
                        <h1>010-<br>0000-1111</h1>
                    </div>
                </section>
            </section>
            <footer>
                <div class="address m-3">
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
                </div>
            </footer>
        </div>

        <script>
            $(document).ready(function() {

                $('.submit-btn').on('click', function() {
                    e.preventDefault();
					
                    let name = $("#name").val();
                    let phoneNumber = $("#phoneNumber").val();
                    
                     if ($('#name').val().trim() == '') {
                         alert("이름 입력하세요");
                         return;
                     }

                     if ($('#phoneNumber').val() == '') {
                         alert("전화번호를 입력하세요");
                         return;
                     }
                     
                     $.ajax({
                    	type:"get" 
                    	,url:"/lesson06/test03/check_booking"
                    	,data{"name":name, "phoneNumber":phoneNumber}
                     	,success:function(data){
                     		if(data.check == "true"){
                     			alert("있는 예약");
                     		} else{
                     			alert("없는 예약");
                     		}
                     	}
                     	,error:function(){
    						alert("에러발생");
    					}
                     });
                 }
                
                
                
                        //-- 두번째 방법
                        if ($('#phoneNumber').val().startsWith('010') === false) {
                            alert("010으로 시작하는 번호만 입력 가능합니다.");
                            return;
                        }
                    }
                });

                // 4. 이미지 3초 간격으로 변경하기

                var bannerSrcArr = ['http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg', 'http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner2.jpg', 'http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner3.jpg', 'http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner4.jpg'];
                var currentIndex = 0;
                setInterval(function() {
                    $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
                    currentIndex++;

                    if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
                        currentIndex = 0;
                    }
                }, 3000); // 3초에 한번씩 함수 실행

            });
            
            
            

        </script>
    </body>
</html>