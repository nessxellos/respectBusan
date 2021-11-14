<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 추천한 여행지</title>
<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/searchList.css">
<style>
h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>내가 추천한 여행지</h3><br>
		<c:forEach var="spot" items="${ spots }">
			<div class="card m-3" onClick="location.href='/busan/${ spot.id }'">
				<div class="card-body">
					<div id="image"> 
						<img class="activator" src="${ spot.thumurl }">
					</div> 
					<div id="text"> 
						<h4>${ spot.sight }</h4>
						<h5>${ spot.title }</h5>
						<h6>${ spot.tag }</h6>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->

</body>
</html>