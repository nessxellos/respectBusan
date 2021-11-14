<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행이야기 쓰기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/blogWrite.css">
</head>
<body>
	<div class="container">
		<div>
			<h1>나의 부산 이야기</h1>
			<h2>Make Your Busan</h2>
		</div>
		
	<!-- 글쓰기 -->
	<div>
		<form method="post" action="/blog/blogWrite" enctype="multipart/form-data">
			<h3>제목 : </h3>
			<input id="title" type="text" name="title" style="width: 100%;" placeholder="제목을 입력해주세요" />
			<input type="hidden" name="writer" value="${principal.user.id}" /> <br><br>
			<h3>내용 : </h3>
			<textarea id="summernote" name="content"></textarea> <br><br>

			<!-- 파일 업로드 시작 -->
			<div class="row">
                <button type="button" class="btn btn-dark" id="btnAddFile">파일 추가</button>
            </div>
			
			<div class="row" id="fileContainer">
				<div class="file-field input-field col s12"> 
					<div class="btn"> 
						<span><i class="material-icons left"></i></span> 
						<input type="file" name="files" multiple required="required">
					</div>
					<div class="file-path-wrapper"> <br>
					</div>
					<span class="helper-text">첨부파일 업로드 가능한 용량은 최대 50MB 입니다.</span>
				</div>
			</div>
			<!--  파일 업로드 끝 -->
			
			<button id="btnWrite" type="submit" class="btn btn-dark btn-lg" style="">글 쓰기</button>
		</form>
	</div>
	<!-- 글쓰기 완료 -->
</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : '내용을 입력해주세요',
			minHeight : 200,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
<script>
    var fileContainer = document.querySelector('#fileContainer');
    	
    var btnAddFile = document.querySelector('#btnAddFile');
    	
    var fileCount = 1; // 첨부파일 선택상자 개수
    	
    btnAddFile.addEventListener('click', function () {
    	if (fileCount >= 5) {
    		alert('첨부파일은 최대 5개까지만 업로드 가능합니다.')
    		return;
    	}
    	fileCount++; // 추가된 첨부파일 선택상자 개수 반영
    		
    	var input = `
        <div>
            <div class="btn">
                <input type="file" name="files" multiple>
            </div>
            <div class="file-path-wrapper">
                <input type="text" class="file-path validate">
            </div>
            <span class="helper-text">첨부파일로 업로드 가능한 용량은 최대 50MB 입니다.</span>
        </div>
    	`;
    		
    	fileContainer.innerHTML += input;
    });
</script>
</body>
</html>