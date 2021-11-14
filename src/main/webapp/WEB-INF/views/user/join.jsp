<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 회원가입</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/user.css">
</head>
<body>
	<form name="frm" class="join_action" action="/join" method="post" id="myForm"> <br>
		<div id="container" class="container">
			<h1 id="title">회원 가입</h1>
			<div class="form-group">
				<label>아이디:</label> <input type="text" name="username" class="form-control" 
					placeholder="아이디를 입력하세요" required="required" maxlength="20" id="username">
					<div>
						<button type="button" class="btn btn-dark float-right" id="btnIdDupChk">아이디 중복 확인</button><br>
					</div>
			</div>
			<div class="form-group">
				<label >비밀번호:</label> <input type="password" name="password" 
					class="form-control" placeholder="비밀번호를 입력하세요" required="required">
			</div>
			<div class="form-group">
				<p>이메일:</p> <input type="email" class="form-control" name="email" 
					placeholder="이메일을 입력하세요" required="required" maxlength="50" id="email">
					<div>
						<button type="button" class="btn btn-dark float-right" id="btnEmDupChk">이메일 중복 확인</button> <br>
					</div>
			</div>
			<p>성별:</p>
			<div class="form-check">
				<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="gender" value="male">남성
				</label>
			</div>
			<div class="form-check">
				<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="gender" value="female">여성
				</label>
			</div> <br>
			<div class="form-group">
				<label for="age">나이:</label> <select class="form-control" name="age">
					<option value='10' selected>19세 이하</option>
					<option value='20'>20~29세</option>
					<option value='30'>30~39세</option>
					<option value='40'>40~49세</option>
					<option value='50'>50~59세</option>
					<option value='60'>60세 이상</option>
				</select>
			</div>
			<div>
				<label for="preference">나의 여행 취향 (여러개 선택 가능)</label> <br>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="산,바다">자연(산/바다)
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="전시체험">전시체험
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="예술,건축물">예술/건축물
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="운동,트레킹">운동/트레킹
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="가족,반려동물">가족/반려동물
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="공원">공원
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="야경">야경
					</label>
				</div>
			</div>
			<div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="사진">사진
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="책">책
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="캠핑">캠핑
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="preference" value="역사,종교">역사/종교
					</label>
				</div> <br>
			</div> <br>
			<button id="btn" type="submit" onclick="register(event);" class="btn btn-dark btn-block">회원가입</button> <br> <br>
			<button id="btn" type="button" class="btn btn-dark btn-block" onclick="location.href='/'">뒤로가기</button> <br>
		</div>
	</form><br><br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script>
$('#btnIdDupChk').on('click', function () {
	
	var inputUsername = $('#username').val();
	
	if (inputUsername.length == 0) { // inputId == ''
		alert('아이디를 입력하세요.');
		$('#username').focus();
		return;
	}
	
	// 새로운 자식창(브라우저) 열기
	var childWindow = window.open('/etc/idDupChk?id=' + inputUsername, 
							'joinIdDupChk', 'width=400,height=300');
		});
		
$('#btnEmDupChk').on('click', function () {
	
	var inputEmail = $('#email').val();
	
	if (inputEmail.length == 0) { // inputId == ''
		alert('이메일을 입력하세요.');
		$('#email').focus();
		return;
	}
	
	// 새로운 자식창(브라우저) 열기
	var childWindow = window.open('/etc/EmDupChk?id=' + inputEmail, 
							'joinEmDupChk', 'width=400,height=300');
		});
</script>
</body>
</html>