<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<c:if test="${session_MEM_INFO != null }">
    	<form id="frm" name="frm">
    	<table align="center">
    		<thead>
    			<tr>
    				<td>
    				<select id="REVIEW_SCORE" name="REVIEW_SCORE">
    					<c:forEach var="row" begin="0" end="10">
    						<option value="${row }">${row }점</option>
    					</c:forEach>
    				</select>
    				</td>
    				<td><textarea id="REVIEW_CONTENTS" name="REVIEW_CONTENTS" cols="40" rows="3"></textarea></td>
    				<td><a href="#this" id="write">작성하기</a></td>
    			</tr>
    		</thead>
    	</table>
    	</form>
    </c:if>
    <table class="board_list" align="center">
    	<thead>
    		<tr align="center">
    			<th width='100'>점수</th>
    			<th width='350'>한줄평</th>
    			<th width='100'>아이디</th>
    			<th width='50'>관람여부</th>
    			<th width='50'></th>
    		</tr>
    	</thead>
        <tbody >
        </tbody>
    </table>
    
    <div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript" charset="UTF-8">
    $(document).ready(function(){
        fn_selectReviewList(1);
  
        $("#write").on("click", function(e){ //글쓰기 버튼
        	if($("#REVIEW_CONTENTS").val()==""){
				alert("리뷰를 입력해주세요.");
				$("#REVIEW_CONTENTS").focus();
				return false;
        	}
            e.preventDefault();
            fn_reviewWrite();
        }); 
    });
         
         
        function fn_reviewWrite(){
            var SHOW_NUM = "${SHOW_NUM}";
            var ID = "${session_MEM_INFO.MEM_ID}";
            var MEM_NUM = "${session_MEM_INFO.MEM_NUM}";
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/showDetail/reviewWrite' />");
            comSubmit.addParam("SHOW_NUM", SHOW_NUM);
            comSubmit.addParam("REVIEW_SHOWNUM", SHOW_NUM);
            comSubmit.addParam("REVIEW_ID", ID);
            comSubmit.addParam("MEM_NUM", MEM_NUM);
            comSubmit.addParam("REVIEW_SHOWNAME", "${REVIEW_SHOWNAME}");
            comSubmit.submit();
        }

        function fn_reviewDelete(obj){
            var comSubmit = new ComSubmit();
            var SHOW_NUM = "${SHOW_NUM}";
            var MEM_ADMIN = "${session_MEM_INFO.MEM_ADMIN}";
            comSubmit.setUrl("<c:url value='/showDetail/reviewDelete' />");
            comSubmit.addParam("SHOW_NUM", SHOW_NUM);
            comSubmit.addParam("REVIEW_ID", obj.parent().find("#REVIEW_ID").val());
            comSubmit.addParam("MEM_ADMIN", MEM_ADMIN);
            comSubmit.submit();
        }

         function fn_selectReviewList(pageNo){
            var SHOW_NUM = "${SHOW_NUM}";
            var MEM_ID = "${session_MEM_INFO.MEM_ID}";
            var MEM_ADMIN = "${session_MEM_INFO.MEM_ADMIN}";
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/showDetail/selectReviewList'/>");
			comAjax.setCallback("fn_selectReviewListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("SHOW_NUM", SHOW_NUM);
			comAjax.addParam("MEM_ID", MEM_ID);
			comAjax.addParam("MEM_ADMIN", MEM_ADMIN);
			comAjax.ajax();
        }

        function fn_selectReviewListCallback(data){
			var total = data.TOTAL;
			var body = $("tbody");
			var id = data.MEM_ID;
			var admin = data.MEM_ADMIN;
			var showNum = data.SHOW_NUM;
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='5'align='center'>조회된 결과가 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectReviewList",
					recordCount : 10
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value){
					str +=  "<tr>"+
	        		"<td width='100' align='center'>"+value.REVIEW_SCORE+"점</td>"+
	        		"<td width='350' align='left'><pre>"+value.REVIEW_CONTENTS+"</pre></td>"+
	        		"<td width='100' align='center'>"+value.REVIEW_ID+"</td>"+
	        		"<td width='50' align='center'>"+value.REVIEW_RES+"</td>"+
	        		"<td width='50' align='center' class='delete'>";
	        		if(admin == 'A' || id == value.REVIEW_ID){
	            	
	            		str+="<a href='#this' name='delete'>삭제</a>"+
	            		"<input type='hidden' id='REVIEW_ID' value="+value.REVIEW_ID+">";
	        		}
	     
	            str +="</td>"+
	        	"</tr>";
				});
				body.append(str);

				$("a[name='delete']").on("click", function(e){ //제목 
					var result = confirm("정말 삭제하시겠습니까?");
					if(result){
	                	e.preventDefault();
	                	fn_reviewDelete($(this));
					}
	            });


			}
        }
    </script> 
</body>
</html>