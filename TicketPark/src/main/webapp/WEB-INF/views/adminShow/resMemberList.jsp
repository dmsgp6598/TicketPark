<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <%@ include file="/WEB-INF/layout/adminHeader.jsp" %>
    <table class="board_list" border="1" align="center">
        <thead align="center">
            <tr>
                <td rowspan="5"><img src="<c:url value='/poster/${showList[0].SHOW_IMAGE }'/>" width="100" height="100"></td>
                <td><strong>${showList[0].SHOW_NAME }</strong>
                <input type="hidden" id="SHOW_NUM" name="SHOW_NUM" value="${showList[0].SHOW_NUM }"/>
                </td>
            </tr>
            <tr>
            	<td>카테고리&nbsp;&nbsp;${showList[0].SHOW_CAT }</td>
            </tr>
            <tr>
            	<td>좌석 등급&nbsp;&nbsp;${showList[0].SHOW_OPTION1 }</td>
            </tr>
            <tr>
            	<td>기본 가격&nbsp;&nbsp;${showList[0].SHOW_PRICE }</td>
            </tr>
        </thead>
    </table>
    <h2 align="center">예매자 목록</h2>
    <table class="board_list" border="1" align="center">
    	<thead align="center">
    		<tr>
    			<th scope="col">회원아이디</th>
                <th scope="col">예매 수량</th>
                <th scope="col">예매 시간</th>
                <th scope="col">예매 가격</th>
                <th scope="col">예매일</th>
    		</tr>
    	</thead>
    	<tbody>
    	</tbody>
    </table>
    
    <div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <table align="center">
    	<tfoot align="right">
    	</tfoot>
    </table>
    <div align="center">
    <a href="#this" class="btn" id="update">수정</a>
    <a href="#this" class="btn" id="delete">삭제</a>
    <a href="#this" class="btn" id="list">목록</a>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            fn_selectShowDetail(1);

            
            $("#update").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openShowModifyForm();
            }); 

            $("#delete").on("click", function(e){ //제목 
                var result = confirm("정말 삭제하시겠습니까?");
                if(result){
	                e.preventDefault();
	                fn_deleteShow();
                }else{
                }
            });

            $("#list").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openShowList();
            });
           
        });
         
         
        function fn_openShowModifyForm(){
            var show_num = "${showList[0].SHOW_NUM}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/adminShow/showModifyForm' />");
            comSubmit.submit();
        }
         
        function fn_deleteShow(){
            var show_num = "${showList[0].SHOW_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminShow/showDelete'/>");
			comSubmit.addParam("SHOW_NUM", show_num);
			comSubmit.submit();
			
        }

        function fn_openShowList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/adminShow/showList'/>");
			comSubmit.submit();
			
        }

         function fn_selectShowDetail(pageNo){
            var show_num = "${showList[0].SHOW_NUM}";
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/adminShow/selectResMemberList'/>");
			comAjax.setCallback("fn_selectShowDetailCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("SHOW_NUM", show_num);
			comAjax.ajax();
        }

        function fn_selectShowDetailCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			var foot = $("table>tfoot");
			body.empty();
			foot.empty();
			if(total == 0){
				var str = "<tr align='center'>"+
							"<td colspan='5'>조회된 결과가 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectShowDetail",
					recordCount : 15
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value){
					str +=  "<tr>" +
	    			"<td>"+value.MEM_ID+"</td>"+
	    			"<td>"+value.RES_AMOUNT+"</td>"+
	    			"<td>"+value.RES_TIME+"</td>"+
	    			"<td>"+value.RES_PRICE+"</td>"+
	    			"<td>"+value.RES_DATE+"</td>"+
	    		"</tr>";
				});

				var str1 = "";
				str1 += "<tr>"+"<td>"+"총 판매금액   :  " + data.list[0].SUM_PRICE+"</td>"+"</tr>";
				
				body.append(str);
				foot.append(str1);

			}
        }
    </script> 
</body>
</html>