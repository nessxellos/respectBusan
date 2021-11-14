<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/myPage.css">
</head>
<body>
	<div>
		<br><br><br><br><br><br><br>
		<!-- Image Card -->
		<div class="row center-align">
			<div class="col s12 m6 center-align">
				<div id="start" class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<a href="/user/${principal.user.id}/update">
							<img class="activator" src="/user/images/boogi6.jpg">
						</a>
					</div>
					<div class="card-content">
						<button id="btn" class="btn btn-sm btn-block" 
		onclick="location.href='/user/${principal.user.id}/update'">내 정보 수정</button>						
					</div>
				</div>
			</div>
			<div class="col s12 m4">
				<div class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<a href="/user/${principal.user.id}/favList">
							<img class="activator" src="/user/images/boogi7.jpg">
						</a>
					</div>
					<div class="card-content">
						<button id="btn" type="button" class="btn btn-sm btn-block" 
	onClick="location.href='/user/${principal.user.id}/favList'">내가 추천한 여행지</button>							
					</div>
				</div>
			</div>
			<div class="col s12 m4">
				<div class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<a href="/">
							<img class="activator" src="/user/images/boogi9.jpg">
						</a>
					</div>
					<div class="card-content">
						<button id="btn" type="button" class="btn btn-sm btn-block" onclick="location.href='/'">메인페이지</button>							
					</div>
				</div>
			</div>
			<div class="col s12 m4">
				<div id="end" class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<img class="activator" src="/user/images/boogi8.jpg">
					</div>
					<div class="card-content">
						<form id="userUpdate" action="/user/${principal.user.id}/delete" method="post">
							<input type="hidden" name="_method" value="delete"/>
							<button id="btn" class="btn btn-sm btn-block">회원 탈퇴</button>
						</form>
					</div>
				</div>
			</div>				
		</div>
		<!-- end of Image Card -->
	</div> <br><br><br><br><br><br><br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
</body>
</html>