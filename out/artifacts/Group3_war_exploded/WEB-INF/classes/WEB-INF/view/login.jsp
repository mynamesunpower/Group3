<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-18
  Time: 오후 6:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인하기</title>
</head>
<body>
<form action="/doLogin.ing" method="post">
    아이디 : <input type="text" name="id">
    비번 : <input type="password" name="password">
    <input type="submit" value="로그인">
</form>
</body>
</html>
