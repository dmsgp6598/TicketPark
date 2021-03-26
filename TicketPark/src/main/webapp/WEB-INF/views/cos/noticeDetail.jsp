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
    		<td>${map.NT_TITLE }</td>
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><pre>${map.NT_CONTENTS}</pre></td>
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
                fn_openNoticeList();
            }); 
             
            $("#update").on("click", function(e){ //제목 
                e.preventDefault();
                fn_updateNoticeForm();
            });

            $("#delete").on("click", function(e){ //제목 
                var result = confirm("정말 삭제하시겠습니까?");
                if(result){
	                e.preventDefault();
	                fn_deleteNotice();
                }else{
                }
            });
        });
         
         
        function fn_openNoticeList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/noticeList' />");
            comSubmit.submit();
        }
         
        function fn_updateNoticeForm(){
            var NT_NUM = "${map.NT_NUM}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/noticeModifyForm' />");
            comSubmit.addParam("NT_NUM", NT_NUM);
            comSubmit.submit();
        }

        function fn_deleteNotice(){
        	var NT_NUM = "${map.NT_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/cos/noticeDelete'/>");
			comSubmit.addParam("NT_NUM", NT_NUM);
			comSubmit.submit();
        }
    </script> 
</body>
</html>