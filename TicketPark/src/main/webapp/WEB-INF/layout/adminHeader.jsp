<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
button{
	position: relative;
	border: 0px; 
	background-color: rgba(0,0,0,0); 
	color: black; 
	padding: 5px; 
	width: 100%;
	font-size : 1000px;
}
button:hover{ 
	color:#666;
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div style="width:100%;" id="Tab" align="center" >
		<table align="center">
		<thead>
			<tr align="center" style="background-color:#ffd34a;">
				<td width="300"><button id="member" onclick="#this" style="font-size:16px">회원관리</button></td>
				<td width="300"><button id="show" onclick="#this" style="font-size:16px">상품관리</button></td>
			</tr>
		</thead>
		</table>

	</div>

     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript" charset="UTF-8">
    $(document).ready(function(){     
            
           $("#member").on("click", function(e){ //글쓰기 버튼
               e.preventDefault();
               fn_openMember();
           }); 
            
           $("#show").on("click", function(e){ //제목 
               e.preventDefault();
               fn_openShow();
           });
       });

        function fn_openMember(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminMem/memberList?keyword='/>");
			comSubmit.submit();
        }

        function fn_openShow(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminShow/showList'/>");
			comSubmit.submit();
        }
        
    </script> 
</body>
</html>