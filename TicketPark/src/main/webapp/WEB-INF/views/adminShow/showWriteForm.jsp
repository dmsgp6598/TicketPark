<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>

<body>
    <h2 align="center">공연 등록</h2>
    <form id="frm" name="frm" enctype="multipart/form-data">
    <table align="center">
       
       <c:if test="${map.SHOW_CAT == null }">
       <tr>
          <th align="left">카테고리</th>
       </tr>
       <tr>
          <td>
             <input type="radio" id="SHOW_CAT" name="SHOW_CAT" value="0"/>뮤지컬
             &nbsp;&nbsp;&nbsp;
             <input type="radio" id="SHOW_CAT" name="SHOW_CAT" value="1"/>콘서트
             &nbsp;&nbsp;&nbsp;
             <input type="radio" id="SHOW_CAT" name="SHOW_CAT" value="2"/>전시회
             &nbsp;&nbsp;&nbsp;
             <input type="radio" id="SHOW_CAT" name="SHOW_CAT" value="3"/>축제
          </td>
       </tr>
       <tr>
          <td><a href="#this" class="btn" id="showForm">작성 시작하기</a></td>
       </tr>
       </c:if>
       <c:if test="${map.SHOW_CAT != null }">
       <input type="hidden" id="SHOW_CAT" name="SHOW_CAT" value="${map.SHOW_CAT }"/>
       <%-- <input type="hidden" id="SHOW_OPTION1" name="SHOW_OPTION1" value="${null }"/>
       <input type="hidden" id="SHOW_OPTION2" name="SHOW_OPTION2" value="${null }"/> --%>
       <tbody id="nec">
       <tr>
          <th align="left">제목</th>
       </tr>
       <tr>
          <td><input type="text" id="SHOW_NAME" name="SHOW_NAME"/></td>
       </tr>
       <tr>
          <th align="left">공연 이미지</th>
       </tr>
       <tr>
          <td><input type="file" name="file_0" id="file_0"/></td>
       </tr>
       <tr>
          <th align="left">상세정보</th>
       </tr>
       <tr>
          <td><input type="file" name="file_1" id="file_1"/></td>
       </tr>
       <tr>
          <th align="left">기본 가격</th>
       </tr>
       <tr>
          <td><input type="text" id="SHOW_PRICE" name="SHOW_PRICE"/></td>
       </tr>
       <tr>
          <th align="left">좌석수</th>
       </tr>
       <tr>
          <td><input type="text" id="SHOW_SEAT" name="SHOW_SEAT"/></td>
       </tr>
       <tr>
          <th align="left">날짜</th>
       </tr>
       <tr>
          <td><input type="text" id="datepick" name="datepick" size="100"/></td>
       </tr>
       <tr>
          <th align="left">시간</th>
       </tr>
       <tr>
          <td>
          <c:forEach var="i" begin="0" end="9">
             <input type="checkbox" id="showTime" name="showTime" value="0${i }:00:00"/>${i }시&nbsp;
          </c:forEach>
          </td>
       </tr>
       <tr>
          <td>
          <c:forEach var="i" begin="10" end="16">
             <input type="checkbox" id="showTime" name="showTime" value="${i }:00:00"/>${i }시&nbsp;
          </c:forEach>
          </td>
       </tr>
       <tr>
          <td>
          <c:forEach var="i" begin="17" end="23">
             <input type="checkbox" id="showTime" name="showTime" value="${i }:00:00"/>${i }시&nbsp;
          </c:forEach>
          </td>
       </tr>
       <tr>
          <th align="left">좌석 등급(선택사항)</th>
       </tr>
       </tbody>
       <tbody id="opt">
       <tr>
          <td>
          좌석 등급 1&nbsp;<input type="text" id="option1_0" name="option1_0"/>&nbsp;&nbsp;
          추가 가격 1&nbsp;<input type="text" id="option2_0" name="option2_0"/>
          </td>
       </tr>
       <tr>
          <td>
          좌석 등급 2&nbsp;<input type="text" id="option1_1" name="option1_1"/>&nbsp;&nbsp;
          추가 가격 2&nbsp;<input type="text" id="option2_1" name="option2_1"/>
          </td>
       </tr>
       <tr>
          <td>
          좌석 등급 3&nbsp;<input type="text" id="option1_2" name="option1_2"/>&nbsp;&nbsp;
          추가 가격 3&nbsp;<input type="text" id="option2_2" name="option2_2"/>
          </td>
       </tr>
       <tr>
          <td>
          좌석 등급 4&nbsp;<input type="text" id="option1_3" name="option1_3"/>&nbsp;&nbsp;
          추가 가격 4&nbsp;<input type="text" id="option2_3" name="option2_3"/>
          </td>
       </tr>
       <tr>
          <td>
          좌석 등급 5&nbsp;<input type="text" id="option1_4" name="option1_4"/>&nbsp;&nbsp;
          추가 가격 5&nbsp;<input type="text" id="option2_4" name="option2_4"/>
          </td>
       </tr>
       </tbody>
       
       </c:if>
    </table>
    <br><br>
    <div align="center">
          <a href="#this" class="btn" id="write">작성하기</a>
          <a href="#this" class="btn" id="cancel">취소</a>
    </div>
    </form>
    <br/>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){   
           $("#write").on("click", function(e){ //글쓰기 버튼
              if($("#SHOW_NAME").val()==""){
                alert("공연제목을 입력해주세요.");
                $("#SHOW_NAME").focus();
                return false;
             }
              if($("#file_0").val()==""){
                alert("공연 이미지를 넣어주세요.");
                $("#file_0").focus();
                return false;
             }
             if($("#file_1").val()==""){
                alert("상세정보 이미지를 넣어주세요.");
                $("#file_1").focus();
                return false;
             } 
             if($("#SHOW_PRICE").val()==""){
                alert("기본가격을 입력해주세요.");
                $("#SHOW_PRICE").focus();
                return false;
             }
             if($("#SHOW_SEAT").val()==""){
                alert("좌석수를 입력해주세요.");
                $("#SHOW_SEAT").focus();
                return false;
             }
             if($("#datepick").val()==""){
                alert("날짜를 선택해주세요.");
                $("#datepick").focus();
                return false;
             }
             /* 
             if(!$("input:checkbox[name=#showTime]:checked").length>1{
                alert("시간을 선택해주세요.");
                $("#showTime").focus();
                return false;
             }  */
               
                e.preventDefault();
                fn_showWrite();
            }); 
               
            $("#cancel").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openShowList();
            });

            $("#showForm").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openShowForm();
            });

            $("#datepick").datepick({
            multiSelect : 999, monthsToShow : 3, 
            showTrigger : "<img src='<c:url value='/img/calendar-blue.gif'/>'/>"
            });
        });

        function fn_showWrite(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/adminShow/showWrite' />");
            comSubmit.submit();
        }
         
        function fn_openShowList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/adminShow/showList' />");
            comSubmit.submit();
        }

        function fn_openShowForm(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/adminShow/showWriteForm' />");
            comSubmit.submit();
        }
    </script> 
</body>
</html>