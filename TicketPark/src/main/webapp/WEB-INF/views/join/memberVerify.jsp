<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="join fmOFyn" style="
    width: 50%;
    margin: 100px auto;
">
<h1 style="
    text-align: center;
    top: 0px;
    padding: 50px;
">�̸��� ������ �Ϸ�Ǿ����ϴ�!</h1>
<h1 style="
    text-align: center;
    margin-top: 20px;
">�α����� ���ּ���!!</h1>

	<a href="#this" class="btn" id="main4">�α����Ϸ� ����</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
        $("#main4").on("click", function(e){
            e.preventDefault();
            fn_main();
        }); 
		
		function fn_main(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main'/>")
			comSubmit.submit();
		}
	});
	</script>
</body>
</html>