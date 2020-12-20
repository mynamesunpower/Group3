<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-18
  Time: 오후 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showBook</title>
</head>
<body>
<img src="../../imgs/book/tobySpring.png" width="450px" height="450px">
<form action="cart/addCart.ing" method="post">
    <input type="hidden" name = "isbn" value="${isbn}">
     <input type="submit" value="장바구니추가">
</form>
책 번호 : ${isbn}
회원 전화번호 : ${sessionScope.memberTel}<br/>

</body>
</html>
