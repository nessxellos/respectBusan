<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<title>Your Busan!</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<title></title>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="/">Home </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<sec:authorize access="isAnonymous()">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/login">로그인</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/join">회원
							가입</a></li>
					<li class="nav-item"><a class="nav-link" href="#">인기 관광지</a></li>
					<li class="nav-item"><a class="nav-link" href="#">인기 맛집</a></li>
					<li class="nav-item"><a class="nav-link" href="/etc/info">With
							Corona</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/notice">공지사항</a></li>
				</ul>
			</sec:authorize>
			<c:choose>
				<c:when test="${principal.user.role == 'ROLE_ADMIN'}">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link"
								href="/admin/userlist">회원 관리</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/list">게시판
									관리</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/admin/notice">공지사항 관리</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">로그아웃(<sec:authentication
										property="principal.user.username" />)
							</a></li>
						</ul>
					</sec:authorize>
				</c:when>
				<c:otherwise>
					<sec:authorize access="isAuthenticated()">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link"
								href="/user/${principal.user.id}/update">회원 정보 수정</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">로그아웃(<sec:authentication
										property="principal.user.username" />)
							</a></li>
						</ul>
					</sec:authorize>
				</c:otherwise>
			</c:choose>



		</div>
	</nav>
	<br>





</body>
</html>