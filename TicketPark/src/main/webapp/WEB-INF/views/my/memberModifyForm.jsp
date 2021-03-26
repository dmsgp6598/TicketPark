<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<form id="frm333" class="form-signin" style="margin-top:50px">
	<div class="card align-middle" style="width:250px; border-radius:20px; font-size:20px;" align="center">
		<table style="text-align:center; margin-left: 20px;" >
			<tr align="center">
				<th scope="row">아이디</th>
				<td class="card-body"><input type="text" id="MEM_ID" name="MEM_ID" value="${map.MEM_ID }" readonly="readonly"/></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td class="card-body"><input type="password" id="MEM_PWD" name="MEM_PWD" value="${map.MEM_PWD }"/></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td class="card-body"><input type="text" id="MEM_NAME" name="MEM_NAME" value="${map.MEM_NAME }"/></td>
			</tr>
			<tr>
				<th scope="row">EMAIL</th>
				<td class="card-body"><input type="text" id="MEM_EMAIL" name="MEM_EMAIL" value="${map.MEM_EMAIL }"/></td>
			</tr>
			<tr>
				<th scope="row">PHONE</th>
				<td class="card-body"><input type="text" id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE }"/></td>
			</tr>
		</table>
		<a href="#this" class="btn btn-lg btn-primary btn-block" id="memupdate" style="background-color:#ffd34a; color:black; border:0; outline:0;">수정하기</a>
		</div>
		
		<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEM_INFO.MEM_NUM }">
	</form>

	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
        $("#memupdate").on("click", function(e){ 
        	if($("#MEM_PWD").val()==""){
    			alert("비밀번호를 입력해주세요.");
    			$("#MEM_PWD").focus();
    			return false;
    		}
    		if($("#MEM_NAME").val()==""){
    			alert("이름을 입력해주세요.");
    			$("#MEM_NAME").focus();
    			return false;
    		}
    		if($("#MEM_EMAIL").val()==""){
    			alert("이메일을 입력해주세요.");
    			$("#MEM_EMAIL").focus();
    			return false;
    		}
    		if($("#MEM_PHONE").val()==""){
    			alert("번호를 입력해주세요.");
    			$("#MEM_PHONE").focus();
    			return false;
    		}
            e.preventDefault();
            fn_updatemember();
        }); 

	});

	function fn_updatemember(){
			var comSubmit = new ComSubmit("frm333");
			comSubmit.setUrl("<c:url value='/mypage/memberModify'/>");
			comSubmit.submit();
	}


	</script>
</body>
</html>