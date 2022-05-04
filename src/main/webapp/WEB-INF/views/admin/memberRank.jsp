<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QCali :: 게시물 개수</title>
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
</head>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="<c:url value='/resources/static/css/styles.css'/> "
	rel="stylesheet" type="text/css">
	
<body class = "sb-nav-fixed">
	
	<h4>게시물 랭킹(1~10위)</h4>
	<div class="dataTable-container">
	<table id = "datatablesSimple" class="dataTable-table">
		<thead>
		<tr>
			<th>순위</th>
			<th>ID</th>
			<th>닉네임</th>
			<th>작성 게시물 수</th>
		</tr>
		</thead>
		
		<tbody>
			<c:forEach var ="r" items="${rank }">
				<tr>
					<td>${r.rank }위</td>
					<td>${r.memberId }</td>
					<td>${r.memberNickname }</td>
					<td>${r.count }개</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
</body>
</html>