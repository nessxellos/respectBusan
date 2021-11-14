<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행이야기 상세보기</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/blogDetail.css">
</head>
<body>
<div class="container">
	<h1>나만의 여행 이야기</h1> <hr id="hr"> <br> <br> <br>
	<div id="blog">
		<h2 id="title">${ blog.title }</h2> <br> 
		<div id="flex">
			<h3 id="writer">작성자 : ${ blog.user.username }</h3> 
			<h4 id="date"><fmt:formatDate value="${ blog.regdate }" pattern="yyyy-MM-dd a hh:mm" /></h4>
			<br> <hr id="line"> 
		</div>
		<div id="content">
			<c:forEach var="attach" items="${ attach }">
				<img src="${ attach.srcPath }"><br><br>
			</c:forEach>
			<span id="text">${ blog.content }</span>
		</div> 
		<hr id="line"> 
		<div>
			<br><h6>댓글 수 : ${ listCount }개</h6> <br><hr id="line"> <br>
			<c:forEach var="list" items="${ rlist }">
				<div id="reply">
					<p><span id="rWriter">${ list.writer }</span> <fmt:formatDate value="${ list.regdate }" pattern="yyyy-MM-dd a hh:mm" />						
					<c:if test="${ list.user.id == principal.user.id }">
						<button id="btnDel" class="btn btn-danger btn-sm badge">삭제</button>
					</c:if></p>
					<p>${ list.content }</p>
				</div><br>
			</c:forEach>
		</div>
		<div>
		<hr id="line">	
		<c:if test="${ not empty principal.user }"><br/>
			<div id="reply">
				<p id="rWriter">${ principal.user.username }</p>
				<textarea rows="3" cols="100" id="msg" placeholder="댓글을 입력하세요"></textarea>
				<button type="button" class="btn btn-dark" id="btnReply" >댓글쓰기</button>
			</div>
		</c:if>
	</div>
	</div> <br>
	<div class="float-right">
		<c:choose>
			<c:when test="${ principal.user.id == reply.user.id }">
				<button class="btn btn-primary"
					onclick="location.href='/blog/blogUpdate/${ blog.id }'">수정</button>
				<button type="button" class="btn btn-dark"
					onclick="location.href='/blog/blogMain'">블로그로 이동</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-dark"
					onclick="location.href='/blog/blogMain'">블로그로 이동</button>
			</c:otherwise>
		</c:choose>
	</div>
</div> <br> <br><br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->	
<script src="/js/blog.js"></script>
<script>
	//댓글 쓰기
	$("#btnReply").click(function() {
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
			url : "/reply/insert/" + ${ blog.id },
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		})
		.done(function() {
			location.href = "/blog/blogDetail/" + ${ blog.id };
			return;
		})
		.fail(function() {
			alert("댓글 추가 실패")
		})
	})
</script>
</body>
</html>