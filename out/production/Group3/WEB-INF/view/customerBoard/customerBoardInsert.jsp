<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-28
  Time: 오후 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객게시판 등록</title>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>
<form action="customerBoard/customerBoardInsertOk.ing">
    <div class="row">
    <div class="input-field col s6 offset-s2">
        <label for="title">글제목</label>
        <input type="text" id="title" name="title" required>
    </div>
    </div>

    <div class="row">
    <div class="input-field col s8 offset-s2">
        <label for="content">글내용</label>
        <textarea type="text"  class="materialize-textarea" id="content" name="content"></textarea>
    </div>
    </div>

    <%--히든으로 값을 넘겨서 db에 저장시킨다.--%>
    <input type="hidden" id="tel" name="tel" value="${sessionScope.memberTel}">
    <button class="btn waves-effect waves-light" type="submit" name="action">글등록</button>
</form>
</body>
</html>
