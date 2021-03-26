<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <table class="board_list" align="center" style="font-size:16px">
        <thead align="center">
            <tr>
                <th colspan="3"><h3>결제가 완료되었습니다.</h3></th>
            </tr>
            <tr>
            	<th>공연</th>
            	<th>일시</th>
            	<th>수량</th>
            </tr>
         </thead>
         <tbody align="center">
         	<tr>
         		<td>${map.SHOW_NAME }</td>
         		<td>${map.RES_TIME }</td>
         		<td>${map.RES_AMOUNT }</td>
         	</tr>
        </tbody>
    </table>
    <div align="center" style="margin-top:20px">
    	<a href="#this" id="main" style="font-size:16px">메인으로</a>&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="#this" id="res" style="font-size:16px">예매내역</a>
    </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript" charset="UTF-8">
        $(document).ready(function(){
             
            $("#main").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_goMain();
            }); 
             
            $("#res").on("click", function(e){ //제목 
                e.preventDefault();
                fn_goMypage();
            });
        });
         
         
        function fn_goMain(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/main'/>");
            comSubmit.submit();
        }

        function fn_goMypage(){
        	var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/mypage/resList'/>");
            comSubmit.submit();
        }

       
    </script> 
</body>
</html>