<%--
  Created by IntelliJ IDEA.
  User: hyeongmin
  Date: 2020-12-19
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>도서목록</title>
</head>
<body>

<h5>${result} 건의 검색 결과</h5>
<h6>검색어 : ${param.keyword}</h6>
<div class="row"></div>

<c:forEach items="${bookList}" var="book">
    <div class="row">
        <%--<div class="col s4 center-align">--%>
            <%--<img src="../../../imgs/book/2222222222222.jpg">--%>
        <%--</div>--%>
        <div class="col s8">
            <div class="leftcol left-align"><h4>${book.title}</h4></div>
            <div class="leftcol left-align"><h5>${book.author}</h5></div>
            <div class="leftcol left-align"><a class="loadAjax" href="selectBook.ing?isbn=${book.isbn}">ISBN: ${book.isbn}</a></div>
            <div class="leftcol left-align">${book.genre} / ${book.publicationDate}</div>
            <div class="leftcol left-align">${book.totalPage}페이지 / ${book.publisherNumber} / <span class="right-align">${book.price}</span></div>
            <div class="left-align">내용: ${book.content}</div>
            <div class="left-align">키워드: ${book.keyword}</div>
            <div class="row"></div>

            <a class="btn right-align" href="">장바구니에 추가</a>
            <a class="btn right-align" href="">바로 구매</a>
        </div>
    </div>
</c:forEach>

</body>
</html>
