<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-28
  Time: 오전 2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>고객문의 게시판</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


</head>
<body>
<h1>고객문의 게시판</h1><br/>

<table class="highlight">
    <thead>
    <tr>

        <th data-field="ARTICLE_ID">글번호</th>
        <th data-field="TITLE">제목</th>
        <th data-field="WRITING_TIME">작성일</th>
        <th data-field="READ_COUNT">조회수</th>
    </tr>
    </thead>

    <c:forEach items="${customerBoardList}" var="customerBoardList">

        <tbody>
        <tr>
            <td>${customerBoardList.articleId}</td>
            <td>${customerBoardList.title}</td>
            <td>${customerBoardList.writingTime}</td>
            <td>${customerBoardList.readCount}</td>
        </tr>
        </tbody>
    </c:forEach>
</table>
<br/><br/><br/><br/>


<%--회원로그인 해야만 글쓰기 버튼이 보임.--%>
<c:choose>
<c:when test="${sessionScope.memberId eq null}">
</c:when>
    <c:when test="${sessionScope.memberName ne null}">
        <a href="/customerBoardInsert.ing"><input type="button" value="글쓰기"></a>
    </c:when>
</c:choose>



</body>
</html>
