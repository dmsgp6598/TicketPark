<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <form id="frm">
    <table align="center">
    	<tr>
    		<th align="left">제목</th>
    	</tr>
    	<tr>
    		<td><input type="text" id="SHOWQNA_TITLE" name="SHOWQNA_TITLE"/></td>
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><textarea id="SHOWQNA_CONTENTS" name="SHOWQNA_CONTENTS" cols="40" rows="8"></textarea></td>
    	</tr>
    </table>
    </form>
    <br/>
    <div align="center">
   	<a href="#this" class="btn" id="ask">문의하기</a>
    <a href="#this" class="btn" id="list">목록</a>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){   
    	$("#ask").on("click", function(e){ //글쓰기 버튼
    		if($("#SHOWQNA_TITLE").val()==""){
				alert("제목을 입력해주세요.");
				$("#SHOWQNA_TITLE").focus();
				return false;
			}
			if($("#SHOWQNA_CONTENTS").val()==""){
				alert("내용을 입력해주세요.");
				$("#SHOWQNA_CONTENTS").focus();
				return false;
			}
        	
          	 	e.preventDefault();
           		fn_qnaWrite("${session_MEM_INFO.MEM_ID}");
        }); 
            $("#list").on("click", function(e){ //목록버튼
                e.preventDefault();
                fn_openShowQnaList();
            }); 
        });

        function fn_qnaWrite(memid){
            var showNum = "${SHOWQNA_SHOWNUM}";
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/showDetail/qnaWrite' />");
            comSubmit.addParam("SHOWQNA_SHOWNUM", showNum);
            comSubmit.addParam("SHOWQNA_ID",memid);
            comSubmit.submit();
        }
         
        function fn_openShowQnaList(){
            var comSubmit = new ComSubmit();
            comSubmit.addParam("SHOW_NUM", "${SHOWQNA_SHOWNUM}");
            comSubmit.setUrl("<c:url value='/showDetail' />");
            comSubmit.submit();
        }
    </script> 
</body>
</html>