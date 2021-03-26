<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<div class="header_area">
   <a href="/ticket/main" title="TicketPark"><img class="main_image" src="<c:url value="/images/logo.jpg"/>" alt="TicketPark"/></a>     
      <div class="search_inner">
         <form action="/ticket/main/search" method="post">
               <input type="text" class="txt" placeholder="공연 제목 검색" name="keyword"/>&nbsp;
               <input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
         </form>
      </div>
   <div class="top_menu">
      <ul>
         <c:if test="${session_MEM_INFO == null }">
         <li><a href="${contextPath}/ticket/join/joinForm" class="log">회원가입</a></li> 
         <li><a href="${contextPath}/ticket/logon/loginForm">로그인</a> </li>
         <li><a href="${contextPath}/ticket/cos/noticeList">고객센터</a> </li>
         
         </c:if>
         <c:if test="${session_MEM_INFO != null }">
         <li><p style="font-color:#666; font-size:12px;">${session_MEM_INFO.MEM_ID}&nbsp;님</p></li>   
            <c:if test="${session_MEM_INFO.MEM_ADMIN == 'A' }">
            	<li><a href="${contextPath}/ticket/logon/logout" class="log">로그아웃</a></li> 
         		<li><a href="${contextPath}/ticket/adminMem/memberList">관리자</a></li>
         		<li><a href="${contextPath}/ticket/cos/noticeList">고객센터</a></li> 
            </c:if>
            <c:if test="${session_MEM_INFO.MEM_ADMIN == 'M' }">
            	<li><a href="${contextPath}/ticket/logon/logout" class="log">로그아웃</a></li> 
         		<li><a href="#this" id="mypage" class="log">마이페이지</a></li>
         		<li><a href="${contextPath}/ticket/cos/noticeList">고객센터</a></li> 
            </c:if>
         </c:if>
      </ul>       
   </div>


 <div class="tab_cate">    
       <button id="test_btn1" onclick="location.href='/ticket/main'">전체</button> 
       <button id="test_btn2" onclick="location.href='/ticket/main/musical_new'">뮤지컬</button>
       <button id="test_btn3" onclick="location.href='/ticket/main/concert_new'">콘서트</button>
       <button id="test_btn4" onclick="location.href='/ticket/main/exhibition_new'">전시회</button>
       <button id="test_btn5" onclick="location.href='/ticket/main/festival_new'">페스티벌</button>
 </div>
 

 </div>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<form id="frm" name="frm" class="form-signin">
		<div class="card align-middle" style="width:20rem; border-radius:20px; margin-bottom:70px">
         <div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">${session_MEM_INFO.MEM_ID}&nbsp;님 환영합니다.</h2>
            </div>
		<div class="card-body">
		<a href="#this" class="btn btn-lg btn-primary btn-block" id="logout" style="background-color:#ffd34a; color:black; border:0; outline:0;" >로그아웃</a>  
		</div>
		</div>
      </div>
      <div align="center">
	<table >
	
		<a href="#this" class="btn btn-lg btn-primary" id="reslist" style="background-color:#ffd34a; color:black; border:0; outline:0; margin-right:125px;" >예매내역</a>
		<a href="#this" class="btn btn-lg btn-primary" id="likelist" style="background-color:#ffd34a; color:black; border:0; outline:0; margin-right:125px" >즐겨찾기</a>
		<a href="#this" class="btn btn-lg btn-primary" id="qna" style="background-color:#ffd34a; color:black; border:0; outline:0; margin-right:125px" >QnA</a>
		<a href="#this" class="btn btn-lg btn-primary" id="reviewlist" style="background-color:#ffd34a; color:black; border:0; outline:0; margin-right:125px" >나의 리뷰</a>
		<a href="#this" class="btn btn-lg btn-primary" id="modify" style="background-color:#ffd34a; color:black; border:0; outline:0; margin-right:125px" >정보 수정</a>
		<a href="#this" class="btn btn-lg btn-primary" id="delete" style="background-color:#ffd34a; color:black; border:0; outline:0;" >회원 탈퇴</a>  
	
	</table>
	</div>
	</form> 
	
<%@ include file="/WEB-INF/include/include-body.jspf" %> 

<script type="text/javascript"> 
	$(document).ready(function(){ 
			$("#logout").on("click", 
				function(e){ 
					e.preventDefault(); 
					fn_logout(); 
				});
			$("#reslist").on("click", 
					function(e){ 
						e.preventDefault(); 
						fn_reslist(); 
					}); 
			$("#likelist").on("click", 
					function(e){ 
						e.preventDefault(); 
						fn_likelist(); 
					}); 
			$("#qna").on("click", 
					function(e){ 
						e.preventDefault(); 
						fn_qna(); 
					}); 
			$("#reviewlist").on("click", 
					function(e){ 
						e.preventDefault(); 
						fn_reviewlist(); 
					}); 
			$("#modify").on("click", 
					function(e){ 
						e.preventDefault(); 
						fn_modify(${session_MEM_INFO.MEM_NUM}); 
					}); 
			$("#delete").on("click", 
					function(e){ 
						e.preventDefault(); 
						fn_delete(${session_MEM_INFO.MEM_NUM}); 
					});  
			$("#mypage").on("click", 
					function(e){ 
				e.preventDefault(); 
				fn_mypage(${session_MEM_INFO.MEM_NUM}); 
			});
		
	}); 
	function fn_mypage(memnum){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/resList' />"); 
		comSubmit.addParam("MEM_NUM",memnum);
		comSubmit.submit(); 
	}
	function fn_logout(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/logon/logout' />"); 
		comSubmit.submit(); 
	}
	function fn_reslist(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/resList' />"); 
		comSubmit.submit(); 
	}
	function fn_likelist(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/likeList' />"); 
		comSubmit.submit(); 
	}
	function fn_qna(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/myQnaList' />"); 
		comSubmit.submit(); 
	}
	function fn_reviewlist(){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/reviewList' />"); 
		comSubmit.submit(); 
	}
	function fn_modify(memnum){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/memDetail' />"); 
		comSubmit.addParam("MEM_NUM",memnum);
		comSubmit.submit(); 
	}
	function fn_delete(memnum){ 
		var comSubmit = new ComSubmit("frm"); 
		comSubmit.setUrl("<c:url value='/mypage/memberDeleteForm' />"); 
		comSubmit.addParam("MEM_NUM",memnum);
		comSubmit.submit(); 
	}
</script> 
</body>
</html>