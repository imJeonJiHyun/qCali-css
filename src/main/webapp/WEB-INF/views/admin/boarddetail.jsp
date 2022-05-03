<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : grey;
  text-decoration: none;
}
a:hover {
  color : red;
  text-decoration: underline;
}
a:active {
  color : green;
  text-decoration: none;
}
</style>

<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="<c:url value='/resources/static/css/styles.css'/> "
	rel="stylesheet" type="text/css">

<title>QCali :: 게시물 보기</title>

</head>
<script>
	function deleteConfirm(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}
		else{
			location.href="<c:url value='/admin/board/delete?boardSeq='/>"+${boards.boardSeq};
		}
	}
</script>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/admin/main/adminHeader.jsp"></jsp:include>
		
	<div class="container mt-5" >
	<h2 class="fw-bolder mb-1">${boards.boardTitle }</h2>
	<div class="test-muted fst-italic mb-2">질문 : ${boards. questionContent}</div>
	<div class="container mt-2">
	<p class="fs-5" style="float: right;">작성자 : ${boards.memberNickname } </p>
	</div>
	<p class="text-xl-start">
		${boards.boardContent }	
	</p>

		<button  id="boardDelete" onclick="window:location='<c:url value='/admin/board/delete?boardSeq=${boards.boardSeq }'/>'">글 삭제</button>
		
		<a href="javascript:void(0);" class="btu btn-danger" onClick="deleteConfirm();">글 삭제</a>
		<label>좋아요  +${boards.boardLike }</label>
		<label>조회수 ${boards.boardCount }</label>
	</div>
		<br><a href='<c:url value="/admin/board/list"/>'>글 목록 가기</a><br>
		
		
</body>
</html>