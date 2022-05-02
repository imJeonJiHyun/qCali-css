<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>

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
    <script>
        function nickname_popup(){
            var url = '${pageContext.request.contextPath}/member/mypage/changeNickname';
            var name = "nickname_change";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
            
        }
        
        function pwd_popup(){
            var url = "${pageContext.request.contextPath}/member/mypage/changePwd";
            var name = "pwd_change";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>

<meta charset="UTF-8">
<title>qCali :: Mypage</title>


	
</head>
<body>


<c:if test="${confirmPW == false}">

<form action="${pageContext.request.contextPath}/member/mypage/confirmPwd" method="POST">
	<table border="1">
		<tr>
				<td>비밀번호 : </td>
				<td><input name="memberPassword" type="password" placeholder="비밀번호를 입력해주세요"/>
				${msg}
				</td>
			</tr>
		
		</table>
	
		
		<input type="submit" value="입력하기" />
		</form>
	

</c:if>	

<c:if test="${confirmPW == true }">
<c:if test="${!empty memberLogin}">

${memberLogin.memberNickname}님 마이페이지

<table border="1">

	<tr>
		<td>내가 쓴글</td> <td>${boardTotal}</td>
		<td>E-Mail</td> <td>${memberLogin.memberId}</td>
	</tr>
	<tr>
		<td>회원 가입 날짜</td> <td>${memberLogin.memberRegDay}</td>
		<td>생일</td> <td>${memberLogin.memberBirthDay}</td>
	</tr>

</table>
		
		<%-- api 로그인 계정 상태 체크 -> 비밀번호 변경 불가 --%>
		<c:if test="${memberLogin.naver eq 'F' && memberLogin.kakao eq 'F'}">
			<a href="#" onclick="javascript:pwd_popup()" target = "_blank"><button>비밀번호 변경하기</button></a>

		</c:if>
		
		<a href="#" onclick="javascript:nickname_popup()" target = "_blank"><button>닉네임 변경하기</button></a>
		

		
		<a href="<c:url value='/member/logout'/>"><button>로그아웃</button></a>
	
		<a href="<c:url value='/member/mypage/delete?memberSeq=${memberLogin.memberSeq }'/>" ><button>회원탈퇴</button></a>
	
	
	
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
		<h2>내가 쓴 게시글 List</h2>
			<c:forEach var="list" items="${boardList}">
				<tr>
					<td>${list.rn}</td>

					<td><a
						href="<c:url value='/board/detail?boardSeq=${list.boardSeq}'/>">${list.boardTitle}</a>

					</td>
					
					<td>	<c:if test="${empty list.memberNickname }"> 탈퇴 회원  </c:if>
						${list.memberNickname}</td>
						 
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
						href="confirmPwd${pageMaker.makeQuery(pageMaker.startPage - 1) }&memberSeq=${memberLogin.memberSeq}">이전</a>
					</li>
				</c:if>

				<c:forEach var="currentPage" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li><a
						href="confirmPwd${pageMaker.makeQuery(currentPage) }&memberSeq=${memberLogin.memberSeq}">${currentPage }</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li ><a
						href="confirmPwd${pageMaker.makeQuery(pageMaker.endPage + 1) }&memberSeq=${memberLogin.memberSeq}'/>">다음</a>
					</li>
				</c:if>
			</ul>

	

	</c:if>
</c:if>

	<c:if test="${empty memberLogin}">
		<script>
	alert("로그인 정보가 없습니다.");
	document.location.href="<c:url value='/member/login'/>";
</script>
	</c:if>

	
</body>
</html>