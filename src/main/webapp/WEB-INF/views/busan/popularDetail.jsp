<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 관광지 상세보기</title>
<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/popularDetail.css">
</head>
<body>
<div class="container">
	<div id="title">
		<h1>${ spot.sight }</h1> <hr id="hr">
		<h4>${ spot.title }</h4> <br><br>
	</div>
	<!-- 성별 추천 시작 -->
	<c:if test="${gender eq 0 }">
		<div align="right" id="male">남성에게 추천합니다</div>
	</c:if>
	<c:if test="${gender eq 1 }">
		<div align="right" id="female">여성에게 추천합니다</div>
	</c:if>
	<!-- 성별 추천 끝 -->
	<!-- 연령 추천 시작 -->
	<c:if test="${age eq 1 }">
		<div align="right" id="age">10대에게 추천합니다</div>
	</c:if>
	<c:if test="${age eq 2 }">
		<div align="right" id="age">20대에게 추천합니다</div>
	</c:if>
	<c:if test="${age eq 3 }">
		<div align="right" id="age">30대에게 추천합니다</div>
	</c:if>
	<c:if test="${age eq 4 }">
		<div align="right" id="age">40대에게 추천합니다</div>
	</c:if>
	<c:if test="${age eq 5 }">
		<div align="right" id="age">50대에게 추천합니다</div>
	</c:if>
	<c:if test="${age eq 6 }">
		<div align="right" id="age">60대에게 추천합니다</div>
	</c:if>
	<!-- 연령 추천 끝 -->
	<!-- 관광지 추천 기능 시작 -->
	<div align="right" id="favIcon">
		<!-- 사용자의 추천 내역이 없으면 회색 -->
		<c:if test="${isFav eq false }">
			<span>이 관광지를 추천하시겠습니까?</span>
			<a href="/fav/${spot.id}"><i class="material-icons small" id="notFav">thumb_up</i></a>
		</c:if>
		<!-- 사용자의 추천 내역이 있으면 파란색 -->
		<c:if test="${isFav eq true }">
			<span>이 관광지를 추천하셨습니다</span>
			<a href="/fav/${spot.id}"><i class="material-icons small" id="fav">thumb_up</i></a>
		</c:if>
	</div> <br>
	<!-- 관광지 추천 기능 끝 -->
	<div>
		<div>
			<img src="${ spot.imageurl}">
			<img id="word" src="images/${ spot.sight }.jpg">
		</div>
		<h4>상세정보</h4> <hr>
		<p>${ spot.detail }</p> 
		<div id="btn1">
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag1 }&page=0'">#${ tagspot.tag1 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag2 }&page=0'">#${ tagspot.tag2 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag3 }&page=0'">#${ tagspot.tag3 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag4 }&page=0'">#${ tagspot.tag4 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag5 }&page=0'">#${ tagspot.tag5 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag6 }&page=0'">#${ tagspot.tag6 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag7 }&page=0'">#${ tagspot.tag7 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag8 }&page=0'">#${ tagspot.tag8 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag9 }&page=0'">#${ tagspot.tag9 }</button>
			<button onclick="location.href='/busan/search?tag=${ tagspot.tag10 }&page=0'">#${ tagspot.tag10 }</button>
		</div>
		<hr>
		<div id="flex">		
			<!-- 지도 -->
			<ul>
				<li id="map"></li>
			</ul>	
			<ul>
				<li><br><br><br><br>주소 : ${ spot.address }</li>
				<li>휴무일 : ${ spot.holiday }</li>
				<li>운영시간 : ${ spot.hour }</li>
			</ul>
		</div>
		<hr>		
	</div> 
	<div>
		<h6><span>댓글 수 : </span><span>${listCount }</span><span>개</span></h6>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col" style="width:5%">No.</th>
					<th scope="col" style="width:15%">댓글 작성자</th>
					<th scope="col" style="width:54%">댓글 내용</th>
					<th scope="col" style="width:26%">작성 일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${ clist }">
					<c:if test="${ list.emotion eq 0 }">
						<tr>
					</c:if>
					<c:if test="${ list.emotion eq 1 }">
						<tr bgcolor="#e0ccce">
					</c:if>
					<c:if test="${ list.emotion eq 2 }">
						<tr bgcolor="#b7dceb">
					</c:if>
						<td>${ list.cid }</td>
						<td>${ list.writer }</td>
						<td>${ list.content }</td>
						<td><fmt:formatDate value="${ list.regdate }" pattern="yyyy-MM-dd a hh:mm" />						
						<c:if test="${ list.user.id == principal.user.id }">
							<form id="commentDel" action="/comment/${list.cid}/delete" method="post">
								<input type="hidden" name="_method" value="delete"/>
								<button id="btnDel" class="btn btn-danger btn-sm badge">삭제</button>
							</form>
						</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table><hr>	
		<c:if test="${ not empty principal.user }"><br/>
			<div>
				<textarea rows="3" cols="110" id="msg"></textarea>
				<div class="float-right">
					<button type="button" class="btn btn-primary" id="btnComment">댓글쓰기</button>
				</div>
			</div>
		</c:if>
	</div>
	<div class="float-letf">
		<button id="btn2" type="button" class="btn btn-primary" onclick="history.back()">목록으로</button> <br><br><br>
	</div>
</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1253c1261bc7379cfd6cf07b68488458"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
	//========================================= 지도 =========================================
	var container = document.getElementById('map'); // 지도를 표시할 div
	var place = '<c:out value="${ spot.sight }"/>';
	var latitude = '<c:out value="${ spot.latitude }"/>';
	var longitude = '<c:out value="${ spot.longitude }"/>';
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
	iwPosition = new kakao.maps.LatLng(latitude,longitude); 

	// 인포윈도우를 생성
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	// 마커 위에 인포윈도우를 표시. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됨.
	infowindow.open(map, marker);
	//========================================= 댓글 =========================================
	// 댓글 쓰기
	$("#btnComment").click(function() {
		if($("#msg").val == ""){
			alert("댓글을 입력하세요");
			return;
		}
		data = {
			"content" : $("#msg").val(),
			"writer" : "${ principal.user.username }"
		}
		$.ajax({
			type : "POST",
			url : "/comment/insert/" + ${spot.id},
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		})
		.done(function() {
			location.href="/busan/" + ${spot.id};
			return;
		})
		.fail(function() {
			alert("댓글 추가 실패")
		})
	})
	// 댓글 리스트
/* 	var init = function() {
		$.ajax({
			type : "GET",
			url : "/comment/list/" + ${spot.id},
		})
		.done(function(resp) {})
		.fail(function() {
			alert("댓글 불러오기 실패");
		})
	}
	init(); */
</script>
</body>
</html>