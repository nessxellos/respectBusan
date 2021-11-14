<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="join_action" action="/join" method="post">
		<div class="container">
			<h1>회원 가입</h1>
			<br> <br>
			<div class="form-group">
				<label for="username">아이디:</label> <input type="text" name="username"
					class="form-control" placeholder="아이디를 입력하세요" required="required" maxlength="20">
			</div>

			<div class="form-group">
				<label for=password>비밀번호:</label> <input type="password"
					name="password" class="form-control" placeholder="비밀번호를 입력하세요"
					required="required">
			</div>

			<div class="form-group">
				<label for="email">이메일:</label> <input type="email"
					class="form-control" name="email" placeholder="이메일을 입력하세요"
					required="required" maxlength="50">
			</div>

			<label for="gender">성별:</label>
			<div class="form-check">
				<label class="form-check-label"> <input type="radio"
					class="form-check-input" name="gender" value="male">남성
				</label>
			</div>
			<div class="form-check">
				<label class="form-check-label"> <input type="radio"
					class="form-check-input" name="gender" value="female">여성
				</label>
			</div>
			<br>
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
			<label for="preference">나의 여행 취향 (여러개 선택 가능)</label> <br>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input" name="preference" value="food">맛집
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input" name="preference" value="healing">힐링
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input" name="preference" value="view" >풍경
				</label>
			</div>
			<br> <br>
			<button type="submit" class="btn btn-primary">회원가입</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/'">뒤로가기</button>
		</div>

	</form>
</body>
</html>