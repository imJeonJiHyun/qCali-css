<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
.box {
  width: 1300px;
  padding-top: 3%;
  padding-left: 16%;
}
</style>
<meta charset="UTF-8">
<title>공지 사항 Detail</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>
	<div class="container">

<article>
	<table border = "1">
		<tr>
			<th>제목</th>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${notice.noticeRegDay}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.noticeContent}</td>
		</tr>
	</table>
</article>
	<br><a href="<c:url value='/notice/list'/> ">공지사항 목록</a><br>   	
	<c:if test="${adminAuthInfoCommand != null }">
		<a href="javascript:void(0);" class="btu btn-danger" onClick="deleteConfirm();">삭제</a>
<script>
	function deleteConfirm(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}
		else{
			location.href="<c:url value='/notice/delete?noticeSeq='/>"+${notice.noticeSeq};
		}
	}
</script>
		<button id="noticeUpdate" onclick="window:location='<c:url value='/notice/update?noticeSeq=${notice.noticeSeq }'/>'">수정</button>
	</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</body>
</html>