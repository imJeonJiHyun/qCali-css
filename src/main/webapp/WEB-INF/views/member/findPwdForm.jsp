<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>QCali :: 비밀번호 찾기</title>

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
	
	
	<style type="text/css">
	body{
		padding: 10%;
		text-align: center;
	}

</style>

</head>
<body>

<div class="mb-3 row">
    <label class="col-sm-2 col-form-label">가입시 사용한 이메일을 입력해주세요.</label>

		 <div class="col-sm-10">




	<input type="text" id="memberId"  class="form-control"/>

	<br>

	<button type="button" onClick="submit_close()" class="btn btn-outline-primary">비밀번호 찾기</button>
</div>
</div>

	<script>
		function submit_close() {

			let memberId = $('#memberId').val();

			$.ajax({
				url : '${pageContext.request.contextPath}/member/findPwd',
				type : 'POST',
				data : memberId,
				contentType :'application/json',
				success : function(result) {
					console.log(result);
					console.log(result == false);
					console.log(result == true);
					
					
					if(result == true){
					alert("이메일로 임시 비밀번호가 발송되었습니다.");
					window.close();
					
					} else {
						
						alert("회원 정보가 없습니다.");
						
					}
				},
			});
		}
	</script>


</body>
</html>