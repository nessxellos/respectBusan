<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 관광지 목록</title>
<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/popular.css">
</head>
<body>
	<div class="container">
		<h3>인기 관광지</h3> <hr id="hr"> <br> <br>
		<!-- 검색 창 시작 -->
		<form id="saerchForm"> 
			<select class="form-control" id="searchType">
				<option value="">💳 카테고리 선택</option>
				<option value="sight">관광지명</option>
				<option value="detail">제목+내용</option>
				<option value="tag">해시태그</option>
			</select>
			<input class="form-control mr-sm-2" type="text" placeholder="🔍 Search" id="searchText">
			<button class="btn btn-success" type="submit" onclick="onSearch(event);" id="btnS">검색</button>
		</form><br>
		<!-- 검색 창 끝 -->
		<!-- 테마 분류 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">				
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul id="nav" class="navbar-nav">
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/자연">자연</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/전시체험">전시/체험</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/예술or건축물">예술/건축물</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/운동or트레킹">운동/트레킹</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/가족or반려동물">가족/반려동물</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/공원">공원</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/야경">야경</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/사진">사진</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/책">책</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/캠핑">캠핑</a></li>
						<li class="nav-item"><a class="nav-link1" href="/busan/popular/역사or종교">역사/종교</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Image Card -->
		<div class="row center-align">
			<c:forEach var="spot" items="${ spots.content }">
				<div class="col-md-4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/busan/${ spot.id }">
								<img class="activator" src="${ spot.thumurl }">
							</a>							
						</div>
						<div class="card-content">
							<a href="/busan/${ spot.id }">
								<span id="text">${ spot.sight }</span>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${ spots.first }">
					<li class="page-item disabled">
						<a class="page-link" href="?page=${ spots.number-1 }">&lt</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="?page=${ spots.number-1 }">&lt</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${ spots.totalPages }" step="1">
				<c:choose>
					<c:when test="${ i eq spots.number+1 }">
						<li class="page-item active">
							<a class="page-link" href="?page=${ i-1 }">${ i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="?page=${ i-1 }">${ i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${ spots.last }">
					<li class="page-item disabled">
						<a class="page-link" href="?page=${ spots.number+1 }">></a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="?page=${ spots.number+1 }">></a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div> <br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script>
function onSearch(event) {
	event.preventDefault()
	let searchType = $("#searchType option:selected").val()
	let searchText = $("#searchText").val()

	window.location = "/busan/search?" + searchType + "=" + searchText + "&page=0";
}
</script>
</body>
</html>