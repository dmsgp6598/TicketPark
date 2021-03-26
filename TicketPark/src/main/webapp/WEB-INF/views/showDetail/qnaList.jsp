<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="60%" height="100%" >

    <div align="center">
    <select id="column_name" >
	    	<option value="0" <c:if test="${map.column_name == 'QNA_ID' }">selected</c:if>>아이디</option>
	    	<option value="1" <c:if test="${map.column_name == 'QNA_TITLE' }">selected</c:if>>제목</option>   		
	    </select>
		<input type="text" name="search_keyword" id="search_keyword" value="${map.search_keyword}">
		<a href='#this' name='search'>검색</a>
    </div>
    <table align="center" style="font-align:center" width="40%">
    	<%-- <c:if test="${session_MEM_INFO.MEM_ADMIN == 'M' }">
    <a href="#this" class="btn" id="write">문의하기</a>
    </c:if> --%>
        <thead align="center">
            <tr>
                <th scope="col" width="20%">글번호</th>
                <th scope="col" width="60%">제목</th>
                <th scope="col" width="20%">아이디</th>
                <c:if test="${session_MEM_INFO.MEM_ADMIN == 'A'}">
    				<th scope="col">답변</th>
    			</c:if>
            </tr>
        </thead>
        <tbody align="center">
        </tbody>
        <tfoot>
        <tr>
        	<td align="left">
        		<c:if test="${session_MEM_INFO.MEM_ADMIN == 'M' }">
    <a href="#this" class="btn" id="write">문의하기</a>
    </c:if>
        	</td>
        </tr>
        </tfoot>
    </table>
    
    
    <div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){
        fn_selectShowQnaList(1);

        $("#write").on("click", function(e){ //글쓰기 버튼
            e.preventDefault();
            fn_openShowQnaWriteForm();
        }); 
        $("a[name='search']").on("click", function(e) {
        	if($("#search_keyword").val()==""){
				alert("검색내용을 입력해주세요.");
				$("#search_keyword").focus();
				return false;
			}
			e.preventDefault();
			fn_selectShowQnaList(1);
        });
    });
         
         
        function fn_openShowQnaWriteForm(){
        	var showNum = "${map.SHOWQNA_SHOWNUM}"
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/showDetail/qnaWriteForm' />");
            comSubmit.addParam("SHOWQNA_SHOWNUM",showNum);
            comSubmit.submit();
        }
         
        function fn_ReshowQna(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/adminShow/qnaReWriteForm' />");
            comSubmit.addParam("SHOWQNA_NUM", obj.parent().find("#SHOWQNA_NUM").val());
            comSubmit.addParam("SHOWQNA_RESTEP", obj.parent().find("#SHOWQNA_RESTEP").val());
            comSubmit.submit();
        }

        function fn_openShowQnaDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/showDetail/qnaDetail' />");
            comSubmit.addParam("SHOWQNA_NUM", obj.parent().find("#SHOWQNA_NUM").val());
            comSubmit.addParam("SHOWQNA_RESTEP", obj.parent().find("#SHOWQNA_RESTEP").val());
            comSubmit.submit();
        }

         function fn_selectShowQnaList(pageNo){
        	var column_name =$('#column_name option:selected').val();
            var search_keyword = $('#search_keyword').val();
            var showNum = "${map.SHOWQNA_SHOWNUM}"
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/showDetail/selectShowQnaList'/>");
			comAjax.setCallback("fn_selectShowQnaListCallback");
			comAjax.addParam("COLUMN_NAME", column_name);
			comAjax.addParam("SEARCH_KEYWORD", search_keyword);
			comAjax.addParam("SHOWQNA_SHOWNUM",showNum);
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
        }

        function fn_selectShowQnaListCallback(data){
            var admin = "${session_MEM_INFO.MEM_ADMIN}";
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='3'>상품 문의가 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectShowQnaList",
					recordCount : 15
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.showQna, function(key, value){
					str +=  "<tr>" +
							"<td>" + value.SHOWQNA_NUM + "</td>" +
							"<td class = 'title'>" + "<a href='#this' name='title'>" + value.SHOWQNA_TITLE + "</a>" +
							"<input type='hidden' id='SHOWQNA_RESTEP' value=" + value.SHOWQNA_RESTEP + ">" +
							"<input type='hidden' id='SHOWQNA_NUM' value=" + value.SHOWQNA_NUM + ">" + "</td>" +
							"<td>" + value.SHOWQNA_ID + "</td>";
					if(value.SHOWQNA_RESTEP == 0 && admin == 'A' && value.SHOWQNA_CON == 'N') {
						str += "<td><a href='#this' name='reply'>답변</a>"
							+ "<input type='hidden' id='SHOWQNA_NUM' value=" + value.SHOWQNA_NUM + ">"
							+ "<input type='hidden' id='SHOWQNA_RESTEP' value=" + value.SHOWQNA_RESTEP + ">"
							+ "</td></tr>"
						}
					else {
						str += "</tr>"
						}
				});
				body.append(str);

				  
	            $("a[name='title']").on("click", function(e){ //제목 
	                e.preventDefault();
	                fn_openShowQnaDetail($(this));
	            });

	            $("a[name='reply']").on("click", function(e){ //제목 
	                e.preventDefault();
	                fn_ReshowQna($(this));
	            });

			}
        }
    </script> 
</body>
</html>