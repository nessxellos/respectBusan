<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/user.css">
</head>
<body>
	<div id="container" class="container">
		<form id="userUpdate" action="/user/update" method="post">
			<input type="hidden" name="_method" value="put"/>
			<h1 id="title">회원 정보 수정</h1> <br> <br>
			<div class="form-group">
				<label for="username">아이디:</label> 
				<h4>${principal.user.username}</h4>
			</div>
			<div class="form-group">
				<label for=password>비밀번호:</label> <input type="password"
					name="password" class="form-control" placeholder="비밀번호를 입력하세요"
					required="required">
			</div>
			<div class="form-group">
				<label for="email">이메일:</label> <input type="email"
					class="form-control" name="email" placeholder="이메일을 입력하세요"
					value="${principal.user.email}" required="required" maxlength="50">
			</div>
			<label for="gender">성별:</label>
			<div class="form-check" id="gender">
				<label class="form-check-label"> 
					<input type="radio" class="form-check-input" name="gender" value="male">남성
				</label>
			</div>
			<div class="form-check" id="gender">
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
			<button type="submit" id="btn" class="btn btn-primary">수정</button>
			<button id="btn" type="button" class="btn btn-dark" onclick="history.back()">뒤로 가기</button>
		</form>
	</div> <br> <br> <br> <br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->	
</body>
</html>