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
	<input type="text" name="keyword" id="keyword" value="${map.keyword }" placeholder="회원아이디 검색">
	<a href='#this' name='search' style="position:relative;color:#000000;background:#ffd34a;font-size:16px;bottom:3px">검색</a>
	<table>
		<thead>
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>휴대폰번호</td>
			<td>회원정지</td>
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
        fn_memSearch(1);
        $("a[name='search']").on("click", function(e) { //제목
        	if($("#keyword").val()==""){
				alert("검색내용을 입력해주세요.");
				$("#keyword").focus();
				return false;
			}
			e.preventDefault();
			fn_openMemberList();
		});
    });

        function fn_openMemberList() {
           	var keyword = $('#keyword').val();
			var comsubmit = new ComSubmit();
			comsubmit.addParam("keyword", keyword);
			comsubmit.setUrl("<c:url value='/adminMem/memberList'/>");
			comsubmit.submit();
         }

        function fn_memSearch(pageNo) {
           	var keyword = $('#keyword').val();
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/adminMem/memberSearchList'/>");
			comAjax.setCallback("fn_showListCallback");
			comAjax.addParam("MEM_ID", keyword);
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.ajax();
         }

       function fn_memStack(obj){
			var comSubmit = new ComSubmit("frm"); 
			comSubmit.setUrl("<c:url value='/adminMem/memberBan' />"); 
			comSubmit.addParam("MEM_ID", obj.parent().find("#MEM_ID").val());
			comSubmit.submit(); 
		}

        function fn_showListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='6'>회원이 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_memSearch",
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.mem, function(key, value){
					str += "<tr>"
							+ "<td>"+value.MEM_NUM+"</td>"
							+ "<td>"+value.MEM_ID+"</td>"
							+ "<td>"+value.MEM_NAME+"</td>"
							+ "<td>"+value.MEM_EMAIL+"</td>"
							+ "<td>"+value.MEM_PHONE+"</td>";

					if(value.MEM_BAN == 'N') {
						str +="<td align='center'>"
							+ "<a href='#this' name='mem_stack'>"
							+ "정지"							
							+ "</a>"
							+ "<input type='hidden' id='MEM_ID' value=" 
							+ value.MEM_ID + ">"
							+"</td>" + "</tr>";
					} else {
						str +="<td>"
							+ "  "							
							+"</td>" + "</tr>";
					}
						});
				body.append(str);
			
				$("a[name='mem_stack']").on("click", function(e) { //제목
					e.preventDefault();
					fn_memStack($(this));
				});
				
			}
        }
    </script> 
</body>
</html>