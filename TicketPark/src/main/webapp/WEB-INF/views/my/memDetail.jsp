<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<form id="frm" name="frm" style="margin-top:50px">
	<div class="card align-middle" style="width:250px; border-radius:20px;" align="center">
		<table style="text-align:center; margin-left: 10px">
			<tr>
				<th scope="row" style="font-size:15px">아이디</th>
				<td style="font-size:15px; padding:10px">${map.MEM_ID }</td>
			</tr>
			<tr>
				<th scope="row" style="font-size:15px">비밀번호</th>
				<td style="font-size:15px; padding:10px">${map.MEM_PWD }</td>
			</tr>
			<tr>
				<th scope="row" style="font-size:15px">이름</th>
				<td style="font-size:15px; padding:10px">${map.MEM_NAME }</td>
			</tr>
			<tr>
				<th scope="row" style="font-size:15px">EMAIL</th>
				<td style="font-size:15px; padding:10px">${map.MEM_EMAIL }</td>
			</tr>
			<tr>
				<th scope="row" style="font-size:15px">PHONE</th>
				<td style="font-size:15px; padding:10px">${map.MEM_PHONE }</td>
			</tr>
		</table>
		<a href="#this" class="btn btn-lg btn-primary btn-block" id="memmodify" style="background-color:#ffd34a; color:black; border:0; outline:0;">수정하기</a>
		<input type="hidden" id="memnum" value="${MEM_NUM }">
		</div>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
        $("#memmodify").on("click", function(e){
            e.preventDefault();
            fn_modifymember(${session_MEM_INFO.MEM_NUM});
        }); 
	});
		function fn_modifymember(memnum){ 
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/mypage/memberModifyForm'/>")
			comSubmit.addParam("MEM_NUM", memnum);
			comSubmit.submit();
		}

	</script>
	
</body>
</html>