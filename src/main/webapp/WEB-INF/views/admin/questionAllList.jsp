<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 질문 리스트</title>
</head>
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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="<c:url value='/resources/static/css/styles.css'/> "
	rel="stylesheet" type="text/css">s

<<<<<<< HEAD
	<h3>총 질문 수  : ${questionTotal }개</h3>
	<table border="1">
=======
</head>

<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/admin/main/adminHeader.jsp"></jsp:include>
	
	<h2 class="m-3">질문 목록</h2>
	<div class="dataTable-container">
	<h5 style="float: right;">총 질문 수  : ${questionTotal }</h5>
	<table id = "datatablesSimple" class="dataTable-table">
		<thead>
>>>>>>> c2a7b2c5ea37ad2fe3067297a2576d6b00312abd
		<tr>
			<th>NO</th>
			<th>질문 내용</th>
			<th>작성자</th>
		</tr>
		</thead>
		
		<tbody>
		<c:forEach var="q" items="${questions }">
			<tr>
				<td>${q.no}</td>
				<td>${q.questionContent }</td>
				<c:choose>
					<c:when test="${empty q.memberNickname}">
						<td>(null)</td>
					</c:when>
					<c:otherwise>
						<td>${q.memberNickname }</td>
					</c:otherwise>
				</c:choose>
			</tr>
		
		</c:forEach>
		</tbody>
	</table>
	
	<nav class="dataTable-pagination" style="float: right;">

	  <ul class="dataTable-pagination-list">
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="questionAll${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="questionAll${pageMaker.makeQuery(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="questionAll${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</nav>
	</div>
	<br> <a href="<c:url value='/admin/logout'/> ">로그아웃 하기</a><br>   
	<br> <a href="<c:url value='/admin/question/list'/> ">질문 추가/승인</a><br>
	<br> <a href="<c:url value='/admin/board/list'/> ">게시물 보기</a><br>   	
</body>
</html>