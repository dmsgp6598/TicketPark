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
<h2> 게시글 수정 </h2>
<table width="600" border="1" bgcolor="#F3E2A9">
	<tr height="40">
		<td width="120" align="center"> 작성자 </td>
		<td width="180" align="center"> <%=bean.getWriter() %> </td>
		<td width="120" align="center"> 작성일 </td>
		<td width="180" align="center"> <%=bean.getReg_date() %> </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> 제목 </td>
		<td align="left" colspan="3"> <%=bean.getSubject() %></td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> 패스워드 </td>
		<td align="left" colspan="3"> <input type="password" name="password" size="60"> </td>
	</tr>
	<tr height="40">
		<td colspan="4" align="center">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="submit" value="글삭제"> &nbsp;&nbsp;
		<input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기"> </td>
	</tr>		
</table>
</center>
</form>

</body>
</html>