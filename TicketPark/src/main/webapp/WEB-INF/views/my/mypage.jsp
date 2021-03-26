<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   table{text-align:center; font-size:15px}
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
<h2 style="text-decoration: underline; margin-top : 50px">MY PAGE</h2>
<div class="card align-middle" style="width:100%; border-radius:20px;" >
		<div>
		<div class="card-title" style="margin-top:30px;">
               <h4 style="font-size:18px; color:#113366; margin-left:30px">최근예매내역</h4>
        </div>
		<table align="center" width="100%" style="font-align:center">
			<tr>
				<th scope="row">예매일자</th>
				<th scope="row">공연이름</th>
				<th scope="row">결제금액</th>
				<th scope="row">예매상태</th>
			</tr>
			<tr>
				<td>${map.RES_DATE }</td>
				<td>${map.SHOW_NAME }</td>
				<td>${map.RES_PRICE }</td>
				<td>${map.RES_DEL}</td>
		</table>
		</div>
		</div>

</body>
</html>