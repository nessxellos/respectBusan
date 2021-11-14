<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./layout/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Respect Your Busan</title>
<!-- Materialize / 슬라이드 이미지 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/index.css">
</head>
<body>
	<!-- 전체 div -->
	<div class="container">		
		<!-- Image Slider -->
			<div class="slider">
				<ul class="slides">
					<li>
						<img src="images/background1.jpg">
						<div class="caption center-align">
							<h2>지금 어디로 떠나고 싶으신가요?</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">Respect Your Busan</h5>
						</div>
					</li>
					<li>
						<img src="images/background2.jpg">
						<div class="caption left-align">
							<h2>저희와 함께 부산을 여행해보죠!</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">Respect Your Busan</h5>
						</div>
					</li>
					<li>
						<img src="images/background3.jpg">
						<div class="caption right-align">
							<h2>지금 원하시는 기능을 선택하세요!!</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">Respect Your Busan</h5>
						</div>
					</li>
				</ul>
			</div>
			<!-- end of Image Slider -->
			<!-- Image Card -->
			<div class="row center-align">
				<div class="col s12 m4 center-align">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/busan/popular">
								<img class="activator" src="images/boogi1.jpg">
							</a>
						</div>
						<div class="card-content">
							<a href="/busan/popular">
								<span id="text">인기 관광지</span>
							</a>							
						</div>
					</div>
				</div>
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/busan/recommand">
								<img class="activator" src="images/boogi2.jpg">
							</a>
						</div>
						<div class="card-content">
							<a href="/busan/recommand">
								<span id="text">맞춤 관광지</span>
							</a>							
						</div>
					</div>
				</div>
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/blog/blogMain">
								<img class="activator" src="images/boogi3.jpg">
							</a>
						</div>
						<div class="card-content">
							<a href="/blog/blogMain">
								<span id="text">여행 이야기</span>
							</a>							
						</div>
					</div>
				</div>
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/restaurant/restaurant">
								<img class="activator" src="images/boogi4.jpg">
							</a>
						</div>
						<div class="card-content">
							<a href="/restaurant/restaurant">
								<span id="text">인기 맛집</span>
							</a>							
						</div>
					</div>
				</div>				
				<div class="col s12 m4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/etc/info">
								<img class="activator" src="images/boogi5.jpg">
							</a>
						</div>
						<div class="card-content">
							<a href="/etc/info">
								<span id="text">With Corona</span>
							</a>							
						</div>
					</div>
				</div>
			</div>
			<!-- end of Image Card -->
	</div>
	<!-- Scripts -->
	<!-- Compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<!-- js 파일 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.poptrox.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>
	<script>
		const slider = document.querySelector('.slider');
		M.Slider.init(slider, {
			indicators : false,
			height : 485,
			duration : 500,
			interval : 2000
		});
	</script>
</body>
</html>
