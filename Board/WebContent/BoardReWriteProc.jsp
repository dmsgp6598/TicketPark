<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

%>
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	BoardDAO bdao = new BoardDAO();
	bdao.reWriteBoard(boardbean);
	
	response.sendRedirect("BoardList.jsp");

%>

</body>
</html>