<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneUpdateBoard(num);
	
%>
<form action="BoardUpdateProc.jsp" method="post">
<center>
<h2> �Խñ� ���� </h2>
<table width="600" border="1" bgcolor="#F3E2A9">
	<tr height="40">
		<td width="120" align="center"> �ۼ��� </td>
		<td width="180" align="center"> <%=bean.getWriter() %> </td>
		<td width="120" align="center"> �ۼ��� </td>
		<td width="180" align="center"> <%=bean.getReg_date() %> </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> ���� </td>
		<td width="480" colspan="3"> &nbsp; <input type="text" name="subject" size="60" value="<%=bean.getSubject() %>"> </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> �н����� </td>
		<td width="480" colspan="3"> &nbsp; <input type="password" name="password" size="60"> </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> �� ���� </td>
		<td width="480" colspan="3"> &nbsp; <textarea rows="10" cols="60" name="content" align="center" value="<%=bean.getContent() %>"></textarea></td>
	</tr>
	<tr height="40">
		<td colspan="4" align="center">
		<input type="hidden" name="num" value="<%=bean.getNum() %>">
		<input type="submit" value="�ۼ���"> &nbsp;&nbsp;
		<input type="button" onclick="location.href='BoardList.jsp'" value="��ü�ۺ���"> </td>
	</tr>		
</table>
</center>
</form>
</body>
</html>