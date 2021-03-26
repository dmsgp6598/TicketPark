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
    		<td><input type="text" id="NT_TITLE" name="NT_TITLE"/></td>
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><textarea id="NT_CONTENTS" name="NT_CONTENTS" cols="40" rows="8"></textarea></td>
    	</tr>
    </table>
    </form>
    <br/>
    <div align="center">
    <a href="#this" class="btn" id="write">글쓰기</a>
    <a href="#this" class="btn" id="list">목록</a>
     </div>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){   
    	$("#write").on("click", function(e){ //글쓰기 버튼
    		if($("#NT_TITLE").val()==""){
				alert("제목을 입력해주세요.");
				$("#NT_TITLE").focus();
				return false;
			}
			if($("#NT_CONTENTS").val()==""){
				alert("내용을 입력해주세요.");
				$("#NT_CONTENTS").focus();
				return false;
			}
        	
            e.preventDefault();
            fn_noticeWrite();
        });  
               
            $("#list").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openNoticeList();
            }); 
        });

        function fn_noticeWrite(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/cos/noticeWrite' />");
            comSubmit.submit();
        }
         
        function fn_openNoticeList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/noticeList' />");
            comSubmit.submit();
        }
    </script> 
</body>
</html>