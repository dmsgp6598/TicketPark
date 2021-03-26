<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<%@ include file="/WEB-INF/layout/adminHeader.jsp" %>
    <form id="frm" style="margin-top:15px">
    <table align="center">
    	<tr>
    		<th align="left">제목</th>
    	</tr>
    	<tr>
    		<td><input type="text" id="QNA_TITLE" name="QNA_TITLE" value="[답변]${qna.QNA_TITLE }"/>
    		<input type="hidden" id="QNA_ID" name="QNA_ID" value="${qna.QNA_ID }"/>
    		<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${qna.QNA_NUM }"/></td>
    	</tr>
    	<tr>
    		<th align="left">내용</th>
    	</tr>
    	<tr>
    		<td><textarea id="QNA_CONTENTS" name="QNA_CONTENTS" cols="40" rows="8"></textarea></td>
    	</tr>
    </table>
    </form>
    <br/>
    <div align="center">
    <a href="#this" class="btn" id="answer">답변</a>
    <a href="#this" class="btn" id="cancel">취소</a>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){   
    	$("#answer").on("click", function(e){ //수정 버튼
    		if($("#QNA_TITLE").val()==""){
				alert("제목을 입력해주세요.");
				$("#QNA_TITLE").focus();
				return false;
			}
    		if($("#QNA_CONTENTS").val()==""){
				alert("내용을 입력해주세요.");
				$("#QNA_CONTENTS").focus();
				return false;
			}
            e.preventDefault();
            fn_QnaRe();
        }); 
               
            $("#cancel").on("click", function(e){ //취소 버튼
                e.preventDefault();
                fn_updateQnaForm();
            }); 
        });

        function fn_QnaRe(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/adminMem/qnaRe' />");
            comSubmit.submit();
        }
         
        function fn_updateQnaForm(){
            history.go(-1);
        }
    </script> 
</body>
</html>