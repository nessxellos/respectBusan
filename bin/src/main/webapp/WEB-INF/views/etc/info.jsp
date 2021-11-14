<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!LocalDate now = LocalDate.now();
	int month = now.getMonthValue();
	int day = now.getDayOfMonth();%>
	<div class="container">
		<h2>부산 코로나 현황</h2>
		<br>
		<ul class="list-group">
			<li class="list-group-item">부산시 누적 확진자 수 (<%=month%>월 <%=day%>일
				집계 기준)
			</li>
			<li class="list-group-item">확진자 수
				<p id="confirmed">
			</li>
			<li class="list-group-item">격리해제 수
				<p id="released">
			</li>
			<li class="list-group-item">사망 수
				<p id="death">
			</li>
		</ul>
		<br>
		<ul class="list-group">
			<li class="list-group-item">부산시 접종자 수 (<%=month%>월 <%=day%>일 집계
				기준)
			</li>
			<li class="list-group-item">1차 접종
				<div>
					어제 <span id="1st"></span>명
				</div>
				<div>
					누적 <span id="1st2"></span>명
				</div>
			</li>
			<li class="list-group-item">2차 접종
				<div>
					어제 <span id="2nd"></span>명
				</div>
				<div>
					누적 <span id="2nd2"></span>명
				</div>
			</li>
		</ul>
		<br>
		<ul class="list-group">
			<li class="list-group-item">부산시 날씨 현황 (<%=month%>월 <%=day%>일 집계
				기준)
			</li>
			<li class="list-group-item"></li>
		</ul>




	</div>
	<!-- <div id="abc">

</div> -->

	<script>
		//$("#btn_covidInfo").click(function(){
		$(function() { //$(document).ready(function(){}) 방식의 short form
			$.ajax({
				type : "GET",
				url : "/etc/coronainfo",
				success : function(resp) {
					let result = JSON.parse(resp);
					//console.log(result.response.body.items.item);
					let dataArray = result.response.body.items.item; //js 로 배열 컨트롤
					for (i = 0; i < dataArray.length; i++) {
						//console.log(dataArray[i].gubun);
						if (dataArray[i].gubun == '부산') {
							console.log(dataArray[i])
							$("#confirmed").html(dataArray[i].defCnt)
							$("#released").html(dataArray[i].isolClearCnt)
							$("#death").html(dataArray[i].deathCnt)
							return;
						}
					}
				} //success
			})//ajax
		}) //btnDelete

		$(function() { //$(document).ready(function(){}) 방식의 short form
			$.ajax({
				type : "GET",
				url : "/etc/vcinfo",
				success : function(resp) {
					let result = JSON.parse(resp);
					//console.log(result.response.body.items.item);
					let dataArray = result.response.body.items.item; //js 로 배열 컨트롤
					for (i = 0; i < dataArray.length; i++) {
						//console.log(dataArray[i].gubun);
						if (dataArray[i].sidoNm == '부산광역시') {
							console.log(dataArray[i])
							$("#1st").html(dataArray[i].firstCnt)
							$("#1st2").html(dataArray[i].firstTot)
							$("#2nd").html(dataArray[i].secondCnt)
							$("#2nd2").html(dataArray[i].secondTot)
							return;
						}
					}
				} //success
			})//ajax
		}) //btnDelete
	</script>
</body>
</html>

