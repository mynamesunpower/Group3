<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-29
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>검색페이지</title>

    <!--Import Google Icon Font pagination 페이징-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


    <!--Import materialize.css pagination페이징-->
    <link rel="stylesheet" href="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>

    <script>
        $(document).ready(function(){
            $('#List').pageMe({
                pagerSelector:'#myPager',
                activeColor: 'blue',
                prevText:'Anterior',
                nextText:'Siguiente',
                showPrevNext:true,
                hidePageNumbers:false,
                perPage:10
            });  //페이징관련 스크립트.
        });

    </script>
</head>
<body>

<table cellpadding="1" cellspacing="1" class="table table-hover" id="List">
    <thead>
    <tr>
        <th data-field="ARTICLE_ID">글번호</th>
        <th data-field="TITLE">제목</th>
        <th data-field="WRITING_TIME">작성일</th>
        <th data-field="READ_COUNT">조회수</th>
    </tr>
    </thead>

    <c:forEach items="${customerBoardSearch}" var="customerBoardSearch">

        <tbody>
        <tr>
            <td>${customerBoardSearch.articleId}</td>
            <td><a href="/customerBoard.ing?articleId=${customerBoardSearch.articleId}">
                    ${customerBoardSearch.title}</a></td>
            <td>${customerBoardSearch.writingTime}</td>
            <td>${customerBoardSearch.readCount}</td>
        </tr>
        </tbody>
    </c:forEach>
</table>
<br/>

<div class="col-md-12 center text-center">
    <span class="left" id="total_reg"></span>
    <ul class="pagination pager" id="myPager"></ul>
</div>
<%--페이지 넘버--%>


<a href="/customerBoardList.ing">글목록으로 돌아가기</a><br/><br/>

</body>
</html>
