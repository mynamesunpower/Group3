<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-19
  Time: 오후 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정페이지이다</title>
</head>
<body>
<form action="modifyPublisher_success.ing" method="post">
    출판사 수정하기 <br/>
    <input type="hidden" name="publisherNumber" value="${param.publisherNumber}"/>
    이름: <input type="text" name="publisherName" value="${publisher.publisherName}"> <br/>
    주소: <input type="text" name="address" value="${publisher.address}"> <br/>
    전화번호: <input type="text" name="tel" value="${publisher.tel}"> <br/>
    홈페이지 URL: <input type="text" name="url" value="${publisher.url}"> <br/>
    <input type="submit" value="출판사 수정">
</form>
<a href="/booktrain.ing">홈으로</a>
</body>
</html>
