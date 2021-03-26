<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

    <table align="center">
    	<tr>
    		<th align="left">제목</th>
    	</tr>
    	<tr>
    		<td>${qna.QNA_TITLE }</td>
    		
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><pre>${qna.QNA_CONTENTS}</pre></td>
    	</tr>
    </table>
    <br/>
    <a href="#this" class="btn" id="list">목록</a>
    <c:if test="${qna.QNA_ADMIN == 'M' }">
    <a href="#this" class="btn" id="update">수정</a>
    <a href="#this" class="btn" id="delete">삭제</a>
    </c:if>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){      
            $("#list").on("click", function(e){ //목록 버튼
                e.preventDefault();
                fn_openQnaList();
            }); 
             
            $("#update").on("click", function(e){ //수정 
                e.preventDefault();
                fn_updateQnaForm();
            });

            $("#delete").on("click", function(e){ //삭제 
                var result = confirm("정말 삭제하시겠습니까?");
                if(result){
	                e.preventDefault();
	                fn_deleteQna();
                }else{
                }
            });
        });
         
         
        function fn_openQnaList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/mypage/myQnaList' />");
            comSubmit.submit();
        }
         
        function fn_updateQnaForm(){
            var QNA_NUM = "${qna.QNA_NUM}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/mypage/qnaModifyForm' />");
            comSubmit.addParam("QNA_NUM", QNA_NUM);
            comSubmit.submit();
        }

        function fn_deleteQna(){
        	var QNA_NUM = "${qna.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/mypage/qnaDelete'/>");
			comSubmit.addParam("QNA_NUM", QNA_NUM);
			comSubmit.submit();
        }
    </script> 
</body>
</html>