<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-28
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>리뷰게시판</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../../../css/review.css" rel="stylesheet" type="text/css">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../../../js/review.js" type="text/javascript"></script>
</head>
<body>
<p id="star_rate">
    <a href="#" value="1">★</a>
    <a href="#" value="2">★</a>
    <a href="#" value="3">★</a>
    <a href="#" value="4">★</a>
    <a href="#" value="5">★</a>
</p>
<form action="/review/registReview.ing">
    <input type="hidden" id="purchaseBook_isbn" value="${reviewVO.isbn}"/>
    <input type="hidden" id="purchase_orderNumber" value="${reviewVO.orderNumber}"/>
    <textarea id = "review_content" placeholder="리뷰를 작성해주세요 50자이내">

        </textarea>
</form>
<button type="button" id="regist_review">등록</button>
</body>
</html>