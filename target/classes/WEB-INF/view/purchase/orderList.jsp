<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-26
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>전체 주문 내역</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>
<div class="row">
    <h5>${sessionScope.memberName}님의 주문 내역입니다</h5><br/>
    <table class="centered">
        <thead>
        <tr>
            <th>주문번호</th>
            <th>상품명</th>
            <th>주문인</th>
            <th>받는사람</th>
            <th>결제금액</th>
            <th>구매일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="orderList" items="${orderList}">
            <c:forEach var="list" items="${orderList}">
                <tr>
                    <td><a class="loadAjax" href="/purchase/detailOrderList.ing?orderNumber=${list.orderNumber}">${list.orderNumber}</a></td>
                    <td>${list.bookVO.title}</td>
                    <td>${list.memberVO.name}</td>
                    <td>${list.receiver}</td>
                    <td><fmt:formatNumber value="${list.totalPrice}" pattern="#,###"/>원</td>
                    <td>${list.purchaseDate}</td>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
    <br/><br/><br/>
    <a href="/start.ing">메인 화면으로</a>
</div>
</body>
</html>
