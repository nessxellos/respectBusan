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
		<h3>추천 관광지</h3> <hr id="hr"> <br>
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
					<li class="page-item ">
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
						<li class="page-item ">
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
</body>
</html>