<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-28
  Time: 오후 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body>

<table class="highlight">
<tr>
<td>글번호</th>
<td>${customerBoard.articleId}</td>
</tr>

<tr>
    <td>제목</th>
    <td>${customerBoard.title}</td>
</tr>

<tr>
    <td>내용</th>
    <td>${customerBoard.content}</td>
</tr>
</table>
<%--폼으로 묵어야댈가요--%>


<a href="/customerBoardUpdate.ing?articleId=${customerBoard.articleId}">글수정</a> <br/><br/>

<a href="/customerBoardDelete.ing?articleId=${customerBoard.articleId}">글삭제</a> <br/><br/>

<a href="/customerBoardReply.ing?articleId=${customerBoard.articleId}">답글</a> <br/><br/>

<a href="/customerBoardList.ing">글목록으로 돌아가기</a><br/><br/>



</body>
</html>
