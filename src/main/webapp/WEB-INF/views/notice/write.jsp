<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript"
   src="<c:url value="/resources"/>/static/js/ckeditor/ckeditor.js"></script>
<style>
.box {
  width: 1000px;
  padding-top: 3%;
  padding-left: 17%;
}
</style>
<meta charset="UTF-8">
<title>공지 사항 글 쓰기</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>
	<div class="box" class="container">
	<table class="table table-sm caption-top">
		<caption>공지사항    |  글쓰기</caption>
	</table>
	<form action="<c:url value='/notice/write' /> " method="post" name="writeForm" onsubmit="return nullCheck()">
			<div class="form-group">
      			<label for="noticeTitle" class="form-label mt-4">제목</label>
      			<input type="text" class="form-control" name="noticeTitle" id="noticeTitle" size="30" maxlength="50"/>
    		</div>
			<div class="form-group">
      			<label for="noticeContent" class="form-label mt-4">내용</label>
      			<textarea class="form-control" name="noticeContent" id="noticeContent"></textarea>
    		</div>
    		<div class="form-group">
      			<label for="formFile" class="form-label mt-4"></label>
      			<input class="form-control" type="file" name="formFile" id="formFile">
      			<script>CKEDITOR.replace('noticeContent', {filebrowserUploadUrl:'${pageContext.request.contextPath}/notice/fileupload'});</script>
    		</div><br>
			
			<div class="btn-group" role="group" aria-label="Basic example" style="float:right">
  				<button type="submit" class="btn btn-outline-info">등록하기</button>
  				<button type="reset" class="btn btn-outline-info">작성취소</button><br><br>
  				<input type="button" value="돌아가기" class="btn btn-outline-info" onclick="location.href='<c:url value="/notice/list"/>'">
			</div>
	</form>
<script>
	function nullCheck() {
		if (writeForm.noticeTitle.value == "") {
			alert("제목을 입력해주세요.");
			writeForm.noticeTitle.focus();
				return false;
		} else if (writeForm.noticeContent.value == "") {
			alert("내용을 입력해주세요.");
			writeForm.noticeContent.focus();
				return false;
		}
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</div>
  </body>
</html>