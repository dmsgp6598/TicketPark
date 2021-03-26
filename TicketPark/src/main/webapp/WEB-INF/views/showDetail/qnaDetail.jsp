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
    		<td>${qna.SHOWQNA_TITLE }</td>
    		
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><pre>${qna.SHOWQNA_CONTENTS}</pre></td>
    	</tr>
    </table>
    <br/>
    <div align="center">
    <a href="#this" class="btn" id="list">목록</a>
    <c:if test="${qna.SHOWQNA_ID == session_MEM_INFO.MEM_ID}">
    	<a href="#this" class="btn" id="update">수정</a>
    	<c:if test="${qna.SHOWQNA_RESTEP == 0 }">
    		<a href="#this" class="btn" id="delete">삭제</a>
    	</c:if>
    </c:if>
    </div>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){      
            $("#list").on("click", function(e){ //목록 버튼
                e.preventDefault();
                fn_openShowQnaList();
            }); 
             
            $("#update").on("click", function(e){ //수정 
                e.preventDefault();
                fn_updateShowQnaForm();
            });

            $("#delete").on("click", function(e){ //삭제 
                var result = confirm("정말 삭제하시겠습니까?");
                if(result){
	                e.preventDefault();
	                fn_deleteShowQna();
                }else{
                }
            });
        });
         
         
        function fn_openShowQnaList(){
            var comSubmit = new ComSubmit();
            comSubmit.addParam("SHOW_NUM", "${qna.SHOWQNA_SHOWNUM}");
            comSubmit.addParam("mode", "3");
            comSubmit.setUrl("<c:url value='/showDetail' />");
            comSubmit.submit();
        }
         
        function fn_updateShowQnaForm(){
            var SHOWQNA_NUM = "${qna.SHOWQNA_NUM}";
            var SHOWQNA_RESTEP = "${qna.SHOWQNA_RESTEP}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/showDetail/qnaModifyForm' />");
            comSubmit.addParam("SHOWQNA_NUM", SHOWQNA_NUM);
            comSubmit.addParam("SHOWQNA_RESTEP", SHOWQNA_RESTEP);
            comSubmit.submit();
        }

        function fn_deleteShowQna(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/showDetail/qnaDelete'/>");
			comSubmit.addParam("SHOWQNA_NUM", "${qna.SHOWQNA_NUM}");
			comSubmit.addParam("SHOWQNA_SHOWNUM", "${qna.SHOWQNA_SHOWNUM}");
			comSubmit.submit();
        }
    </script> 
</body>
</html>