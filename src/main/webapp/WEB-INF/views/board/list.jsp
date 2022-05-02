<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>

<meta charset="UTF-8">
<link href="<c:url value='/resources/static/css/dropdown.css'/> " rel="stylesheet" type="text/css">

<style>
ul {
	list-style: none;
	/* 	width: 30%; */
}

li {
	float: left;
	margin-left: 5px;
}
</style>

<title>Insert title here</title>
</head>
<body>



		<c:if test="${!empty memberLogin}">
			<h2>로그인 성공</h2>

	      게시글 수 : ${boardTotal }
	      <table border="1">
				<tr>
					<th>회원 번호</th>
					<th>회원 ID</th>
					<th>회원 닉네임</th>
					<th>회원 생일</th>
					<th>회원 가입 날짜</th>
					<th>회원 인증 여부</th>
					<th>회원 레벨</th>
				</tr>
				<tr>
					<td>${memberLogin.memberSeq}</td>
					<td>${memberLogin.memberId}</td>
					<td>${memberLogin.memberNickname}</td>
					<td>${memberLogin.memberBirthDay}</td>
					<td>${memberLogin.memberRegDay}</td>
					<td>${memberLogin.memberAuth}</td>
					<td>${memberLogin.memberLevel}</td>

				</tr>
			</table>
			<a href="<c:url value='/member/logout'/>"><button>로그아웃</button></a>
			<a
				href="<c:url value='/board/write?questionSeq=${boardQuestion.questionSeq }'/>"><button>글쓰기</button></a>
			<a href="<c:url value='/board/mylist?memberSeq=${memberLogin.memberSeq}'/>"><button>내가 쓴 글 모아보기</button></a>
			<a href="<c:url value='/member/questionAdd'/>"><button>질문
					등록하기</button></a>
			<a
				href="<c:url value='/member/mypage/confirmPwd?memberSeq=${memberLogin.memberSeq}'/>"><button>마이페이지</button></a>

		</c:if>



	<table border="1">
		<tr>
			<td>${boardQuestion.questionContent}</td>
			<td>${boardQuestion.questionSeq}</td>
		</tr>
	</table>

	<h2>공지사항</h2>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="n" items="${notice }">
			<tr>
				<td><a href="<c:url value='/notice/read/${n.noticeSeq}' />">${n.noticeTitle}</a></td>
				<td>${n.noticeRegDay }</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${empty memberLogin}">
		<a href="<c:url value='/member/login'/>"><button>로그인</button></a>
	</c:if>

	<form action="<c:url value='/board/search'/>">
		<p>
			<select name="searchOption">
				<option value="boardTitle">제목</option>
				<option value="memberNickname">닉네임</option>
			</select> <label>(으)로 검색 <input name="searchWord" /></label> <input
				type="submit" value="조회">
		</p>

	</form>


	<table border="1">
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>좋아요</th>
			<th>카운트</th>


		</tr>

		<c:if test="${ empty boardList}">
			<tr>
				<td colspan="7">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${ !empty boardList}">
			<c:forEach var="list" items="${boardList}">
				<tr>
					<td>${list.rn}</td>

					<td><a
						href="<c:url value='/board/detail?boardSeq=${list.boardSeq}'/>">${list.boardTitle}</a>

					</td>

					<td>
						<c:if test="${empty list.memberNickname }">
                  			탈퇴 회원
            		   </c:if>
            		   <c:if test="${!empty list.memberNickname }">
            		   
            		   <div class="dropdown">
							<a href="#" class="dropbtn">${ list.memberNickname}</a>
							<div class="dropdown-content">
								<a href="<c:url value='/board/mylist?memberSeq=${list.memberSeq }'/> ">게시물 보기</a>
								<a href=# onclick="popUpInfo();">회원 정보 보기</a>
								<script type="text/javascript">
									function popUpInfo(){
									let url = "${pageContext.request.contextPath}/member/popup?memberSeq=${list.memberSeq}";
									let name = "Member 정보";
									let specs = "height=300, width= 250, status = no, location= no, top=100, left=100";
									window.open(url, name, specs);
									}
						</script>
							</div>
						</div>
						</c:if>
					</td>
					<td>${list.boardRegday}</td>
					<td>${list.boardLike}</td>
					<td>${list.boardCount}</td>
				</tr>
						
			</c:forEach>

		</c:if>
	</table>

	<ul>
		<c:if test="${pageMaker.prev }">
			<li><a
				href="list${pageMaker.makeQuery(pageMaker.startPage - 1) }">이전</a></li>
		</c:if>

		<c:forEach var="currentPage" begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }">
			<li><a href="list${pageMaker.makeQuery(currentPage) }">${currentPage }</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1) }">다음</a>
			</li>
		</c:if>
	</ul>


</body>
</html>