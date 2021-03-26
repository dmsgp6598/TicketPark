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
    		<td><input type="text" id="SHOWQNA_TITLE" name="SHOWQNA_TITLE" value="${qna.SHOWQNA_TITLE }"/>
    		<input type="hidden" id="SHOWQNA_NUM" name="SHOWQNA_NUM" value="${qna.SHOWQNA_NUM }"/>
    		<input type="hidden" id="SHOWQNA_RESTEP" name="SHOWQNA_RESTEP" value="${qna.SHOWQNA_RESTEP }"/></td>
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><textarea id="SHOWQNA_CONTENTS" name="SHOWQNA_CONTENTS" cols="40" rows="8">${qna.SHOWQNA_CONTENTS }</textarea></td>
    	</tr>
    </table>
    </form>
    <br/>
    <div align="center">
    <a href="#this" class="btn" id="update">수정</a>
    <a href="#this" class="btn" id="cancel">취소</a>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){   
    	$("#update").on("click", function(e){ //수정 버튼
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
            fn_updateShowQna();
        }); 
               
            $("#cancel").on("click", function(e){ //취소 버튼
                e.preventDefault();
                fn_updateShowQnaForm();
            }); 
        });

        function fn_updateShowQna(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/showDetail/qnaModify' />");
            comSubmit.addParam("SHOWQNA_SHOWNUM","${qna.SHOWQNA_SHOWNUM}");
            comSubmit.submit();
        }
         
        function fn_updateShowQnaForm(){
            history.go(-1);
        }
    </script> 
</body>
</html>