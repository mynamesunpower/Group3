<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-19
  Time: 오후 6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>장바구니 목록</title>
</head>
<body>
<table border="1">
    <tr>
        <td>책</td>
        <td>isbn</td>
        <td>가격</td>
        <td>수량</td>
    </tr>
    <c:forEach var="cart" items="${cart}">
    <tr>
        <td>${cart.bookVO.title}</td>
        <td>${cart.isbn}</td>
        <td>${cart.bookVO.price}</td>
        <td>${cart.quantity}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
