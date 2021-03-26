<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<%@ include file="/WEB-INF/layout/adminHeader.jsp" %>
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
    <a href="#this" class="btn" id="delete">삭제</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){      
            $("#list").on("click", function(e){ //목록 버튼
                e.preventDefault();
                fn_openQnaList();
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
            comSubmit.setUrl("<c:url value='/adminMem/qnaList' />");
            comSubmit.submit();
        }

        function fn_deleteQna(){
        	var QNA_NUM = "${qna.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminMem/qnaDelete'/>");
			comSubmit.addParam("QNA_NUM", QNA_NUM);
			comSubmit.submit();
        }
    </script> 
</body>
</html>