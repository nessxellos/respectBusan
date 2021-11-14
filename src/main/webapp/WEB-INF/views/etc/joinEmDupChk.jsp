<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/DupChk.css">
</head>
<body>
<div>
	<form action="/etc/EmDupChk" method="get" name="wfrm">
		<input type="text" name="email" value="${ email }">
		<button type="submit">이메일 중복확인</button>
	</form>
	<c:choose>
		<c:when test="${ isEmDup eq false }"><br>
			<p>사용가능한 이메일 입니다.
				<button type="button" id="btnUseEm">아이디 사용</button>
			</p>
		</c:when>
		<c:otherwise><br>
			<p>이메일 중복, 사용중인 이메일 입니다.</p>
		</c:otherwise>
	</c:choose>
</div>
<script>
	var btnUseEm = document.querySelector('#btnUseEm');
	
	btnUseEm.addEventListener('click', function () {
		// window는 생략가능
		// 현재창의 id 입력값을 부모창의 id 입력상자에 배치하기
		window.opener.document.frm.email.value = wfrm.email.value;
		
		window.close(); // close(); 현재 브라우저 창 닫기
	});
</script>
</body>
</html>