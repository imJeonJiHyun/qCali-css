<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">



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
<title>QCali :: 비밀번호 변경</title>
<!-- 제이쿼리 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
	body{
		padding: 10%;
		text-align: center;
	}

</style>

</head>
	<script type="text/javascript">
		var submitFlag = false;
		
	  function nickCheck() {
	        $.ajax({
	            url : "/exam/member/nicknameDup",
	            type : "POST",
	            dataType :"JSON",
	            data : {"memberNickname" : $('#memberNickname').val()},
	            success : function (data) {
	                if(data == 1) {
	                	
	                	document.getElementById('nickSame').innerHTML='사용할 수 없는 닉네임 입니다.';
				        document.getElementById('nickSame').style.color='red';
	                } else if (data == 0) {
	                	
	                	document.getElementById('nickSame').innerHTML='사용 가능한 닉네임 입니다.';
			            document.getElementById('nickSame').style.color='blue';
			            submitFlag = true;
	                }
	                doSignUp();
	            }

	        })
	    }

	  function doSignUp() {

		  if (submitFlag == true) {
		  		$("#insertData").prop("disabled", false);
		  }
  }

	</script>
<body>



<div class="mb-3 row">
    <label class="col-sm-2 col-form-label">현재 닉네임 : ${memberLogin.memberNickname}</label>

		 <div class="col-sm-10">

<form>

 <label class="col-sm-2 col-form-label">변경 할 닉네임을 입력하세요.</label><br>
			<input type="text" id="memberNickname" class="form-control"/>
					<span id="nickSame"></span>
			<button type="button" onclick="nickCheck()" class="btn btn-default">중복확인</button><br><br>
	

		<button type="button" onClick="submit_close()" id="insertData" class="btn btn-outline-primary" disabled >닉네임 변경하기</button>
	
	
	<script>
	function submit_close() {
		
		let memberNickname = $('#memberNickname').val();

		$.ajax(
				{
					url : '${pageContext.request.contextPath}/member/mypage/changeNickname',
					type : 'POST',
					//data : JSON.stringify(memberNickname),
					data : memberNickname,
					contentType : 'application/json',			
					success : function()
						{
						alert("닉네임이 변경되었습니다.");
						console.log("변경된 닉네임"  + memberNickname);
					
							window.close();
						}
				});
	}

	</script>
</form>
</div>
</div>




</body>
</html>