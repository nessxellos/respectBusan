<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<h1>공지 사항</h1>
	<br>
	<div class="card m-2">
		<button class="btn btn-dark btn-sm"
			onclick="location='/board/noticeForm'">공지 쓰기</button>
	</div>
	<div class="card m-2">
		<div class="card-body justify-content-between">
			<span style="font-size: 20px">글1</span>
			<button class="btn btn-success btn-sm float-right"
				onclick="location='/board/noticeForm'">상세 보기</button>
		</div>
	</div>

</div>