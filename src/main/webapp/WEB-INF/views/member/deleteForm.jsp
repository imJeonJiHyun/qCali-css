<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>QCali :: 회원탈퇴</title>
<script type="text/javascript">
		function button_event() {

			if (confirm("정말 삭제하시겠습니까??") == true) { //확인

				document.form.submit();

			} else { //취소

				return;

			}

		}
	</script>
	
	<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>


<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>

<div class="container">
<br><br>

<form action="${pageContext.request.contextPath}/member/mypage/delete" method="POST">
	<div class="mb-3 row">
	
	<label class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${memberLogin.memberId}">
    </div>
      <div class="mb-3 row">
	
		<label class="col-sm-2 col-form-label">Password</label>
		<div class="col-sm-10">
		<input name="memberPassword" type="password" placeholder="비밀번호를 입력해주세요" class="form-control"/>
				
	
	
		${msg}
		</div>
		
		<br><br>
		<input type="submit" value="회원탈퇴하기" onclick="button_event();"  class="btn btn-default"/>
		</div>
	</form>
		
</div>
</body>
</html>