<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가</h1>
		<form method="post" action="/lesson06/test01/add_favorite" id="joinForm">
			<label class="w-100">제목: <input type="text" class="form-control" name="name" id="nameInput"></label><br>
			<label class="w-75">주소: <input type="text" class="form-control" name="url" id="urlInput"></label>
			<button type="button" id="duplicateBtn" class="btn btn-warning">중복확인</button>
			<br>
			<small id="DuplicationText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableText" class="text-success d-none">저장 가능한 url 입니다.</small>
			<div class="mt-3">
				<button type="button" id="addFavorite" class="btn btn-success btn-block mt-3">추가</button>
			</div>
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
			
			var isDuplicateUrl = true;
			
			$("#addFavorite").on("click", function() { //submit말고 buttonclick 이벤트로 하는게 오류찾기 더 좋다. 다만 엔터로 버튼클릭은 불가
				
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				//validation check
				if(name == "") {
					alert("사이트 제목을 입력하세요");
					return;
				}
				if(isDuplicateUrl) {
					alert("중복된 사이트입니다.");
					return;
				}
				if(url == "") {
					alert("사이트 주소를 입력하세요");
					return;
				}

				if(!(url.startsWith("http://") || url.startsWith("https://"))) {
					alert("주소 형식이 잘못 되었습니다.");
					return;
				}
				

				$.ajax({
					type:"post"
					,url:"/lesson06/test01/add_favorite"
					,data:{"name":name, "url":url}
					,success:function(data){
						if(data == "success") {
							alert("입력 성공");
							location.href = "/lesson06/test01/favorite_list_view"; // 즐겨찾기 목록으로 이동
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
			
			
			$("#duplicateBtn").on("click", function() {
				let url = $("#urlInput").val();
				
				if (url == "") {
					alert("url을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					,url:"/lesson06/test02/duplicate_url"
					,data:{"url":url}
					,success:function(data) {
						if(data.isDuplicate == "true") {
							isDuplicateUrl = true;
							$('#DuplicationText').removeClass('d-none');
							$('#availableText').addClass('d-none');
						} else {
							isDuplicateUrl = false;
							$('#availableText').removeClass('d-none');
							$('#DuplicationText').addClass('d-none');
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