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
<form id="likeForm">
<h2 style="text-decoration: underline; margin-top : 50px">즐겨찾기</h2>
<div class="card align-middle" style="width:100%; border-radius:20px;" >
		<div>
		<div class="card-title" style="margin-top:30px;">
        </div>
        
		<table align="center" width="100%" style="font-align:center">
			<tbody></tbody>
		</table>
		</form>
		<div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
		</div>
		</div>
		
		<script type="text/javascript">
        $(document).ready(function(){
            fn_showList(1);  
        });

        function fn_QnaDetail(obj){
			var comSubmit = new ComSubmit("likeForm"); 
			comSubmit.setUrl("<c:url value='/showDetail' />"); 
			comSubmit.addParam("SHOW_NUM", obj.parent().find("#SHOW_NUM").val());
			comSubmit.submit(); 
		}
         
         function fn_showList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/mypage/selectLikeList'/>");
			comAjax.setCallback("fn_showListCallback");
			comAjax.addParam("MEM_NUM", "${session_MEM_INFO.MEM_NUM}");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 3);
			comAjax.ajax();
        }

        function fn_showListCallback(data) {
 			var total = data.TOTAL;
 			var body = $("table>tbody");
 			body.empty();
 			if (total == 0) {
 				var str = "<tr>"
 	 					+ "<td colspan='3'>즐겨찾기 내역이 없습니다.</td>"
 	 					+ "</tr>";
 				body.append(str);
 			} else {
 				var params = {
 					divId : "PAGE_NAVI",
 					pageIndex : "PAGE_INDEX",
 					totalCount : total,
 					eventName : "fn_showList",
 					recordCount : 3
 				};
 				gfn_renderPaging(params);

 				var str = "";
 				var like_count = 0;
				str += "<tr>"
				$.each(data.like, function(key, value){
					str += "<td>"+"<a href='#this' name='title'>"+"<img src='<c:url value='/poster/"+value.SHOW_IMAGE+"'/>' width='100' heigh='100'><br>"+
						"<input type='hidden' id='SHOW_NUM' value='"+value.SHOW_NUM+"'>"+value.SHOW_NAME+"</a>"+"</td>";
					if(like_count == 3){
						str += "</tr>";
						like_count = 0;
					}
					like_count += 1;

				});

				body.append(str);

 				$("a[name='title']").on("click", function(e) { //제목
 					e.preventDefault();
 					fn_QnaDetail($(this));
 				});
 			}
 		}
    </script> 
</body>
</html>