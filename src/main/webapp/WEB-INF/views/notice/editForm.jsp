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
<title>공지 사항 Detail Update</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="<c:url value="/resources"/>/static/js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>
	
	<div class="container">
	<form action="${pageContext.request.contextPath}/notice/update?noticeSeq=${notice.noticeSeq}" method="POST" name="updateForm" onsubmit="return nullCheck()">
		<div class="box">
			<table class="table table-sm caption-top">
				<caption>공지사항    |  ${notice.noticeSeq} 번째 글 수정</caption>
			</table>
        	<p class="board_title"><input type="text" name="noticeTitle" value="${notice.noticeTitle}" /></p>
        	<p class="board_info_box">${notice.noticeRegDay} by <a href='/member/popup?memberSeq=${notice.noticeSeq}'>닉네임</a></p> <!-- notice에는 닉네임 받는 곳이 없어서 임시로 지정 -->
        	<p class="board_tag">조회수 : <c:out value="${notice.noticeSeq}"/>,  댓글 : <c:out value="${notice.noticeSeq}"/>,  공감 수 : <c:out value="${notice.noticeSeq}"/></p> <!-- 임시로 지정 -->    
        	<hr><p><textarea name="noticeContent">${notice.noticeContent}</textarea>
        			<script>
						CKEDITOR.replace('noticeContent',{filebrowserUploadUrl : '${pageContext.request.contextPath}/notice/fileupload'});
					</script></p>
    	</div>
		
		<div style="margin-top:2%; padding-left:20%; float:right;">
			<c:if test="${adminAuthInfoCommand != null}">
			<input type="submit" class="btn btn-outline-info" value="수정하기" />
			<input type="button" class="btn btn-outline-info" value="수정취소" onclick="updateConfirm()">
			</c:if>
		</div>
	
	<script>
		function updateConfirm(){
			if(!confirm("수정을 취소하시겠습니까?")){
				return false;			
			}
			else{
				location.href="<c:url value='/notice/read/'/>"+${notice.noticeSeq};
			}
		}

		function nullCheck() {
			if (updateForm.noticeTitle.value == "") {
				alert("제목을 입력해주세요.");
				updateForm.noticeTitle.focus();
				return false;
			} else if (updateForm.noticeContent.value == "") {
				alert("내용을 입력해주세요.");
				updateForm.noticeContent.focus();
				return false;
			}
		}
	 </script>
    </form>
   </div>
  </body>
</html>