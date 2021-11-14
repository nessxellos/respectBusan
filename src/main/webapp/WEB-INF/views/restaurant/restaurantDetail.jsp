<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 맛집 상세보기</title>
<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/restaurantDetail.css">
</head>
<body>
<div class="container">
	<div id="title">
		<h1>${ restaurant.restaurant }</h1> <hr id="hr">
		<h4>메뉴 : ${ restaurant.menu }</h4> <br><br>
	</div>
	<div>
		<div>
			<img src="${ restaurant.imageurl}">
			<img id="word" src="images/${ restaurant.restaurant }.jpg">
		</div>
		<h4>상세정보</h4> <hr>
		<p>${ restaurant.detail }</p> 
		<div id="btn1">
			<button onclick="location.href='/restaurant/search?tag=${ tagrestaurant.tag1 }&page=0'">#${ tagrestaurant.tag1 }</button>
			<button onclick="location.href='/restaurant/search?tag=${ tagrestaurant.tag2 }&page=0'">#${ tagrestaurant.tag2 }</button>
			<button onclick="location.href='/restaurant/search?tag=${ tagrestaurant.tag3 }&page=0'">#${ tagrestaurant.tag3 }</button>
		</div>
		<hr>
		<div id="flex">
			<ul>
				<li id="map"></li>
			</ul>
			<ul>
				<li><br><br><br><br>주소 : ${ restaurant.address }</li>
				<li>전화번호 : ${ restaurant.call }</li>
				<li>운영시간 : ${ restaurant.hour }</li>
			</ul>
		</div>		
	</div>
	<br> <br>
	<div class="float-right">
		<button id="btn2" type="button" class="btn btn-primary" onclick="history.back()">이전</button>
	</div><br><br><br><br>
</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1253c1261bc7379cfd6cf07b68488458"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
	var container = document.getElementById('map'); // 지도를 표시할 div
	var place = '<c:out value="${restaurant.restaurant}"/>';
	var latitude = '<c:out value="${restaurant.latitude}"/>';
	var longitude = '<c:out value="${restaurant.longitude}"/>';
	var options = {
		center : new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도를 생성
	var map = new kakao.maps.Map(container, options);
	// 마커가 표시될 위치
	var markerPosition = new kakao.maps.LatLng(latitude, longitude); 
	// 마커를 생성
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커를 지도 위에 표시
	marker.setMap(map);

	//인포윈도우에 들어갈 텍스트, 위치 설정
	var iwContent = '<span style="font-size:16px; text-align:center; padding-left:20px;">' + place + '</span>', 
	iwPosition = new kakao.maps.LatLng(latitude, longitude); 

	// 인포윈도우를 생성
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	// 마커 위에 인포윈도우를 표시. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됨.
	infowindow.open(map, marker);
</script>
</body>
</html>