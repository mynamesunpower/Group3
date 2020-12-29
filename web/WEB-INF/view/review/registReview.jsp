<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-29
  Time: 오전 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>리뷰 등록 완료</title>
</head>
<body>
리뷰 등록이 완료되었습니다
<a href="/start.ing">메인으로 이동</a>
<a class="loadAjax" href="/review/seeReview.ing?orderNumber=${reviewVO.orderNumber}&isbn=${reviewVO.isbn}">리뷰 보기</a>
</body>
</html>
