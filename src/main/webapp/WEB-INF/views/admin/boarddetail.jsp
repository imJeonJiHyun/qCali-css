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
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/admin/main/adminHeader.jsp"></jsp:include>
	
	<div class="container mt-5" >
		<div class="p-3 mb-3 bg-light text-dark">
			<h2 class="fw-bolder mb-3">${boards.boardTitle }</h2>
				<div class="test-muted fst-italic mb-3">질문 : ${boards. questionContent}</div>
					<div class="container mt-3">
						<h6 style="float: right;">
							작성자 : ${boards.memberNickname } </h6>
					</div>
					
					<div class="container mt-5" >
						<p class="text-xl-start">${boards.boardContent }</p>
					</div>
			</div>
		<div style="float: right;">
		
		<label>좋아요  +${boards.boardLike }</label>
		<label>조회수 ${boards.boardCount }</label>

		<button type="button"  class="btn btn-outline-danger" onClick="deleteConfirm();">글 삭제</button>
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
		</div>
	</div>

		<br><a href='<c:url value="/admin/board/list"/>'>글 목록 가기</a><br>
		
		
</body>
</html>