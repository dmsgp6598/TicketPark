<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>TicketPark</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" charset="UTF-8"></script>
</head>
<body>
<h2 align="center">���� Ȯ��</h2>
    <table class="board_list" border="1" align="center" style="width:300px">
        <thead align="center">
            <tr>
                <th>��¥</th>
               	<th>�¼�</th>
               	<th>����</th>
                <th>����</th>
            </tr>
         </thead>
         <tbody align="center">
            <tr>
            	<td>${datetime }</td>
            	<td>${seat }</td>
            	<td>${amount }</td>
            	<td>${price }</td>
        </tbody>
    </table>
    <div align="center" style="margin-top : 20px">
    <a href="#this" class="btn" id="pay">�����ϱ�</a>
    <a href="#this" class="btn" id="before">���</a>
    </div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script>
         $("#pay").click(function () {

           var IMP = window.IMP;
            IMP.init('imp80925553');

            IMP.request_pay({
                pg : 'kakaopay',
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '�ֹ���:�����׽�Ʈ',
                amount : '${price}',
                buyer_email : 'iamport@siot.do',
                buyer_name : '�������̸�',
                buyer_tel : '010-1234-5678',
                buyer_addr : '����Ư���� ������ �Ｚ��',
                buyer_postcode : '123-456'
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '������ �Ϸ�Ǿ����ϴ�.';
                 	var comSubmit = new ComSubmit();
                 	comSubmit.setUrl("<c:url value='/pay/result'/>");
                 	comSubmit.addParam("SHOW_NUM", "${SHOW_NUM}");
                 	comSubmit.addParam("RES_AMOUNT", "${amount}");
                 	comSubmit.addParam("RES_PRICE", "${price}");
                 	comSubmit.addParam("RES_TIME", "${datetime}");
                 	comSubmit.addParam("MEM_NUM", "${session_MEM_INFO.MEM_NUM}");
                 	comSubmit.addParam("SHOWDATE_NUM", "${SHOWDATE_NUM}");
                 	comSubmit.addParam("SHOW_SEAT", "${SHOW_SEAT}");
                 	comSubmit.addParam("rank", "${rank}");
                 	comSubmit.addParam("SHOW_NAME", "${SHOW_NAME}");
                 	comSubmit.addParam("MEM_ID", "${session_MEM_INFO.MEM_ID}");
                 	comSubmit.submit();
                } else {
                    var msg = '������ �����Ͽ����ϴ�.';
                    msg += '�������� : ' + rsp.error_msg;
                }
                alert(msg);
            });

        });

        $("#before").click(function(){
        	var SHOW_NUM = "${SHOW_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/showDetail'/>");
			comSubmit.addParam("SHOW_NUM", SHOW_NUM);
			comSubmit.submit();
        });

        /* $("#pay").click(function(){
        	var comSubmit = new ComSubmit();
         	comSubmit.setUrl("<c:url value='/pay/result'/>");
         	comSubmit.addParam("SHOW_NUM", "${SHOW_NUM}");
         	comSubmit.addParam("RES_AMOUNT", "${amount}");
         	comSubmit.addParam("RES_PRICE", "${price}");
         	comSubmit.addParam("RES_TIME", "${datetime}");
         	comSubmit.addParam("MEM_NUM", "${session_MEM_INFO.MEM_NUM}");
         	comSubmit.addParam("SHOWDATE_NUM", "${SHOWDATE_NUM}");
         	comSubmit.addParam("SHOW_SEAT", "${SHOW_SEAT}");
         	comSubmit.addParam("rank", "${rank}");
         	comSubmit.addParam("SHOW_NAME", "${SHOW_NAME}");
         	comSubmit.submit();

        }); */
    </script>
</body>
</html>