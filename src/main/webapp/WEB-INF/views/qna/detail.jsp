<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/static/css/dropdown.css'/> "
	rel="stylesheet" type="text/css">
<style>
table {
	width: 50%;
	float:right;
}
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
	rel="stylesheet" type="text/css">
<title>QCali :: 문의사항 </title>
</head>
<body class="sb-nav-fixed">
<header>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>
</header>

	
	<div class="container mt-3">
		<h2>Q&A 문의 내용</h2>
	<br>
	
	<div class="shadow-none p-3 mb-5 bg-light rounded">
		<h2 class="fw-bolder">${vo.qnaTitle }</h2>
	</div>
		
	
	<table align="right" >
		<thead>
		<tr>
			<th>작성자</th>
			<c:if test="${! empty vo.qnaWriter  }">
				<td>${vo.qnaWriter }</td>
			</c:if>
			<c:if test="${empty vo.qnaWriter }">
				<c:if test="${!empty vo.memberNickname }">
					<td><div class="dropdown">
							<a class="dropbtn">${ vo.memberNickname}</a>
							<div class="dropdown-content">
								<a href="<c:url value='/board/mylist/memberSeq=${vo.memberSeq }'/> ">게시물 보기</a> 
								<a href=# onclick="popUpInfo();">회원 정보 보기</a>
							</div>
						</div></td>
				<script type="text/javascript">
					function popUpInfo(){
						let url = "${pageContext.request.contextPath}/member/popup?memberSeq=${b.memberSeq}";
						let name = "Member 정보";
						let specs = "height=300, width= 250, status = no, location= no, top=100, left=100";
						window.open(url, name, specs);}
				</script>
						
				</c:if>
				<c:if test="${empty vo.memberSeq}">
					<td>탈퇴한 회원</td>
				</c:if>
			</c:if>

			<th>작성일자</th>
			<td>${vo.qnaRegDay }</td>

			<th>조회수</th>
			<td>${vo.qnaReadcnt }</td>
		</tr>
	</table>

	
	<div class="shadow-none p-3 mb-5 bg-light rounded">
		${vo.qnaContent }	
	</div>
	
	첨부 파일
			<c:if test="${!empty vo.qnaFileName }">
					<a href="<c:url value='/qna/download?qnaSeq=${vo.qnaSeq}'/>">
						${vo.qnaFileName } </a>
				</c:if>
				

	<c:if test="${!empty admin }">
		<a href="javascript:void(0);" class="btu btn-danger"
			onClick="deleteConfirm();">삭제</a>

		<a href="<c:url value='/qna/modify?qnaSeq=${vo.qnaSeq }' /> ">수정하기</a>
		<c:if test="${ vo.qnaIndent == 0}">
			<a href="<c:url value='/qna/reply?qnaSeq=${vo.qnaSeq }' /> ">답글쓰기</a>
		</c:if>
	</c:if>

	<c:if test="${!empty member }">
		<a href="javascript:void(0);" class="btu btn-danger"
			onClick="deleteConfirm();">삭제</a>
		<a href="<c:url value='/qna/modify?qnaSeq=${vo.qnaSeq }' /> ">수정하기</a>
	</c:if>

</div>
<script>
	function deleteConfirm(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}
		else{
			location.href="<c:url value='/qna/delete?qnaSeq='/>"+${vo.qnaSeq};
		}
	}
</script>


</body>
</html>