<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-30
  Time: 오후 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function fnGoPaging(page) {
            location.href = "http://localhost:8080/customerBoard/sunny.ing?page="+page;
        }
    </script>
</head>
<body>


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
        </tbody>
    </table>
</div>

<div class="page-number">
    <c:if test="${resultMap.pageGroup > 1}">
        <li>
            <a href="javascript:fnGoPaging(<c:out value="${resultMap.previousPage}"/>)"> << </a>
        </li>
    </c:if>

    <c:forEach var="i" begin="${resultMap.startPage}"
               end="${resultMap.endPage > resultMap.total? resultMap.total : resultMap.endPage}"
               varStatus="status">
        <c:choose>
            <c:when test="${resultMap.page eq i}">
                <li class="active">
                    <a href="javascript:fnGoPaging(${i});">${i}</a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <a href="javascript:fnGoPaging(${i});">${i}</a>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${resultMap.nextPage <= resultMap.total}">
        <li>
            <a href="javascript:fnGoPaging(<c:out value='${resultMap.nextPage}'/>)"> >> </a>
        </li>
    </c:if>
</div>

</body>
</html>
