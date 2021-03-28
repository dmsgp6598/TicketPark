<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>

<form action="BoardDeleteProcCon.do" method="post">
<center>
<h2> 게시글 삭제 </h2>
<table width="600" border="1" >
	<tr height="40">
		<td width="120" align="center"> 패스워드 </td>
		<td width="480" colspan="3"> &nbsp; <input type="password" name="password" size="60"> </td>
	</tr>
	<tr height="40">
		<td colspan="4" align="center">
		<input type="hidden" name="num" value="${bean.num }">
		<input type="hidden" name="pass" value="${bean.password }">
		<input type="submit" value="글삭제"> &nbsp;&nbsp;
		<input type="button" onclick="location.href='BoardListCon.do'" value="전체글보기"> </td>
	</tr>		
</table>
</center>
</form>

</body>
</html>