<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 맛집 목록</title>
<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/restaurant.css">
</head>
<body>
	<div class="container">
		<h3>인기 맛집</h3> <hr id="hr"> <br>
		<!-- 검색 창 시작 -->
		<form id="saerchForm">
			<select class="form-control" id="searchType">
				<option value="">💳 카테고리 선택</option>
				<option value="restaurant">가게이름</option>
				<option value="detail">제목+내용</option>
				<option value="tag">해시태그</option>
			</select>
			<input class="form-control mr-sm-2" type="text" placeholder="🔍 Search" id="searchText">
			<button id="btnS" class="btn btn-success" type="submit" onclick="onSearch(event);" >검색</button>
		</form> <br>
		<!-- 검색 창 끝 -->
		<div class="row center-align">
			<c:forEach var="restaurant" items="${ restaurants.content }">
				<div class="col-md-4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/restaurant/${ restaurant.id }">
								<img class="activator" src="${ restaurant.thumurl }">
							</a>
						</div>
						<div class="card-content">
							<a href="/restaurant/${ restaurant.id}">
								<span id="text">${ restaurant.restaurant }</span>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${ restaurants.first }">
					<li class="page-item disabled">
						<a class="page-link"href="?page=${ restaurants.number-1 }">&lt</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item ">
						<a class="page-link" href="?page=${ restaurants.number-1 }">&lt</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${ restaurants.totalPages }" step="1">
				<c:choose>
					<c:when test="${ i eq restaurants.number+1 }">
						<li class="page-item active"><a class="page-link" href="?page=${ i-1 }">${ i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item "><a class="page-link" href="?page=${ i-1 }">${ i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${ restaurants.last }">
					<li class="page-item disabled">
						<a class="page-link" href="?page=${ restaurants.number+1 }">></a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="?page=${ restaurants.number+1 }">></a>
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

	window.location="/restaurant/search?" + searchType + "=" + searchText + "&page=0";
}
</script>
</body>
</html>