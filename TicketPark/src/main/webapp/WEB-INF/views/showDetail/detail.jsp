<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body align="center">
	<img src="<c:url value='/poster/${SHOW_DETAIL }'/>" width="40%" height="100%"/>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>