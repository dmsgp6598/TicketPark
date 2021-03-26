<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<div id="link" align="right" style="width:69%; margin-bottom:30px;">
	<a href="#this" id="hot">인기순</a>
	<a href="#this" id="new">최신순</a>
	</div>
	<table align="center">
		<tbody>
		</tbody>
	</table>
	<div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            fn_showList(1);

            $("#hot").on("click", function(e){
                e.preventDefault();
                fn_hotList();
            });

            $("#new").on("click", function(e){
                e.preventDefault();
                fn_newList();
            });
        });

        function fn_hotList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/main/concert_hot'/>");
            comSubmit.submit();
        }

        function fn_newList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/main/concert_new'/>");
            comSubmit.submit();
        }
         
         function fn_showList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/main/selectConcert_new'/>");
			comAjax.setCallback("fn_showListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 12);
			comAjax.ajax();
        }

         function fn_openShowDetail(obj){
             var comSubmit = new ComSubmit();
             comSubmit.setUrl("<c:url value='/showDetail' />");
             comSubmit.addParam("SHOW_NUM", obj.parent().find("#SHOW_NUM").val());
             comSubmit.submit();
         }

        function fn_showListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='4'>공연이 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_showList"
				};
				gfn_renderPaging(params);

				var list_count = 1;
				var str = "";
				str += "<tr>"
				$.each(data.list, function(key, value){
					str += "<td align='center'>"+"<a href='#this' name='title'>"+"<img src='<c:url value='/poster/"+value.SHOW_IMAGE+"'/>' width='100' height='100'>"+"</a>"+
					"<br>"+"<input type='hidden' id='SHOW_NUM' value='"+value.SHOW_NUM+"'>"+value.SHOW_NAME+"</td>";
					if(list_count == 4){
						str += "</tr>"+
								"<tr>";
						list_count = 0;
					}
					list_count += 1;

				});
				str += "</tr>";
				body.append(str);

				$("a[name='title']").on("click", function(e){ //제목 
	                   e.preventDefault();
	                   fn_openShowDetail($(this));
	               });
			}
        }
    </script> 

</body>
</html>