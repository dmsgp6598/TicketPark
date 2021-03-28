<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO bdao = new BoardDAO();
	String password = bdao.getPass(num);
	
	if(pass.equals(password)) {
		
		bdao.deleteBoard(num);
		
		response.sendRedirect("BoardList.jsp");
	} else {

%>

	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다.")
		history.go(-1);
	</script>

<%

}
%>

</body>
</html>