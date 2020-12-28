<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-27
  Time: 오후 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>주문 상세</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../../../js/order.js" type="text/javascript"></script>
</head>
<body><br/>
<div class="row">
    <table class="centered">
        <tr>
            <td rowspan="${fn:length(detailOrder_List)+1}">상품명</td>
        </tr>
        <c:forEach var="detailOrder_list" items="${detailOrder_List}">
            <tr>
                <td><a href="">${detailOrder_list.bookVO.title}</a> ${detailOrder_list.purchaseBookVO.quantity}권</td>
            </tr>
        </c:forEach>
        <tr>
            <td>주문인</td>
            <td>${sessionScope.memberName}</td>
        </tr>
        <tr>
            <td>받는사람</td>
            <td>${purchaseInfo.receiver}</td>
        </tr>
        <tr>
            <td>배송지</td>
            <td>${purchaseInfo.shipAddress}</td>
        </tr>
        <tr>
            <td>결제금액</td>
            <td><fmt:formatNumber value="${purchaseInfo.totalPrice}" pattern="#,###"/>원</td>
        </tr>
        <tr>
            <td>구매일</td>
            <td>${purchaseInfo.purchaseDate}</td>
        </tr>
    </table><br/><br/>
    <form action="/purchase/cancelOrder.ing" method="post" >
        <input type="hidden" id="orderNumber" name="orderNumber" value="${purchaseInfo.orderNumber}">
        <button type="submit" id="cancel_order" class="col s2 offset-s9 waves-effect waves-light btn-small white black-text">결제취소</button>
    </form>
</div>
</body>
</html>
