<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.box {
  width: 1300px;
  padding-top: 3%;
  padding-left: 15%;
}
.board_title {
	font-weight : 700;
	font-size : 25pt;
	margin : 10pt;
}
.board_info_box {
	color : #6B6B6B;
	margin : 10pt;
}
.board_tag {
	color : #6B6B6B;
	font-size : 9pt;
	margin : 10pt;
	padding-bottom : 10pt;
}
</style>
<meta charset="UTF-8">
<link href="<c:url value='/resources/static/css/button.css'/> "
	rel="stylesheet" type="text/css">
<title>공지 사항 Detail</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>
	
	<div class="container">
		<div class="box">
			<table class="table table-sm caption-top">
				<caption>공지사항    |  ${notice.noticeSeq} 번째 글</caption>
			</table>
        	<p class="board_title">${notice.noticeTitle}</p>
        	<p class="board_info_box">${notice.noticeRegDay} by <a>관리자</a></p>
        	<hr><p>${notice.noticeContent}</p>
    	</div>
		
		<div style="margin-top:2%; padding-left:20%; padding-bottom:10%; float:right;">
			<c:if test="${adminAuthInfoCommand != null}">
			<button type="button" class="w-btn w-btn-green" id="noticeUpdate" onclick="window:location='<c:url value='/notice/update?noticeSeq=${notice.noticeSeq}'/>'">수정</button>
			<button type="button" class="w-btn w-btn-green" onClick="deleteConfirm();">삭제</button>
			<input type="button" class="w-btn w-btn-green" value="목록" onclick="location.href='<c:url value='/notice/list'/>'">
			</c:if>
		</div>
		</div>
		
	 <%--   <!-- 댓글 입력 폼 -->
      	<br>
      	<hr><h5 class="box" style="padding-bottom:5%;">댓글 : [${replyTotal}] 개</h5><br><br>
      	<table border="1" width="200px">
      	<tr bgcolor="#F5F5F5">
      	<td width="150">
      	<div>${memberLogin.memberNickname}</div></td>
      	<td width="550">
        <div><textarea id="replyContent" name="replyContent" rows="4" cols="70"></textarea></div></td>
        <td width="100">
        <div><button type="button" class="btn btn-default" id="replywriteBtn" name="replywriteBtn">댓글 등록</button></div></td>
      	</tr></table>
      	<div id="replyList"></div></div>


	댓글  관련 자바스크립트 
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		//댓글 리스트 호출 함수
		$(document).ready(function() {
			getreplylist();
		});
		
		
		//댓글 리스트 함수
		function getreplylist() {
			var replyurl = "${root}reply/";
			var boardSeq = ${boardList.boardSeq};
			var memberSeq = ${memberLogin.memberSeq};
			
			$.ajax({
				url : replyurl+boardSeq,
				type : 'POST',
				dataType : 'json',
				
				success: function(result){
					console.log(result);
					var htmls = "";
					
					if(result.length < 1) {
						htmls = "등록된 댓글이 없습니다.";
						
					} else {
						$(result).each(function() {
							htmls += '<div id="reply">'
							htmls += '<div id="replySeq'+this.replySeq+'">';
							htmls += '<br>작성자 : ' + '<div class = "dropdown"> '
							htmls += '<a href="#" class="dropbtn">'+ this.memberNickname;
							htmls += '</a> <div class="dropdown-content">'
							htmls += '<a href="${pageContext.request.contextPath}/board/memberArticle?memberSeq='+this.memberSeq +'">게시물 보기</a>'
							htmls += '<a href="#" onclick ="popUpInfo();">회원 정보 보기</a>'
							htmls += '</div></div>'
							htmls += '&nbsp;&nbsp;&nbsp;&nbsp;';
							htmls += '작성 날짜 : ' + this.replyRegDay;
							htmls += '<br/><p>';
							htmls += '댓글 내용 : &nbsp;&nbsp; <div id="reply_content">' + this.replyContent;
							htmls += '</div></p>';
							if(memberSeq ==  this.memberSeq){
							htmls += '<button type="button" class="btn btn-outline-success" onclick="updateviewBtn(\'' + this.replySeq + '\', \'' + this.replyContent + '\', \''+ this.memberNickname + '\')">수정</button>&nbsp;&nbsp;';
							htmls += '<button type="button" class="btn btn-outline-success" onclick="replyDeleteConfirm(\'' + this.replySeq + '\')">삭제</button>';
							}
							htmls += '</div><br/>';
							htmls += '</div>'
						});
					};
						$("#replyList").html(htmls);
				}
			});
		}
		
		//댓글 저장 함수
		$(document).on('click', '#replywriteBtn', function() {
			var replyContent = $('#replyContent').val();	
			var paramData = JSON.stringify({
				'replyContent': replyContent, 'boardSeq':'${boardList.boardSeq}', 'memberSeq':'${memberLogin.memberSeq}'});
			var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
				
			$.ajax({
				url: '<c:url value="/board/replyInsert"/>',
				headers : headers,
				data : paramData,
				type : 'POST',
				contentType : 'application/json',
				
				success: function(result){
					getreplylist();
					console.log("댓글이 입력됐습니다.");
				
				}, error: function(error) {
					console.log("에러 : " + JSON.stringify(error));
				}
			});
		});
		
		
		//댓글 수정 폼 불러오기 함수
		function updateviewBtn(replySeq, replyContent, memberNickname) {
			var htmls = "";
				
			htmls += '<div id="replySeq'+replySeq+'">';
			htmls += '<strong>';
			htmls += '작성자 : '+memberNickname;
			htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
			htmls += '<br/><p>';
			htmls += '<textarea class="form-control" id="replyUpdateContent">';
			htmls += replyContent;
			htmls += '</textarea></p><br/>';
			htmls += '<button type="button" class="btn btn-outline-success" onclick="replyUpdateConfirm(\'' + replySeq + '\')">수정 완료</button>&nbsp;&nbsp;';
			htmls += '<button type="button" class="btn btn-outline-success" onclick="getreplylist()">수정 취소</button>';
			htmls += '</div><br/>';
			$('#replySeq'+replySeq).replaceWith(htmls);
			$('#replySeq'+replySeq+'#replyContent').focus();
		}
			
		
		//댓글 수정 호출 함수
		function replyUpdateConfirm(replySeq) {	
			var delConfirm = confirm('댓글 수정을 완료하시겠습니까?');
			
				if (delConfirm) {
			    	alert('수정되었습니다.');
			    	replyUpdateBtn(replySeq);
			   	} else {
			      	alert('수정이 취소되었습니다.');
			      	getreplylist();
			   	}	
		}
		
		
		//댓글 수정 함수
		function replyUpdateBtn(replySeq) {	
			var replyUpdateurl = "${root}replyUpdate/";				
			var replyContent = $('#replyUpdateContent').val();
			var paramData = JSON.stringify({"replyContent": replyContent});
			var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
			
			$.ajax({
				url : replyUpdateurl + replySeq,				
				headers : headers,
				data : paramData,
				dataType : 'text',
				type : 'POST',
				contentType : 'application/json',
				
				success: function(result){
					getreplylist();
					console.log("댓글이 수정됐습니다.");
				
				}, error: function(error){
					console.log("에러 : " + JSON.stringify(error));
				}
			});
		}
		
		
		//댓글 삭제 호출 함수
		function replyDeleteConfirm(replySeq) {	
			var delConfirm = confirm('정말 댓글을 삭제하시겠습니까?');
			
				if (delConfirm) {
			    	alert('삭제되었습니다.');
			    	replydelete(replySeq);
			   	} else {
			      	alert('삭제가 취소되었습니다.');
			      	getreplylist();
			   	}	
		}
		
			
		//댓글 삭제 함수
		function replydelete(replySeq) {				
			var replyDeleteurl = "${root}replydelete/";
			var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
			
			$.ajax({
				url: replyDeleteurl+replySeq,
				headers : headers,
				type: 'POST',
				dataType : 'text',
				contentType : 'application/json',
				
				success: function(result){
					getreplylist();
			
				}, error: function(error){
					console.log("에러 : " + JSON.stringify(error));
				}
			});
		}

		function deleteConfirm(){
			if(!confirm("정말 삭제하시겠습니까?")){
				return false;
			}
			else{
				location.href="<c:url value='/notice/delete?noticeSeq='/>"+${notice.noticeSeq};
			}
		}
	</script>--%>
  </body>
</html>