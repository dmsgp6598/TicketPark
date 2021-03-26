<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<style>
button{
	position: relative;
	border: 0px; 
	background-color: rgba(0,0,0,0); 
	color: black; 
	padding: 5px; 
	width: 100%;
	font-size : 1000px;
}
button:hover{ 
	color:#666;
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div style="width:70%; height:350px; border-radius:20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); padding-top: 40px; padding-bottom:40px; margin:auto;" align="center">
		<div style="width:50%; height:100%; float:left" >
			<img src="<c:url value='/poster/${showList[0].SHOW_IMAGE }'/>" width="60%" height="100%">
		</div>
		<div style="width:50%; height:100%; float:left" align="left">
		<table>
		<thead>
		<tr>
			<td>
				<h3>${showList[0].SHOW_NAME }</h3>
			</td>
		</tr>
		<tr>
		<td>
			<select id="date" name="date">
				<option value="">회차를 선택하세요.</option>
			<c:forEach var="item" items="${showList }">
			<c:if test="${item.SHOW_SEAT != '0' && item.confirm != '-1'}">
				<option value="${item.SHOWDATE_NUM},${item.SHOW_DATE } ${item.SHOW_TIME},${item.SHOW_SEAT}">${item.SHOW_DATE }&nbsp;${item.SHOW_TIME }&nbsp;잔여좌석(${item.SHOW_SEAT })</option>
			</c:if>
			<c:if test="${item.SHOW_SEAT == '0'}">
				<option value="" disabled>${item.SHOW_DATE }&nbsp;${item.SHOW_TIME }&nbsp;잔여좌석(매진)</option>
			</c:if>
			<c:if test="${item.confirm == '-1'}">
				<option value="" disabled>${item.SHOW_DATE }&nbsp;${item.SHOW_TIME }&nbsp;잔여좌석(${item.SHOW_SEAT })</option>
			</c:if>
			</c:forEach>
			</select>
		</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
			<SELECT id="extraPrice" name="extraPrice">
				<option value="">좌석 등급을 선택하세요.(미선택시 기본좌석)</option>
			<c:forEach var="item" items="${splitList }">
				<option value="${item.SHOW_OPTION1 },${item.SHOW_OPTION2 }">${item.SHOW_OPTION1 }석&nbsp;&nbsp;&nbsp;추가 금액 : ${item.SHOW_OPTION2 }</option>
			</c:forEach>
			</SELECT>
		</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
      <tr>
      <td>
         <SELECT id="amount" name="amount">
            <option value="">수량을 선택하세요.</option>
            <c:forEach var="i" begin="1" end="10">
               <option value="${i }">${i }</option>
            </c:forEach>
         </SELECT>
      </td>
      </tr>
		<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
		<tr>
		<c:if test="${session_MEM_INFO != null }">
			<td align="left"><a href="#this" id="res">예매하기</a></td>
			<td align="right"><a href="#this" id="like">좋아요</a></td>
		</c:if>
		</tr>
		</thead>
		</table>
		</div>
	</div>
	<div style="width:100%; position: relative; top: 30px;width:100%;height:80px; repeat-x; margin-bottom: 20px;" id="Tab" align="center" >
		<table align="center">
		<thead>
			<tr align="center" style="background-color:#ffd34a;">
				<td width="200"><button id="detail" onclick="#this" style="font-size:20px">상세보기</button></td>
				<td width="200"><button id="review" onclick="#this" style="font-size:20px">리뷰</button></td>
				<td width="200"><button id="qna" onclick="#this" style="font-size:20px">QnA</button></td>
			</tr>
		</thead>
		</table>
	</div>
	<div style="width:100%" id="Contents" align="center" >aaa</div>
    <br/>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript" charset="UTF-8">
    $(document).ready(function(){     
    	if("${mode}" == "1"){
            fn_openDetail();
         }else if("${mode}" == "2"){
             fn_openReview();
         }else if("${mode}" == "3"){
             fn_qna();
         }
        if("${msg}" != ""){
           var msg = "${msg}";
           alert(msg);
        }
        
            
           $("#detail").on("click", function(e){ //글쓰기 버튼
               e.preventDefault();
               fn_openDetail();
           }); 
            
           $("#review").on("click", function(e){ //제목 
               e.preventDefault();
               fn_openReview();
           });

           $("#res").on("click", function(e){ //제목 
           	if($("#date").val()==""){
   				alert("회차를 선택해주세요.");
   				$("#date").focus();
   				return false;
   			}
   			if($("#amount").val()==""){
   				alert("수량을 선택해주세요.");
   				$("#amount").focus();
   				return false;
   			} 
               e.preventDefault();
               fn_openReservation();
           });

           $("#like").on("click", function(e){ //제목 
               e.preventDefault();
               fn_like();
           });

           $("#qna").on("click", function(e){ //제목 
              e.preventDefault();
              fn_qna();
           });
       });
         
         
        function fn_openDetail(){
            var SHOW_DETAIL = "${showList[0].SHOW_DETAIL}";
            var pageAjax = new PageAjax();
            pageAjax.setUrl("<c:url value='/showDetail/showDetail'/>");
            pageAjax.addParam("SHOW_DETAIL", SHOW_DETAIL);
            pageAjax.ajax();
        }

        function fn_openReview(){
            var SHOW_NUM = "${showList[0].SHOW_NUM}";
            var pageAjax = new PageAjax();
            pageAjax.setUrl("<c:url value='/showDetail/review'/>");
            pageAjax.addParam("SHOW_NUM", SHOW_NUM);
            pageAjax.addParam("REVIEW_SHOWNAME", "${showList[0].SHOW_NAME}")
            pageAjax.ajax();
        }

        function fn_like(){
        	var SHOW_NUM = "${showList[0].SHOW_NUM}";
        	var MEM_NUM = "${session_MEM_INFO.MEM_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/showDetail/like'/>");
			comSubmit.addParam("SHOW_IMAGE", "${showList[0].SHOW_IMAGE}");
			comSubmit.addParam("SHOW_NAME", "${showList[0].SHOW_NAME}");
			comSubmit.addParam("SHOW_NUM", SHOW_NUM);
			comSubmit.addParam("MEM_NUM", MEM_NUM);
			comSubmit.submit();
        }
        function fn_qna(){
        	var SHOW_NUM = "${showList[0].SHOW_NUM}";
			var pageAjax = new PageAjax();
			pageAjax.setUrl("<c:url value='/showDetail/qnaList'/>");
			pageAjax.addParam("SHOWQNA_SHOWNUM", SHOW_NUM);
			pageAjax.ajax();
        }

        function fn_openReservation(){
            var SHOW_NUM = "${showList[0].SHOW_NUM}";
            var date = $('#date option:selected').val();
        	var extraPrice =$('#extraPrice option:selected').val();
        	var amount = $('#amount option:selected').val();
        	var rank = "${showList[0].SHOW_RANK}";
        	var SHOW_NAME = "${showList[0].SHOW_NAME}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/pay/resForm'/>");
			comSubmit.addParam("extraPrice", extraPrice);
			comSubmit.addParam("date", date);
			comSubmit.addParam("price", "${showList[0].SHOW_PRICE}");
			comSubmit.addParam("amount", amount);
			comSubmit.addParam("SHOW_NUM", SHOW_NUM);
			comSubmit.addParam("rank", rank);
			comSubmit.addParam("SHOW_NAME", SHOW_NAME);
			comSubmit.submit();
        }
    </script> 
</body>
</html>