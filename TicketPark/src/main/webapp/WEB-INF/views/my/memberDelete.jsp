<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<form id="frm4">
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
		var message = "${message}";

		if(message!=null && message!=''){
			alert(message);
			history.go(-1);
		}else{
			alert("Å»ÅðµÇ¾ú½À´Ï´Ù.");
			location.href = "<c:url value='/main'/>";
		}
	});



	</script>
</body>
</html>