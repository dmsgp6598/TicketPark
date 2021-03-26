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
		<div class="card align-middle" style="width:20rem; border-radius:20px;" >
		<div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">회원가입</h2>
            </div>
		<table align="center">
			<tr>
				<th scope="row">아이디</th>
				<td class="card-body"><input type="text" id="MEM_ID" name="MEM_ID"/></td>
				<td> <button onclick="fn_idCheck();" id="idChk" type="button" value="N">중복 확인</td>
			</tr>
			<tr>
				<td colspan=3 id = "chkMsg"></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td class="card-body"><input type="text" id="MEM_PWD" name="MEM_PWD"/></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td class="card-body"><input type="text" id="MEM_NAME" name="MEM_NAME"/></td>
			</tr>
			<tr>
				<th scope="row">EMAIL</th>
				<td class="card-body"><input type="text" id="MEM_EMAIL" name="MEM_EMAIL"/></td>
			</tr>
			<tr>
				<th scope="row">PHONE</th>
				<td class="card-body"><input type="text" id="MEM_PHONE" name="MEM_PHONE"/></td>
			</tr>
		</table>
			
		<a href="#this" class="btn btn-lg btn-primary btn-block" id="join" style="background-color:#ffd34a; color:black; border:0; outline:0;">회원가입</a>
		</div>
		</div>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
		var email = $("#MEM_EMAIL");
		var phone = $("#MEM_PHONE");
        $("#join").on("click", function(e){
        	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        	var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
        	
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
			if($("#MEM_NAME").val()==""){
				alert("이름을 입력해주세요.");
				$("#MEM_NAME").focus();
				return false;
			}
			if($("#MEM_EMAIL").val()==""){
				alert("이메일을 입력해주세요.");
				$("#MEM_EMAIL").focus();
				return false; 
			} else {
		            if(!regExp.test(email.val())) {
		                alert("이메일 주소가 유효하지 않습니다");
		                $("#MEM_EMAIL").focus();
		                return false;
		            }
			} 
			if($("#MEM_PHONE").val()==""){
				alert("번호를 입력해주세요.");
				$("#MEM_PHONE").focus();
				return false;
			} else {
	            if(!regPhone.test(phone.val())) {
	                alert("번호가 유효하지 않습니다");
	                $("#MEM_PHONE").focus();
	                return false;
	            }
			}
			var idChkVal = $("#idChk").val();
			if(idChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.");
			}else if(idChkVal == "Y"){
				e.preventDefault();
	            fn_insertMember();
			}
        });
	});
	
	
	$(document).ready(function() { //id check
	      $("#idCheck").on("click", function(e) {
	         e.preventDefault();
	         fn_idCheck();
	      });
	   });

	$(document).ready(function() { //id check
	      $("#emailChk").on("click", function(e) {
	         e.preventDefault();
	         fn_emailch();
	      });
	   });
	   
	function fn_insertMember(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/join/emailAuth'/>")
		comSubmit.submit();
	}

	function fn_idCheck(){ //id check
		 var MEM_ID = {MEM_ID : $('#MEM_ID').val()};
	       if($("#MEM_ID").val()==""){
				alert("아이디를 입력해주세요.");
				$("#MEM_ID").focus();
				return false;
			}
	       $.ajax({
	           url:"<c:url value='/join/idCheck'/>",
	           type:'get',
	           data: MEM_ID,
	           success:function(data){              
	               if($.trim(data)=="0"){
	                  $('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");
	                  $('#idChk').attr("value", "Y");      
	               }else{
	                  $('#chkMsg').html("사용불가능한 아이디 입니다.").css("color", "red");
	               }
	           },
	           error:function(){
	                   alert("에러입니다");
	           }
	       });
	}


	
	</script>
</body>
</html>