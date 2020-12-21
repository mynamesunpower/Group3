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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../../js/cart.js"></script>
</head>
<body>
<form id="cartForm" action="/cart/deleteCartList.ing" method="post">
<table id="cartTable" border="1">
    <tr>
        <td>책</td>
        <td>isbn</td>
        <td>가격</td>
        <td>수량</td>
    </tr>

    <c:forEach var="cart" items="${cart}">
    <tr class="bookList">
        <td>${cart.bookVO.title}</td>
        <td><input type="hidden" class="isbn" name="isbn" value="${cart.isbn}"> ${cart.isbn}</td>
        <td class="price">${cart.bookVO.price}원</td>
        <td class="count"><input type="button" class="plusCount" value="+">${cart.quantity}<input type="button" class="minusCount" value="-"></td>
        <td><input type="button" class = "deleteBook" value="삭제"> </td>
    </tr>
    </c:forEach>
</table>
    <input type="submit" id="deleteAll" value="전체삭제">
    <input type="submit" id="orderBook"value="주문하기">
</form>
</body>
</html>
