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
<h2 style="text-decoration: underline; margin-top : 50px">과거 예매내역</h2>
<div class="card align-middle" style="width:100%; border-radius:20px;" >
		<div>
		<div class="card-title" style="margin-top:30px;">
        </div>
        
		<table align="center" width="100%" style="font-align:center">
					<thead>
						<th scope="row">예매일자</th>
						<th scope="row">공연이름</th>
						<th scope="row">결제금액</th>
						<th scope="row">예매수량</th>
						<th scope="row">리뷰작성</th>
					</thead>
					<br>
			<tfoot></tfoot>
		</table>
		<div id="PAGE_NAVI2" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
		</div>
		</div>
		
		<script type="text/javascript">
        $(document).ready(function(){
            fn_showPastList(1,${session_MEM_INFO.MEM_NUM });  
        });
         
         function fn_showPastList(pageNo,memnum){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/mypage/selectPastResList'/>");
			comAjax.setCallback("fn_showPastListCallback");
			comAjax.addParam("MEM_NUM", memnum);
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 3);
			comAjax.ajax();
        }

         function fn_openReview(obj){
            var comSubmit = new ComSubmit();
 			comSubmit.setUrl("<c:url value='/showDetail'/>");
 			comSubmit.addParam("SHOW_NUM", obj.parent().find("#SHOW_NUM").val());
 			comSubmit.addParam("mode", "2");
 			comSubmit.submit();
         }

         function fn_showPastListCallback(data) {
 			var total = data.TOTAL;
 			var body = $("tfoot");
 			body.empty();
 			if (total == 0) {
 				var str = "<tr>" + "<td colspan='5'><br>과거 예매내역이 없습니다.</td>"
 						+ "</tr>";
 				body.append(str);
 			} else {
 				var params = {
 					divId : "PAGE_NAVI2",
 					pageIndex : "PAGE_INDEX",
 					totalCount : total,
 					eventName : "fn_showPastList",
 					recordCount : 3
 					
 				};
 				gfn_renderPaging(params);

 				var str = "";
 				$.each(data.pastRes, function(key, value) {
 									str += "<tr>"
 											+ "<td>" + value.RES_DATE  + "</td>"
 											+ "<td>" + value.SHOW_NAME  + "</td>"
 											+ "<td>" + value.RES_PRICE  + "</td>"
 											+ "<td>" + value.RES_AMOUNT + "</td>"
 											+ "<td><a href='#this' name='review'>리뷰작성</a>"
 											+ "<input type='hidden' id='SHOW_NUM' value=" + value.SHOW_NUM + ">"
 											+ "</td></tr>"
 								});
 				body.append(str);

 				$("a[name='review']").on("click", function(e) { //제목
 					e.preventDefault();
 					fn_openReview($(this));
 				});
 			}
 		}
    </script> 
</body>
</html>