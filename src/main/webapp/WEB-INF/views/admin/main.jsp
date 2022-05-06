<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QCali :: Admin Main</title>
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
	

<body>
	<jsp:include page="/WEB-INF/views/admin/main/adminHeader.jsp"></jsp:include>
 	
 
<body class = "sb-nav-fixed">
	<div class="container mt-5">
	<h2 class="mt-3">랭킹 1위~5위</h2>
	
	<div class="dataTable-container mt-3">
	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" style="padding-bottom : 11px;" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
	</svg>
	
	<h4 style="display : inline-block;">게시물 랭킹</h4>
		
	<table id = "datatablesSimple" class="dataTable-table m-3">
		<thead>
		<tr>
			<th>순위</th>
			<th>ID</th>
			<th>닉네임</th>
			<th>작성 수</th>
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

	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" style="padding-bottom : 11px;" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
	</svg>
	
	<h4 style="display : inline-block;">댓글 수 랭킹</h4>
	<div class="dataTable-container">
	<table id = "datatablesSimple" class="dataTable-table m-3">
		<thead>
		<tr>
			<th>순위</th>
			<th>ID</th>
			<th>닉네임</th>
			<th>작성 수</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var ="r" items="${reply }">
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
	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" style="padding-bottom : 11px;" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
	</svg>
	
	<h4 style="display : inline-block;">일기 수  랭킹</h4>
	<div class="dataTable-container">
	<table id = "datatablesSimple" class="dataTable-table m-3">
		<thead>
		<tr>
			<th>순위</th>
			<th>ID</th>
			<th>닉네임</th>
			<th>작성 수</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var ="r" items="${diary }">
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
	
	</div>
</body>
</html>