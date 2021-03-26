<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<%@ include file="/WEB-INF/layout/adminHeader.jsp" %>
    <h2 align="center">공연 목록</h2>
    <table class="board_list" border="1" align="center" style="text-align:center; width:500px;">
        <thead align="center">
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">카테고리</th>
                <th scope="col" style="width:100px">포스터</th>
                <th scope="col">이름</th>
                <th scope="col">등록일</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    
    <div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <div align="center">
    <a href="#this" class="btn" id="write">공연 등록</a>
     </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            fn_selectShowList(1);

            
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openShowWriteForm();
            }); 
           
        });
         
         
        function fn_openShowWriteForm(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/adminShow/showWriteForm' />");
            comSubmit.submit();
        }
         
        function fn_openShowDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/adminShow/resMemberList' />");
            comSubmit.addParam("SHOW_NUM", obj.parent().find("#SHOW_NUM").val());
            comSubmit.submit();
        }

         function fn_selectShowList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/adminShow/selectShowList'/>");
			comAjax.setCallback("fn_selectShowListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
        }

        function fn_selectShowListCallback(data){
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
					eventName : "fn_selectShowList",
					recordCount : 15
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value){
					str +=  "<tr>" +
	        		"<td>"+value.SHOW_NUM+"</td>";

					if(value.SHOW_CAT == 0){
						str += "<td>뮤지컬</td>";
					}else if(value.SHOW_CAT == 1){
						str += "<td>콘서트</td>";
					}else if(value.SHOW_CAT == 2){
						str += "<td>전시회</td>";
					}else if(value.SHOW_CAT == 3){
						str += "<td>축제</td>";
					}
	        		
	        		str += "<td><img src='<c:url value='/poster/"+value.SHOW_IMAGE +"'/>' width='100' height='100'></td>"+
	        		"<td class='title'><a href='#this' name='title'>"+value.SHOW_NAME+"</a>"+
	        		"<input type='hidden' id='SHOW_NUM' value='"+value.SHOW_NUM+"'>"+"</td>"+
	        		"<td>"+value.SHOW_DATE+"</td>"+
	        	"</tr>";
				});
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