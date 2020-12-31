<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-25
  Time: 오후 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>결제 완료</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body><br/>
<div class="row">
    <h5>상품 결제가 완료 되었습니다.</h5><br/>
    <table>
        <tr>
            <th>주문번호</th>
            <td>${purchaseBookVO.orderNumber}</td>
        </tr>
        <tr>
            <th>상품명</th>
            <td>${sessionScope.payName}</td>
        </tr>
        <tr>
            <th>주문인</th>
            <td>${sessionScope.memberName}</td>
        </tr>
        <tr>
            <th>받는사람</th>
            <td>${purchaseVO.receiver}</td>
        </tr>
        <tr>
            <th>결제금액</th>
            <td><fmt:formatNumber value="${purchaseVO.totalPrice}" pattern="#,###"/>원</td>
        </tr>
        <tr>
            <th>적립포인트</th>
            <td>${sessionScope.payMember.point}</td>
        </tr>
    </table><br/><br/>
    <a href="/start.ing">메인 화면으로</a>
    <a class="loadAjax" href="/purchase/orderList.ing?memberTel=${sessionScope.memberTel}&state=결제완료">결제내역으로</a>
</div>
</body>
</html>
