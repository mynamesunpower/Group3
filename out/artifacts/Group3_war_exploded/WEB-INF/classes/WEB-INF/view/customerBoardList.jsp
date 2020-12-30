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

    <!--Import Google Icon Font pagination 페이징-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


    <!--Import materialize.css pagination페이징-->
    <link rel="stylesheet" href="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>


    <script>
        $(document).ready(function () {
            $('#List').pageMe({
                pagerSelector: '#myPager',
                activeColor: 'blue',
                prevText: 'Anterior',
                nextText: 'Siguiente',
                showPrevNext: true,
                hidePageNumbers: false,
                perPage: 10
            });  //페이징관련 스크립트.
        });

    </script>

</head>
<body>
<h1>고객문의 게시판</h1><br/>

<table cellpadding="1" cellspacing="1" class="table table-hover" id="List">
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
            <td><a href="/customerBoard.ing?articleId=${customerBoardList.articleId}">
                    ${customerBoardList.title}</a></td>
            <td>${customerBoardList.writingTime}</td>
            <td>${customerBoardList.readCount}</td>
        </tr>
        </tbody>
    </c:forEach>
</table>
<br/>

<div class="col-md-12 center text-center">
    <span class="left" ></span>
    <ul class="pagination pager" id="myPager"></ul>
</div>
<%--페이지 넘버--%>

<%--회원로그인 해야만 글쓰기 버튼이 보임.--%>
<c:choose>
    <c:when test="${sessionScope.memberId eq null}">
    </c:when>
    <c:when test="${sessionScope.memberName ne null}">
        <a href="/customerBoardInsert.ing"><input type="button" value="글쓰기"></a>
    </c:when>
</c:choose>

<form action="/customerBoardSearch.ing">
    <div class="row">
        <div class="input-field col s4">
            <%-- 검색창 필드 크기 조정.--%>
            <label for="title">글제목을 입력해주세요.</label>
            <input type="text" id="title" name="title">
            <input type="submit" value="검색">
        </div>
    </div>
</form>


</body>
</html>
