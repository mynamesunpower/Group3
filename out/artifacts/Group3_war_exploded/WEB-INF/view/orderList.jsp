<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-23
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문확인 리스트</title>

    <!-- Compiled and minified CSS 주문목록 테이블 css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">

    <!-- Compiled and minified JavaScript 문목록 테이블 js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</head>

<%-- 만들지 못햇음 --%>
주문확인 리스트<br/>
주문확인 리스트<br/>
주문확인 리스트<br/>
주문확인 리스트<br/>
<table class="highlight">
    <thead>
    <tr>

        <th data-field="order_Number">주문번호</th>
        <th data-field="quantity">주문양</th>
        <th data-field="state">구매지역</th>
        <th data-field="total_Price">구매금액</th>
        <th data-field="purchase_Date">구매일</th>
    </tr>
    </thead>

    ${sessionScope.memberTel}
<c:forEach items="${memberOrderList}" var="member">

    <tbody>
    <tr>
        <td>${member.order_Number}</td>
        <td>${member.quantity}</td>
        <td>${member.state}</td>
        <td>${member.total_Price}</td>
        <td>${member.purchase_Date}</td>
    </tr>
    </tbody>

</c:forEach>
</table>
<%-- 만들지 못햇음 --%>

</body>
</html>
