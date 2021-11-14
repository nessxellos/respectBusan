<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container">
	<h1>회원 관리</h1>
	<br>
	<c:forEach var="user" items="${lists.content}">
	<c:if test="${user.id ne 1}">
			<div class="card m-3">
			<div class="card-body">
				<p>
					회원 번호:<span id="id"> ${user.id}</span>
				</p>
				<p>회원 아이디: ${user.username}</p>
				<p>회원 이메일: ${user.email}</p>
				<button type="button" id="btnDelete" class="btn btn-danger">회원
					삭제</button>
			</div>
		</div>
	
	</c:if>
	</c:forEach>
	<c:choose>
		<c:when test="${lists.first}">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${lists.number-1}">이전</a></li>
				<li class="page-item"><a class="page-link"
					href="?page=${lists.number+1}">다음</a></li>
			</ul>
		</c:when>
		<c:when test="${lists.last}">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="?page=${lists.number-1}">이전</a></li>
				<li class="page-item disabled"><a class="page-link"
					href="?page=${lists.number+1}">다음</a></li>
			</ul>
		</c:when>
		<c:otherwise>
					<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="?page=${lists.number-1}">이전</a></li>
				<li class="page-item"><a class="page-link"
					href="?page=${lists.number+1}">다음</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
<script>
	$("#btnDelete").click(function() {
		if (!confirm("정말 삭제할까요?"))
			return false
		$.ajax({
			type : "DELETE",
			url : "/admin/delete/" + $("#id").text()
		}).done(function(resp) {
			alert("삭제성공")
			location.href = "/admin/userlist"
		})
	})
</script>
