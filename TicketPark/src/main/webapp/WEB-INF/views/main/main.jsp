<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
td{
	margin:50px;
	padding-left:15px;
	padding-right:15px;
}
</style>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
		<table align="center" style="text-align:center">
		<c:choose>
			<c:when test="${fn:length(best) > 0 }">
				<tr>
				<td><h4>인기 순위</h4></td>
				</tr>
				<tr>
					<c:forEach items="${best }" var="row">
						<td ><a href="#this" name="title"><img src="<c:url value='/poster/${row.SHOW_IMAGE }'/>" width='100' height='100'>
							<input type="hidden" id="SHOW_NUM" value="${row.SHOW_NUM }"></a></td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${best }" var="row">
						<c:choose>
							<c:when test="${row.SHOW_CAT == 0 }">
								<td>뮤지컬</td>
							</c:when>
							<c:when test="${row.SHOW_CAT == 1 }">
								<td>콘서트</td>
							</c:when>
							<c:when test="${row.SHOW_CAT == 2 }">
								<td>전시회</td>
							</c:when>
							<c:otherwise>
								<td>축제</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${best }" var="row">
						<td>${row.SHOW_NAME }</td>
					</c:forEach>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<table align="center"style="text-align:center">
		<c:choose>
			<c:when test="${fn:length(musical) > 0 }">
				<tr>
					<td><h4>musical</h4></td>
				</tr>
				<tr>
					<c:forEach items="${musical }" var="row">
						<td><a href="#this" name='title'><img src="<c:url value='/poster/${row.SHOW_IMAGE }'/>" width='100' height='100'>
							<input type="hidden" id="SHOW_NUM" value="${row.SHOW_NUM }"></a></td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${musical }" var="row">
						<td>${row.SHOW_NAME }</td>
					</c:forEach>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<table align="center"style="text-align:center">
		<c:choose>
			<c:when test="${fn:length(concert) > 0 }">
				<tr>
					<td><h4>concert</h4></td>
				</tr>
				<tr>
					<c:forEach items="${concert }" var="row">
						<td><a href="#this" name="title"><img src="<c:url value='/poster/${row.SHOW_IMAGE }'/>" width='100' height='100'>
							<input type="hidden" id="SHOW_NUM" value="${row.SHOW_NUM }"></a></td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${concert }" var="row">
						<td>${row.SHOW_NAME }</td>
					</c:forEach>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<table align="center"style="text-align:center">
		<c:choose>
			<c:when test="${fn:length(exhibition) > 0 }">
				<tr>
					<td><h4>exhibition</h4></td>
				</tr>
				<tr>
					<c:forEach items="${exhibition }" var="row">
						<td><a href="#this" name='title'><img src="<c:url value='/poster/${row.SHOW_IMAGE }'/>" width='100' height='100'>
							<input type="hidden" id="SHOW_NUM" value="${row.SHOW_NUM }"></a></td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${exhibition }" var="row">
						<td>${row.SHOW_NAME }</td>
					</c:forEach>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<table align="center"style="text-align:center">
		<c:choose>
			<c:when test="${fn:length(festival) > 0 }">
				<tr>
					<td><h4>festival</h4></td>
				</tr>
				<tr>
					<c:forEach items="${festival }" var="row">
						<td><a href="#this" name="title"><img src="<c:url value='/poster/${row.SHOW_IMAGE }'/>" width='100' height='100'>
							<input type="hidden" id="SHOW_NUM" value="${row.SHOW_NUM }"></a></td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach items="${festival }" var="row">
						<td>${row.SHOW_NAME }</td>
					</c:forEach>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
        $(document).ready(function(){
            $("a[name='title']").on("click", function(e){
                e.preventDefault();
                fn_openShowDetail($(this));
            });
        });
        
         function fn_openShowDetail(obj){
             var comSubmit = new ComSubmit();
             comSubmit.setUrl("<c:url value='/showDetail' />");
             comSubmit.addParam("SHOW_NUM", obj.parent().find("#SHOW_NUM").val());
             comSubmit.submit();
         }

    </script> 
</body>
</html>