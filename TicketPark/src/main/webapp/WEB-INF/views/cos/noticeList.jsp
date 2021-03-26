<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<%@ include file="/WEB-INF/layout/cosHeader.jsp" %>
    <table class="board_list" border="1" align="center" style="width:200px; text-align:center">
        <thead align="center">
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    
    <div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <div align="center">
    <c:if test="${session_MEM_INFO.MEM_ADMIN == 'A' }">
    <a href="#this" class="btn" id="writeForm">글쓰기</a>
    </c:if>
    </div>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            fn_selectNoticeList(1);

            
            $("#writeForm").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openNoticeWrite();
            }); 

        });
         
         
        function fn_openNoticeWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/noticeWriteForm' />");
            comSubmit.submit();
        }
         
        function fn_openNoticeDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/cos/noticeDetail' />");
            comSubmit.addParam("NT_NUM", obj.parent().find("#NT_NUM").val());
            comSubmit.submit();
        }

         function fn_selectNoticeList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/cos/selectNoticeList'/>");
			comAjax.setCallback("fn_selectNoticeListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
        }

        function fn_selectNoticeListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='2'>조회된 결과가 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectNoticeList",
					recordCount : 15
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value){
					str +=  "<tr>" +
							"<td>" + value.NT_NUM + "</td>" +
							"<td class = 'title'>" + "<a href='#this' name='title'>" + value.NT_TITLE + "</a>" +
							"<input type='hidden' id='NT_NUM' value=" + value.NT_NUM + ">" + "</td>" +
							"</tr>";
				});
				body.append(str);

				$("a[name='title']").on("click", function(e){ //제목 
	                e.preventDefault();
	                fn_openNoticeDetail($(this));
	            });

			}
        }

        
    </script> 
</body>
</html>