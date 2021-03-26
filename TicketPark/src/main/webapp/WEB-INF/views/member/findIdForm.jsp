<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/animate.css">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<script>
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

var idV = "";
var idSearch_click = function(){
	var email = $("#MEM_EMAIL");
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
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
	var name = $('#MEM_NAME').val();
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/logon/findId?MEM_NAME="
				+name+"&MEM_EMAIL="+$('#MEM_EMAIL').val(),
		success:function(data){
			if(data == "0"){
				alert("회원 정보가 틀렸습니다!")			
			} else{
				$('#MEMID').text(data); 
				idV = data;
				alert("회원님의 아이디는 " + data + " 입니다!!");
			}
		}
	});
}

var pwSearch_click = function(){
	var email = $("#MEM_EMAIL2");
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if($("#MEM_ID").val()==""){
		alert("아이디를 입력해주세요.");
		$("#MEM_ID").focus();
		return false;
	}
	if($("#MEM_EMAIL2").val()==""){
		alert("이메일을 입력해주세요.");
		$("#MEM_EMAIL2").focus();
		return false;
	} else {
        if(!regExp.test(email.val())) {
            alert("이메일 주소가 유효하지 않습니다");
            $("#MEM_EMAIL2").focus();
            return false;
        }
} 
	var id = $('#MEM_ID').val();
	$.ajax({
		type:"get",
		url : "<c:url value='/logon/findPw'/>",
		data : "MEM_ID="+ $("#MEM_ID").val() +  "&MEM_EMAIL=" + $("#MEM_EMAIL2").val() + "&random=" + $("#random").val(),
		success : function(data){
			if(data == true){
			alert("임시비밀번호를 발송하였습니다.");
			}else{
				alert("회원정보가 없습니다.");
			}
		},
		error: function(data){
			alert("에러가 발생했습니다.");
			return false;
		}
	});
	
}

</script>
<body>
	<div class="full">
		<div class="container card" style="width:500px; padding:30px; border-radius: 20px; background-color:#fff;">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black">
					<h3>아이디/비밀번호 찾기</h3>
					<br/>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
				</div>
				
				<!-- 아이디 찾기 -->
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" placeholder="ex) 홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_1">이메일</label>
						<div>
							<input type="email" class="form-control" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="ex) E-mail@gmail.com"">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block" style="background-color:#26a69a; border-color:#26a69a;">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}" style="background-color:#26a69a; border-color:#26a69a;">취소</a>
					</div>
				</div>
				
				<!-- 비밀번호 찾기 -->
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="MEM_ID" name="MEM_ID" placeholder="ex) space">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="MEM_EMAIL2" name="MEM_EMAIL2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwSearch_click()" class="btn btn-primary btn-block">확인</button>
						<input type="hidden" path="random" id="random" value="${random}"/>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>