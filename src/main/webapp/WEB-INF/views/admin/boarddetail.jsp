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
	
	<div style="backgroud-color: #d3d3d3;">
	<div class="container mt-5">
		<h3>게시물 보기</h3>
	<br>
	
	<div class="shadow-none p-3 mb-2 bg-light rounded" style="border: 1px solid lightgrey;">
		<h4 class="fw-bolder mt-2">${boards.boardTitle }</h4>
		<h5 class="text-muted">질문 : ${boards. questionContent}</h5>
		
	</div>
			<div class="container mb-3">
				<h5><strong>작성자  ${boards.memberNickname }</strong> </h5>
					<h6 class="text-muted">
						작성일 ${boards.boardRegDay }
						좋아요 ${boards.boardLike }
						조회수 ${boards.boardCount }
						</h6>
			</div>
					
	<div class="shadow-none p-3 mb-5 bg-light rounded" style="border:1px solid lightgrey;">
		${boards.boardContent }
	</div>	

		<div style="float: right;">

		<button type="button"  class="btn btn-outline-danger" onClick="deleteConfirm();">글 삭제</button>
		</div>
	</div>
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
</body>
</html>