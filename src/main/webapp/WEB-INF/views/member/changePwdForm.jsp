<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script type="text/javascript">
var submitFlag = false;

	function pwCheck() {

	    if(document.getElementById('memberPassword').value!='' && document.getElementById('memberPasswordCheck').value!='') {
	        if(document.getElementById('memberPassword').value==document.getElementById('memberPasswordCheck').value) {
	            document.getElementById('pwSame').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('pwSame').style.color='blue';
	            submitFlag = true;
	        }
	        else {
	            document.getElementById('pwSame').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('pwSame').style.color='red';
	        }
            doSignUp();
	    }
	}
	
	  function doSignUp() {

		  if (submitFlag == true) {
		  		$("#insertData").prop("disabled", false);
		  }
	  }

	</script>
<body>



		<table border="1">

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="memberPassword" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="memberPasswordCheck" />
					<button type="button" onclick="pwCheck()">비밀번호 확인</button> 
					<span id="pwSame"></span></td>
			</tr>

		</table>
		
		<br>
		<input type="button" onClick="submit_close()" value="비밀번호 변경하기" id="insertData" disabled/>
		<script>
	function submit_close() {

		$.ajax(
				{
					url : '${pageContext.request.contextPath}/member/mypage/changePwd',
					type : 'POST',
					data :  JSON.stringify({
						memberPassword : $('#memberPassword').val(),
						memberPasswordCheck : $('#memberPasswordCheck').val()
					}),
					contentType : 'application/json',			
					success : function(result){
						console.log(result);
						console.log(result == false);
						console.log(result == true);
						
						if(result == false){
							
							alert("사용할 수 없는 번호입니다.");
							} 
						else {

								alert("비밀번호 변경이 완료되었습니다.");
								window.close();
	
							}
						},
				});
	}

	</script>

</body>
</html>