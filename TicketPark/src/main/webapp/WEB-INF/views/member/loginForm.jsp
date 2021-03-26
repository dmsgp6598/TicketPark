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
	<form id="frm" name="frm" class="form-signin">
		<div class="card align-middle" style="width:20rem; border-radius:20px;">
         <div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">로그인</h2>
            </div>
            
            <div class="card-body">   
               <INPUT type="text" name="MEM_ID" id="MEM_ID" size="15" maxlength="12" class="form-control" placeholder="Your ID"><br>  
            </div>
   
            <div class="card-body">
               <INPUT type=password name="MEM_PWD" id="MEM_PWD" size="15" maxlength="12" class="form-control" placeholder="Password"> <br>
            </div>
		<div class="card-body">
		<a href="#this" class="btn btn-lg btn-primary btn-block" id="login" style="background-color:#ffd34a; color:black; border:0; outline:0;" >로그인</a>  
		</div>
		<div class="card-body">
			<a href="#this" id="find" >아이디/비밀번호 찾기</a>
		</div>
		</div>
      </div>
</form> 
<%@ include file="/WEB-INF/include/include-body.jspf" %> 

<script type="text/javascript"> 
$(document).ready(
		function(){ 
			$("#login").on("click", function(e){ 
				if($("#MEM_ID").val()==""){
					alert("아이디를 입력해주세요.");
					$("#MEM_ID").focus();
					return false;
				}
				if($("#MEM_PWD").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#MEM_PWD").focus();
					return false;
				}
					e.preventDefault(); 
					fn_login(); 
				}); 
			
			$("#find").on("click", function(e){ //취소 버튼
	                e.preventDefault();
	                fn_findIdPw();
	            }); 
	        });

	
	function fn_login(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/logon/login' />"); 
		comSubmit.submit(); 
	}

	function fn_findIdPw(){ 
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/logon/findIdForm' />"); 
		comSubmit.submit();
	}
</script> 
</body>
</html>