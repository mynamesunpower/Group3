<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-18
  Time: 오후 6:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insertPublisher</title>
</head>
<body>

<form action="publisher/insertPublisher_success.ing" method="post">

    출판사 입력하기 <br/>
이름: <input type="text" name="publisherName"> <br/>
주소: <input type="text" name="address"> <br/>
전화번호: <input type="text" name="tel"> <br/>
홈페이지 URL: <input type="text" name="url"> <br/>
<input type="submit" value="출판사 추가">
</form>
</body>
</html>
