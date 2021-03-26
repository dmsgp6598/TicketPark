<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm2" style="margin-top:50px">
	<div align="center">
		<table>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" id="MEM_PWD" name="MEM_PWD"/></td>
			</tr>
			
		</table>
		
		<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEM_INFO.MEM_NUM }">
	</form>
	
	<a href="#this" class="btn" id="memdelete">탈퇴하기</a>
	</div>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
        $("#memdelete").on("click", function(e){     
        	if($("#MEM_PWD").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#MEM_PWD").focus();
				return false;
			} 
				e.preventDefault();
    			fn_deletemem();   
        }); 
	});
		function fn_deletemem(mempwd){
			var comSubmit = new ComSubmit("frm2");
			comSubmit.setUrl("<c:url value='/mypage/memberDelete'/>");
			
			comSubmit.submit();
		}
	
	
</script>
</body>
</html>