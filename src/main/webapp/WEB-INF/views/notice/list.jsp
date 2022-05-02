<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 리스트</title>
<!-- bootstrap css -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<header>
	<h1>공지 사항 게시판</h1>
</header>
	총 게시물  ${boardTotal}
		<table border = "1">
				<tr>
					<th>작성 번호</th>
					<th>제목</th>
					<th>작성 날짜</th>
				</tr>
		<c:forEach var ="notice" items="${notice}" varStatus="loop">
			<tr>
				<td>${notice.noticeSeq}</td>
				<td><a href="<c:url value="/notice/read/${notice.noticeSeq}"/>">${notice.noticeTitle}</a></td>
				<td>${notice.noticeRegDay}</td>
			</tr>
		</c:forEach>
		</table>
		<input type="button" value="메인화면" onclick="location.href='<c:url value="/home"/>'">
		<c:if test="${! empty adminAutoInfoCommand }">
		<br> <a href="<c:url value='/notice/write'/> ">공지사항 쓰기</a><br>   	
		</c:if>
	<div>
	  <ul>
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>