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
    		<td>${map.FAQ_TITLE }</td>
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><pre>${map.FAQ_CONTENTS}</pre></td>
    	</tr>
    </table>
    <br/>
     <div align="center">
    <a href="#this" class="btn" id="list">목록</a>
    <c:if test="${session_MEM_INFO.MEM_ADMIN == 'A' }">
    <a href="#this" class="btn" id="update">수정</a>
    <a href="#this" class="btn" id="delete">삭제</a>
    </c:if>
    </div>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){      
            $("#list").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openFaqList();
            }); 
             
            $("#update").on("click", function(e){ //제목 
                e.preventDefault();
                fn_updateFaqForm();
            });

            $("#delete").on("click", function(e){ //제목 
                var result = confirm("정말 삭제하시겠습니까?");
                if(result){
	                e.preventDefault();
	                fn_deleteFaq();
                }else{
                }
            });
        });
         
         
        function fn_openFaqList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/faqList' />");
            comSubmit.submit();
        }
         
        function fn_updateFaqForm(){
            var FAQ_NUM = "${map.FAQ_NUM}"
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/faqModifyForm' />");
            comSubmit.addParam("FAQ_NUM", FAQ_NUM);
            comSubmit.submit();
        }

        function fn_deleteFaq(){
        	var FAQ_NUM = "${map.FAQ_NUM}"
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/cos/faqDelete'/>");
			comSubmit.addParam("FAQ_NUM", FAQ_NUM);
			comSubmit.submit();
        }
    </script> 
</body>
</html>