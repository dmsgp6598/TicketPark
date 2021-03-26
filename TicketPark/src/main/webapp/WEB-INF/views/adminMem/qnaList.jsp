<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<%@ include file="/WEB-INF/layout/adminHeader.jsp" %>
<form id="frm">
<div align="center">
<div style="margin-bottom:20px; margin-left:350px;" align="left">
	<a href="${contextPath}/ticket/adminMem/memberList" style="font-size:14px">회원목록</a>
	<a href="${contextPath}/ticket/adminMem/banList?keyword=" style="font-size:14px">회원정지목록</a>
	<a href="${contextPath}/ticket/adminMem/qnaList" style="font-size:14px">고객센터</a>
</div>
	<select id="column_name" >
    	<option value="0" <c:if test="${map.column_name == 'QNA_ID' }">selected</c:if>>아이디</option>
    	<option value="1" <c:if test="${map.column_name == 'QNA_TITLE' }">selected</c:if>>제목</option>   		
    </select>
	<input type="text" name="search_keyword" id="search_keyword" value="${map.search_keyword}">
	<a href='#this' name='search' style="position:relative;color:#000000;background:#ffd34a;font-size:16px;bottom:3px">검색</a>
	<table>
		<thead>
			<td>글번호</td>
			<td>제목</td>
			<td>아이디</td>
			<td>작성일</td>
			<td>답변여부</td>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    </div>
    </form>
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){
        fn_qnaSearch(1);
        $("a[name='search']").on("click", function(e) {
        	if($("#search_keyword").val()==""){
				alert("검색내용을 입력해주세요.");
				$("#search_keyword").focus();
				return false;
			}
			e.preventDefault();
			fn_qnaSearch(1);
        });
    });
    
        function fn_openQnaList() {
        	var column_name =$('#column_name option:selected').val();        	
           	var search_keyword = $('#search_keyword').val();
			var comsubmit = new ComSubmit();
			comsubmit.addParam("column_name", column_name);
			comsubmit.addParam("SEARCH_KEYWORD", search_keyword);
			comsubmit.setUrl("<c:url value='/adminMem/qnaList'/>");
			comsubmit.submit();
         }


        function fn_qnaSearch(pageNo) {
           	var column_name =$('#column_name option:selected').val();
           	var search_keyword = $('#search_keyword').val();
           	var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/adminMem/qnaSearchList'/>");
			comAjax.setCallback("fn_showListCallback");
			comAjax.addParam("column_name", column_name);
			comAjax.addParam("SEARCH_KEYWORD", search_keyword);
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
         }
        

   
		function fn_QnaRe(obj) {
			var comSubmit = new ComSubmit("frm"); 
			comSubmit.setUrl("<c:url value='/adminMem/qnaReForm' />"); 
			comSubmit.addParam("QNA_NUM", obj.parent().find("#QNA_NUM").val());
			comSubmit.submit(); 
		}

		function fn_QnaDetail(obj){
			var comSubmit = new ComSubmit("frm"); 
			comSubmit.setUrl("<c:url value='/adminMem/qnaDetail' />"); 
			comSubmit.addParam("QNA_NUM", obj.parent().find("#QNA_NUM").val());
			comSubmit.submit(); 
		}

        function fn_showListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='5'>고객문의가 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_qnaSearch"
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.qna, function(key, value){
					str += "<tr>"
							+ "<td>"+value.QNA_NUM+"</td>"
							+ "<td>"+value.QNA_TITLE+"</td>"
							+ "<td>"+value.QNA_ID+"</td>"
							+ "<td>"+value.QNA_DATE+"</td>";
					if(value.QNA_CONFIRM == 'N') {
						str += "<td align='center'><a href='#this' name='confirm'>"
							+ value.QNA_CONFIRM
							+ "</a>"
							+ "<input type='hidden' id='QNA_NUM' value=" 
							+ value.QNA_NUM + ">"
							+ "</td></tr>";
					}else {
						str += "<td align='center'>"+value.QNA_CONFIRM+"</td></tr>";
					}
				});
				body.append(str);

				$("a[name='confirm']").on("click", function(e) { //제목
 					e.preventDefault();
 					fn_QnaRe($(this));
 				});

				$("a[name='title']").on("click", function(e) { //제목
 					e.preventDefault();
 					fn_QnaDetail($(this));
 				});
				
			}
        }
    </script> 
</body>
</html>