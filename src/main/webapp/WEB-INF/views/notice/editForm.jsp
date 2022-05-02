<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 수정</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<header>
		<h1>공지사항 수정</h1>
	</header>
	<form
		action="${pageContext.request.contextPath}/notice/update?noticeSeq=${notice.noticeSeq}"
		method="POST" name="updateForm" onsubmit="return nullCheck()">
		<table border="1">
			<tr>
				<td><label>제목</label></td>

				<td><input type="text" name="noticeTitle"
					value="${notice.noticeTitle }" />
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="noticeContent">${notice.noticeContent } </textarea>
					<script>
						CKEDITOR
								.replace(
										'noticeContent',
										{
											filebrowserUploadUrl : '${pageContext.request.contextPath}/notice/fileupload'
										});
					</script>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정하기" />
	</form>


	<br>
	<a href="<c:url value='/notice/list'/> ">공지사항 목록</a>
	<br>

<script type="text/javascript"
	src="<c:url value='/resources/static/js/ckeditor/ckeditor.js'/>"></script>
<script>
	function nullCheck() {
		if (updateForm.noticeTitle.value == "") {
			alert("제목을 입력해주세요.");
			updateForm.noticeTitle.focus();
			return false;
		} else if (updateForm.noticeContent.value == "") {
			alert("내용을 입력해주세요.");
			updateForm.noticeContent.focus();
			return false;
		}
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>