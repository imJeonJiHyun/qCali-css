<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
	<script type="text/javascript">
let idck = false;
let pwck = false;
let nickck = false;


	function pwCheck() {

	    if(document.getElementById('memberPassword').value!='' && document.getElementById('memberPasswordCheck').value!='') {
	        if(document.getElementById('memberPassword').value==document.getElementById('memberPasswordCheck').value) {
	            document.getElementById('pwSame').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('pwSame').style.color='blue';
	            pwck = true;
	        }
	        else {
	            document.getElementById('pwSame').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('pwSame').style.color='red';
	            
	        }
	    }
	    doSignUp();
	}


		function idCheck() {
			var str = document.getElementById('memberId').value;
			var pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		  	  if(!pattern.test(str)) {
			  		document.getElementById('idSame').innerHTML='형식에 맞게 입력하세요.';
			  	      document.getElementById('idSame').style.color='red';
			  	  } else{
			  		  document.getElementById('idSame').innerHTML='';
						$.ajax({
				            url : "/exam/member/idDup",
				            type : "POST",
				            dataType :"JSON",
				            data : {"memberId" : $("#memberId").val()},
				            success : function (data) {
				                if(data == 1) {
				                	document.getElementById('idSame').innerHTML='사용할 수 없는 이메일 입니다.';
							        document.getElementById('idSame').style.color='red';
				                } else if (data == 0) {		           
						            document.getElementById('idSame').innerHTML='사용 가능한 이메일 입니다.';
						            document.getElementById('idSame').style.color='blue';
						            idck = true;
				                }
				                doSignUp();
				            }

				        })
			  	  }    	
			
		  	
		   
		}

	    
	  
	  function nickCheck() {
	        $.ajax({
	            url : "/exam/member/nicknameDup",
	            type : "POST",
	            dataType :"JSON",
	            data : {"memberNickname" : $("#memberNickname").val()},
	            success : function (data) {
	                if(data == 1) {
	                	document.getElementById('nickSame').innerHTML='사용할 수 없는 닉네임 입니다.';
				        document.getElementById('nickSame').style.color='red';
	                } else if (data == 0) {
	                    document.getElementById('nickSame').innerHTML='사용 가능한 닉네임 입니다.';
			            document.getElementById('nickSame').style.color='blue';
			            nickck = true;
	                }
	                doSignUp();
	            }

	        });
	        
	    }


		

		function doSignUp() {

			  if (idck == true && pwck == true && nickck == true) {
			  		$("#memberInsert").prop("disabled", false);
			  }
	  }
	</script>
<body>


회원가입 양식
<form:form commandName="InsertCommand"  id="insertForm" >

<table border="1">
		<tr>
			<th>이메일</th><td><form:input path="memberId" placeholder="이메일 입력  "/><form:errors path="memberId"/>
				<button type="button" onclick="idCheck()">아이디 중복확인</button>
				<span id="idSame"></span>
				</td>
		</tr>
		<tr>
			<th>비밀번호</th><td><form:password path="memberPassword" /><form:errors path="memberPassword"/></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th><td><form:password path="memberPasswordCheck" /><form:errors path="memberPasswordCheck"/>
			<button type="button" onclick="pwCheck()"> 비밀번호 확인 </button>
			<span id="pwSame"></span>
		</td>
		</tr>
		<tr>
			<th>닉네임</th><td><form:input path="memberNickname" /><form:errors path="memberNickname"/>
			<button type="button" onclick="nickCheck()"> 닉네임 중복확인 </button>
			<span id="nickSame"></span>
			</td>
		</tr>
		<tr>
			<th>생년월일</th><td><form:input path="memberBirthDay"  placeholder="생일 입력" />
			   <script>
    		    $(function () {
    		    
           		 $("#memberBirthDay").datepicker({
           			 //changeMonth: true,
           			 //changeDay: true,
           			 //changeYear: true,
           			 showMonthAfterYear:false,
           			 dateFormat:"mm-dd"
           			
           		 });
           	
        	});
  			  </script>


			<form:errors path="memberBirthDay"/>

			
			<span id="date"></span>
			</td>
		</tr>
		
	</table>
	<br>
	
	<input type="submit" class="btn btn-lg btn-success btn-block" value="회원가입" id="memberInsert" disabled/>

</form:form>

</body>
</html>