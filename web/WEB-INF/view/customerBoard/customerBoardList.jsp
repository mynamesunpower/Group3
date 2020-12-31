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

    <!--Import materialize.css pagination페이징-->
    <link rel="stylesheet" href="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/css/materialize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"></script>


    <script>
        $(document).ready(function () {
            $('#data-container').pageMe({
                pagerSelector: '#myPager',
                activeColor: 'blue',
                prevText: 'Anterior',
                nextText: 'Siguiente',
                showPrevNext: true,
                hidePageNumbers: false,
                perPage: 10
            });  //페이징관련 스크립트.


            $(document).on('click', '#customerSearch', function (evt) {
                evt.stopPropagation();
                evt.preventDefault();

                let content = $("#content");
                let query = $('#customerSearchForm').serialize();
                if (!$("label[for='title']").hasClass("active")) {
                    alert("검색어를 먼저 입력하세요.");
                    return;
                }
                $.ajax({
                    type : 'post',
                    url : 'customerBoard/customerBoardSearch.ing',
                    data : query,
                    success : function (data) {
                        content.children().remove();
                        content.html(data);
                    },
                    error : function (err) {
                        console.log("목록 불러오기 실패"+err);
                    }
                })
            })

        });

        function fnGoPaging(page) {

            let content = $("#content");

            $.ajax({
                url : "http://localhost:8080/customerBoard/customerBoardList.ing?page="+page,
                success : function (data) {
                    console.log(data);
                    content.children().remove();
                    content.html(data);
                },
                error : function (err) {
                    console.log(err);
                }
            })

        }
    </script>

</head>
<body>
<h1>고객문의 게시판</h1><br/>
<div id="data-container">
    <table cellpadding="1" cellspacing="1" class="table table-hover" id="List">
        <thead>
        <tr>
            <th data-field="ARTICLE_ID">글번호</th>
            <th data-field="TITLE">제목</th>
            <th data-field="WRITING_TIME">작성일</th>
            <th data-field="READ_COUNT">조회수</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${pagingList}" var="list" begin="0" end="${pagingList.size()}" varStatus="status">
            <tr>
                <td>${pagingList.get(status.index).get("ARTICLE_ID")}</td>
                <td><a class="loadAjax" href="customerBoard/customerBoard.ing?articleId=${pagingList.get(status.index).get("ARTICLE_ID")}">
                        ${pagingList.get(status.index).get("TITLE")}</a></td>
                <td>${pagingList.get(status.index).get("WRITING_TIME")}</td>
                <td>${pagingList.get(status.index).get("READ_COUNT")}</td>
            </tr>
        </c:forEach>
        <%--페이지 넘버--%>
        </tbody>
    </table>
        <div class="page-number">
            <tr>
                <c:if test="${resultMap.pageGroup > 1}">
                        <span>
                            <a href="javascript:fnGoPaging(<c:out value="${resultMap.previousPage}"/>)"> << </a>
                        </span>
                </c:if>

                <c:forEach var="i" begin="${resultMap.startPage}"
                           end="${resultMap.endPage > resultMap.total? resultMap.total : resultMap.endPage}"
                           varStatus="status">
                    <c:choose>
                        <c:when test="${resultMap.page eq i}">
                                <span class="active">
                                    <a href="javascript:fnGoPaging(${i});">${i}</a>
                                </span>
                        </c:when>
                        <c:otherwise>
                                <span>
                                    <a href="javascript:fnGoPaging(${i});">${i}</a>
                                </span>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${resultMap.nextPage <= resultMap.total}">
                        <span>
                            <a href="javascript:fnGoPaging(<c:out value='${resultMap.nextPage}'/>)"> >> </a>
                        </span>
                </c:if>
            </tr>
        </div>
</div>



<%--회원로그인 해야만 글쓰기 버튼이 보임.--%>
<c:choose>
    <c:when test="${sessionScope.memberId eq null}">
    </c:when>
    <c:when test="${sessionScope.memberName ne null}">
        <a class="loadAjax btn" href="customerBoard/customerBoardInsert.ing">글쓰기</a>
    </c:when>
</c:choose>

<form id="customerSearchForm" action="customerBoard/customerBoardSearch.ing">
    <div class="row">
        <div class="input-field col s4">
            <%-- 검색창 필드 크기 조정.--%>
            <label for="title">글제목을 입력해주세요.</label>
            <input type="text" id="title" name="title" value="">
            <%--<input type="submit" value="검색">--%>
            <a class="loadAjax btn" id="customerSearch">검색</a>
        </div>
    </div>
</form>


</body>
</html>
