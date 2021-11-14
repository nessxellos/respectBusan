<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/user.css">
</head>
<body>
	<form action="/login" method="post">
		<div id="container" class="container">
			<h1 id="title">로그인</h1>
			<div id="image">
				<p><img src="images/boogi1.jpg"></p><br>
			</div>
			<div class="form-group">
				<label >아이디:</label > <input type="text" name="username" class="form-control" 
				placeholder="아이디를 입력하세요" required="required" maxlength="20">
			</div>
			<div class="form-group">
				<label >비밀번호:</label > <input type="password" name="password" class="form-control" 
				placeholder="비밀번호를 입력하세요" required="required">
			</div> <br>
			<button id="btn" class="btn btn-dark btn-sm btn-block">로그인</button> <br> <br>
			<button id="btn" type="button" class="btn btn-dark btn-sm btn-block"
				onclick="location.href='/'">메인페이지</button> <br>
		</div>
	</form> <br> <br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
</body>
</html>