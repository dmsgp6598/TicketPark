<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>
<%
	BoardDAO bdao = new BoardDAO();

	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean bean = bdao.getOneUpdateBoard(num);

%>
<form action="BoardDeleteProc.jsp" method="post">
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
		<td align="left" colspan="3"> <%=bean.getSubject() %></td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> �н����� </td>
		<td align="left" colspan="3"> <input type="password" name="password" size="60"> </td>
	</tr>
	<tr height="40">
		<td colspan="4" align="center">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="submit" value="�ۻ���"> &nbsp;&nbsp;
		<input type="button" onclick="location.href='BoardList.jsp'" value="��ü�ۺ���"> </td>
	</tr>		
</table>
</center>
</form>

</body>
</html>