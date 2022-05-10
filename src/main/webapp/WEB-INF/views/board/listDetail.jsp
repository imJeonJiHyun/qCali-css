<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/static/css/dropdown.css'/> "
   rel="stylesheet" type="text/css">

<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1">
<title>QCali :: boardDetail</title>

<style>
.box {
   width: 1300px;
   margin: auto;
}

.reply_box {
   text-align:center;
}

.board_title {
   font-weight: 700;
   font-size: 25pt;
   margin: 10pt;
}

.board_info_box {
   color: #6B6B6B;
   margin: 10pt;
}

.board_tag {
   color: #6B6B6B;
   font-size: 9pt;
   margin: 10pt;
   padding-bottom: 10pt;
}

#reply {
   display: block;
   width : 800px;
   margin : auto;
   border-bottom: 1px solid black;
}

</style>
<link href="<c:url value='/resources/static/css/button.css'/> "
   rel="stylesheet" type="text/css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/main/sidebar_board.jsp"></jsp:include>

   <div class="container">
      <div class="box">
         <table class="table table-sm caption-top">
            <caption>일문일답 | ${boardList.boardSeq} 번째 글</caption>
         </table>

         <p class="board_title">${boardList.boardTitle}</p>
         <p class="board_info_box" style=" position: relative;  display: inline-block;">${boardList.boardRegday} &nbsp;&nbsp;by
            <c:if test="${empty boardList.memberNickname }">
                  탈퇴 회원
            </c:if>
            <c:if test="${!empty boardList.memberNickname }">
               <div class="dropdown" style=" position: relative;  display: inline-block;">
               <a href="" class="dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">${ boardList.memberNickname}</a>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                     <li><a class="dropdown-item" href="${pageContext.request.contextPath }/board/memberArticle?memberSeq=${boardList.memberSeq}">게시물 보기</a></li>
                     <li><a class="dropdown-item" href="${pageContext.request.contextPath }/diary/list/${boardList.memberSeq}">Diary 보기</a></li>
                        <li><a class="dropdown-item" href="#" onClick="popUpInfo();">회원 정보 보기</a></li>                        
                     </ul>
                  </div>
                     <script type="text/javascript">
                              function popUpInfo() {
                                 let url = "${pageContext.request.contextPath}/member/popup?memberSeq=${boardList.memberSeq}";
                                 let name = "Member 정보";
                                 let specs = "height=300, width= 250, status = no, location= no, top=50, left=50";
                                 window.open(url, name, specs);
                              }
                           </script>

            </c:if>
         </p>
         <p class="board_tag">조회수 : ${boardList.boardCount}, 공감 수 : ${boardList.boardLike}</p>
         <hr>
         <p>${boardList.boardContent}</p>
      </div>
      
      <div style="margin-top: 2%; padding-left: 20%; float: right;">
         <c:if test="${myArticle == true}">
            <button type="button" class="btn btn-default" id="noticeUpdate"
               onclick="window:location='<c:url value='/board/edit?boardSeq=${boardList.boardSeq}'/>'">수정</button>
            <button type="button" class="btn btn-default"
               onClick="deleteConfirm();">삭제</button>
            <input type="button" class="btn btn-default" value="목록"
               onclick="location.href='<c:url value='/board/list'/>'">
         </c:if>
      </div>



      <div >
         <a class="text-dark heart" style="text-decoration-line: none;"> <img
            id="heart" src="" height="30px">
         </a>
      </div>



          <!-- 댓글 입력 폼 -->
         <br>
         <hr>
         <br><br>
         <h5 style="padding-bottom:3%; text-align:center;">댓글 : [${replyTotal}] 개</h5>
         <div class="reply_box">
         <table class="reply_box" width="100%">
         <tr>
         <td width=25%></td>
         <td width=50%><textarea id="replyContent" name="replyContent" rows="3" cols="100"></textarea></td>
         <td width=25%><button type="button" class="btn btn-default" id="replywriteBtn" name="replywriteBtn">댓글 등록</button></td>
         </tr>
         </table>
         </div> <!-- reply_box end -->
       <br>
       <div id="replyList" class="reply_box" style="padding-bottom:10%;"></div>


      
      </div>
      <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>


      <%--댓글 / 좋아요 관련 자바스크립트 --%>
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <script>
      $(document).ready(function() {
         var heartval = ${boardHeart};
         
         if (heartval > 0) {
            console.log(heartval);
             $("#heart").prop("src", '<c:url value="/resources"/>'+"/static/images/heart-fill.svg");
            $(".heart").prop('name', heartval)
         } else {
            console.log(heartval);
            $("#heart").prop("src", '<c:url value="/resources"/>'+"/static/images/heart.svg");
            $(".heart").prop('name', heartval)
         }
         $(".heart").on("click", function() {
            var that = $(".heart");
         
            var sendData = {
               'boardSeq' : '${boardSeq}',
               'heart' : that.prop('name'),
            };
            $.ajax({
               url : '<c:url value="/board/heart"/>',
               type : 'POST',
               data : JSON.stringify(sendData),
               contentType: 'application/json',
               success : function(data) {
                  that.prop('name', data);
                  console.log("success:" + that.prop('name', data));
            
                  if (data == 1) {
                      $('#heart').prop("src",'<c:url value="/resources"/>'+"/static/images/heart-fill.svg");
                  } else {
                      $('#heart').prop("src",'<c:url value="/resources"/>'+"/static/images/heart.svg");
                  }
               }
            });
         });
      });

         //댓글 리스트 호출 함수
         $(document).ready(function() {
            getreplylist();
         });

         //댓글 리스트 함수
         function getreplylist() {
            var replyurl = "${root}reply/";
            var boardSeq = ${boardList.boardSeq};
            var memberSeq = -1;

            if(localStorage.getItem("memberLogin") == null) {
                memberSeq =  ${memberLogin.memberSeq};
            }
            
         	$.ajax({
         		url : replyurl + boardSeq,
         		type : 'POST',
         		dataType : 'json',

         		success : function(result) {
         			var htmls = "";

            		if (result.length < 1) {
               			htmls = "등록된 댓글이 없습니다.";
            		} else {
              			$(result).each(
                  			function() {
                     			htmls += '<div id="reply">'
                     			htmls += '<div id="replySeq'+this.replySeq+'">'
                     			htmls += '<br><br>'
                     			htmls += '<div style="float:left;">작성자 : ' + '<div class = "dropdown">'
                     			htmls += '<a href="#" class="dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">' + this.memberNickname;
                     			htmls += '</a> <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">'
                     			htmls += '<li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/memberArticle?memberSeq=' + this.memberSeq + '">게시물 보기</a></li>'
                    			htmls += '<li><a class="dropdown-item" href="${pageContext.request.contextPath}/diary/list/'+ this.memberSeq +'">Diary 보기</a></li>'
                     			htmls += '<li><a class="dropdown-item" href="#" onClick="popUpInfo();">회원 정보 보기</a></li>'
                     			htmls += '</ul></div>&nbsp;&nbsp;&nbsp;'
                     			htmls += '작성 날짜 : ' + this.replyRegDay;
                     			htmls += '</div><br>'
                     			htmls += '<table width="100%"><tr>'
                    			htmls += '<td width=70%><div style="float:left;">' + this.replyContent;
                  	 			htmls += '</div></td><td width=30%>'
                     			if (memberSeq == this.memberSeq) {
                     			htmls += '<div style="float:right;">'
                     			htmls += '<button type="button" class="w-btn w-btn-green" onclick="updateviewBtn(\'' + this.replySeq + '\', \'' + this.replyContent + '\', \'' + this.memberNickname + '\')">수정</button>&nbsp;&nbsp;'
                     			htmls += '<button type="button" class="w-btn w-btn-green" onclick="replyDeleteConfirm(\'' + this.replySeq + '\')">삭제</button>'
                    			htmls += '</div>'
                     			}
                     			htmls += '</td></tr></table><br><br></div></div>'
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
               'replyContent' : replyContent,
               'boardSeq' : '${boardList.boardSeq}',
               'memberSeq' : '${memberLogin.memberSeq}'
            });
            var headers = {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            };

            $.ajax({
               url : '<c:url value="/board/replyInsert"/>',
               headers : headers,
               data : paramData,
               type : 'POST',
               contentType : 'application/json',

               success : function(result) {
                  getreplylist();
                  console.log("댓글이 입력됐습니다.");

               },
               error : function(error) {
                  console.log("에러 : " + JSON.stringify(error));
               }
            });
         });

         //댓글 수정 폼 불러오기 함수
         function updateviewBtn(replySeq, replyContent, memberNickname) {
            var htmls = "";

            htmls += '<div id="replySeq'+replySeq+'">';
            htmls += '<strong>';
            htmls += '작성자 : ' + memberNickname;
            htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
            htmls += '<br/><p>';
            htmls += '<textarea class="form-control" id="replyUpdateContent">';
            htmls += replyContent;
            htmls += '</textarea></p><br/>';
            htmls += '<button type="button" class="btn btn-default" onclick="replyUpdateConfirm(\''
                  + replySeq + '\')">수정 완료</button>&nbsp;&nbsp;';
            htmls += '<button type="button" class="btn btn-default" onclick="getreplylist()">수정 취소</button>';
            htmls += '</div><br/>';
            $('#replySeq' + replySeq).replaceWith(htmls);
            $('#replySeq' + replySeq + '#replyContent').focus();
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
            var paramData = JSON.stringify({
               "replyContent" : replyContent
            });
            var headers = {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            };

            $.ajax({
               url : replyUpdateurl + replySeq,
               headers : headers,
               data : paramData,
               dataType : 'text',
               type : 'POST',
               contentType : 'application/json',

               success : function(result) {
                  getreplylist();
                  console.log("댓글이 수정됐습니다.");

               },
               error : function(error) {
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
            var headers = {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            };

            $.ajax({
               url : replyDeleteurl + replySeq,
               headers : headers,
               type : 'POST',
               dataType : 'text',
               contentType : 'application/json',

               success : function(result) {
                  getreplylist();

               },
               error : function(error) {
                  console.log("에러 : " + JSON.stringify(error));
               }
            });
         }
         
      
         //글 삭제시 이벤트 처리
      function deleteConfirm(){
         if(!confirm("정말 삭제하시겠습니까?")){
            return false;
         }
         else{
            location.href="<c:url value='/board/delete?boardSeq=${boardList.boardSeq}'/>";
         }
      }
      </script>
</body>
</html>