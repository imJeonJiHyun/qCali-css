<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	text-align: center;
}

table {
	margin: auto;
	width: 50%;
	height: 150px;
}
</style>

  <script>
        function findPwd_popup(){
            var url = '${pageContext.request.contextPath}/member/findPwd';
            var name = "비밀번호 찾기";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
            
        }
  </script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	<form:form commandName="loginMemberData">

		<table border="1">
			<tr>
				<td>아이디 :</td>
				<td><form:input path="memberId" placeholder="필수입력" /> <form:errors
						path="memberId" /></td>
			</tr>

			<tr>
				<td>비밀번호 :</td>
				<td><form:input path="memberPassword" type="password"
						placeholder="필수입력" /> <form:errors path="memberPassword" /></td>
			</tr>

		</table>
		<br>
		${msg}<br>
		<br>
		<input type="submit" value="로그인" />

	</form:form>
	

	<a href="#" onclick="findPwd_popup()" target = "_blank"><button>비밀번호 찾기</button></a>
	<a href="<c:url value='/member/insert'/>"><button>회원가입</button></a>
	<!--네이버 로그인 추가-->
	<br>
    <a href="${naverLoginURL }">
    <img src="<c:url value='/resources'/>/static/images/btnG_완성형.png" width="180px"	/></a>
	<div id="kakao_id_login" style="text-align: center">
		<a href="${kakao_url}"> 
		<img src="<c:url value='/resources/static/images/kakao_login_medium_narrow.png'/> "/></a>
	</div>

</body>


</html>