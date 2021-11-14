<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사회적 거리두기 및 날씨</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/info.css">
</head>
<body>
	<%!
		LocalDate now = LocalDate.now();
		int month = now.getMonthValue();
		int day = now.getDayOfMonth();
		DayOfWeek dayOfWeek = now.getDayOfWeek();
		String dayName = dayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN);
	%>
	<div class="container">
		<h1> 부산 거리두기 단계 (<%=month%>월 <%=day%>일 <%=dayName%> 기준) </h1> <hr id="hr"> <br> <br>
		<%-- <div class="list-group-box">
			<ul class="list-group">
				<li class="list-group-item"> 부산시 누적 확진자 수 </li>
				<li class="list-group-item"> 확진자 수 <span id="confirmed" style="color:red;"></span>명</li>
				<li class="list-group-item"> 격리해제 수 <span id="released" style="color:red;"></span>명</li>
				<li class="list-group-item"> 사망 수 <span id="death" style="color:red;"></span>명</li>
			</ul> <br>
			<ul class="list-group">
				<li class="list-group-item"> 부산시 접종자 수 </li>
				<li class="list-group-item"> 1차 접종
						어제 <span id="1st" style="color:red;"></span>명
						누적 <span id="1st2" style="color:red;"></span>명
				</li>
				<li class="list-group-item"> 2차 접종
						어제 <span id="2nd" style="color:red;"></span>명
						누적 <span id="2nd2" style="color:red;"></span>명
				</li>
				<li class="list-group-item" style="color:white;">-</li>
			</ul> 
		</div> <br> --%>
		<div>
			<img src="images/distancing.jpg">
		</div> <br> <br>
		<h1>부산 주간 날씨</h1> <hr id="hr"> <br>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th>날짜</th>
					<th>날씨</th>
					<th>온도</th>
					<th>습도</th>
					<th>바람</th>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td><%=month%>월 <%=day%>일 <span id="placeholder"></span></td>
					<td><span id="Weather3"></span></td>
					<td><span id="Tmp3"></span></td>
					<td><span id="Hmd3"></span></td>
					<td><span id="Wind3"></span></td>
				</tr>
				<tr>
					<td><%=month%>월 <%=day + 1%>일 <span id="placeholder2"></span></td>
					<td><span id="Weather11"></span></td>
					<td><span id="Tmp11"></span></td>
					<td><span id="Hmd11"></span></td>
					<td><span id="Wind11"></span></td>
				</tr>
				<tr>
					<td><%=month%>월 <%=day + 2%>일 <span id="placeholder3"></span></td>
					<td><span id="Weather19"></span></td>
					<td><span id="Tmp19"></span></td>
					<td><span id="Hmd19"></span></td>
					<td><span id="Wind19"></span></td>
				</tr>
				<tr>
					<td><%=month%>월 <%=day + 3%>일 <span id="placeholder4"></span></td>
					<td><span id="Weather27"></span></td>
					<td><span id="Tmp27"></span></td>
					<td><span id="Hmd27"></span></td>
					<td><span id="Wind27"></span></td>
				</tr>
				<tr>
					<td><%=month%>월 <%=day + 4%>일 <span id="placeholder5"></span></td>
					<td><span id="Weather35"></span></td>
					<td><span id="Tmp35"></span></td>
					<td><span id="Hmd35"></span></td>
					<td><span id="Wind35"></span></td>
				</tr>
			</tbody>
		</table>
		<br>
	</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->	
<script>
	// $("#btn_covidInfo").click(function(){
	$(function() { //$(document).ready(function(){}) 방식의 short form
		$.ajax({
			type : "GET",
			url : "/etc/coronainfo",
			success : function(resp) {
				let result = JSON.parse(resp);
				//console.log(result.response.body.items.item);
				console.log(result);
				let dataArray = result.response.body.items.item; //js 로 배열 컨트롤
				for (i = 0; i < dataArray.length; i++) {
					//console.log(dataArray[i].gubun);
					if (dataArray[i].gubun == '부산') {
						//console.log(dataArray[i])
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
				let dataArray1 = result.response.body.items.item; //js 로 배열 컨트롤
				for (i = 0; i < dataArray1.length; i++) {
					//console.log(dataArray[i].gubun);
					if (dataArray1[i].sidoNm == '부산광역시') {
						//console.log(dataArray1[i])
						$("#1st").html(dataArray1[i].firstCnt)
						$("#1st2").html(dataArray1[i].firstTot)
						$("#2nd").html(dataArray1[i].secondCnt)
						$("#2nd2").html(dataArray1[i].secondTot)
						return;
					}
				}
			} //success
		})//ajax
	}) //btnDelete
	var apiURI = "https://api.openweathermap.org/data/2.5/forecast?q=Busan&appid=51a9596817c1a197fb2e23f7a88ec9cd";
	$(function() {
		$.ajax({
			type : "GET",
			url : apiURI,
			success : function(resp) {
				let result = resp.list;
				let a = 1;
				for (i = 1; i < result.length; i++) {
					if (i % 8 == 3) {
						console.log(result[i]);
						$("#Weather" + a).html(
								result[i].weather[0].main + "("
										+ result[i].weather[0].description
										+ ")")
						$("#Tmp" + a).html(
								Math.ceil(result[i].main.temp - 273.15)
										+ "˚")
						$("#Hmd" + a).html(result[i].main.humidity + "%")
						$("#Wind" + a).html(result[i].wind.speed + "(m/s)")
					}
					a += 1;
				}
			}
		})
	})
</script>
<script>
	var now = new Date();
	var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	function oneDay() {
		var today = new Date();
		var todayLabel = week[today.getDay()];
		return todayLabel;
	}
	function twoDays() {
		var today = new Date();
		var tomorrow1 = new Date(today.valueOf() + (24 * 60 * 60 * 1000));
		var tomorrow1Label = week[tomorrow1.getDay()];
		return tomorrow1Label;
	}
	function threeDays() {
		var today = new Date();
		var tomorrow2 = new Date(today.valueOf() + (24 * 60 * 60 * 1000 * 2));
		var tomorrow2Label = week[tomorrow2.getDay()];
		return tomorrow2Label;
	}
	function fourDays() {
		var today = new Date();
		var tomorrow3 = new Date(today.valueOf() + (24 * 60 * 60 * 1000 * 3));
		var tomorrow3Label = week[tomorrow3.getDay()];
		return tomorrow3Label;
	}
	function fiveDays() {
		var today = new Date();
		var tomorrow4 = new Date(today.valueOf() + (24 * 60 * 60 * 1000 * 4));
		var tomorrow4Label = week[tomorrow4.getDay()];
		return tomorrow4Label;
	}
	document.getElementById('placeholder').innerText = oneDay();
	document.getElementById('placeholder2').innerText = twoDays();
	document.getElementById('placeholder3').innerText = threeDays();
	document.getElementById('placeholder4').innerText = fourDays();
	document.getElementById('placeholder5').innerText = fiveDays();
</script>
</body>
</html>