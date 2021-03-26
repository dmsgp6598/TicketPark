<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<div id="wrapper">
		<tiles:insertAttribute name="header"/><!-- // header -->
	 	
	<!-- container --> 
	<div id="container">
		<tiles:insertAttribute name="body"/><!-- // container -->
	</div>
	<!-- footer --> 
		<tiles:insertAttribute name="footer"/><!-- // footer -->
</div>
</body>
</html>
