<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<body>

<form action="BoardUpdateProcCon.do" method="post">
<center>
<h2> �Խñ� ���� </h2>
<table width="600" border="1" >
	<tr height="40">
		<td width="120" align="center"> �ۼ��� </td>
		<td width="180" align="center"> ${bean.writer } </td>
		<td width="120" align="center"> �ۼ��� </td>
		<td width="180" align="center"> ${bean.reg_date } </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> ���� </td>
		<td width="480" colspan="3"> &nbsp; <input type="text" name="subject" size="60" value="${bean.subject }"> </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> �н����� </td>
		<td width="480" colspan="3"> &nbsp; <input type="password" name="password" size="60"> </td>
	</tr>
	<tr height="40">
		<td width="120" align="center"> �� ���� </td>
		<td width="480" colspan="3"> &nbsp; <textarea rows="10" cols="60" name="content" align="center">${bean.content }</textarea></td>
	</tr>
	<tr height="40">
		<td colspan="4" align="center">
		<input type="hidden" name="num" value="${bean.num }">
		<input type="hidden" name="pass" value="${bean.password }">
		<input type="submit" value="�ۼ���"> &nbsp;&nbsp;
		<input type="button" onclick="location.href='BoardListCon.do'" value="��ü�ۺ���"> </td>
	</tr>		
</table>
</center>
</form>

</body>
</html>