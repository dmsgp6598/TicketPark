<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div align="center">
	로그아웃 되었습니다.
	<br><br><br>

	<a href="#this" class="btn" id="main">메인페이지로 이동</a>
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
        $("#main").on("click", function(e){
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