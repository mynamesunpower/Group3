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

<h5>전체 도서 목록</h5>
<div class="row"></div>
<%--
<table border="1">
    <tr>
        <th bgcolor="#e9967a">ISBN</th>
        <th bgcolor="#e9967a">출판사번호</th>
        <th bgcolor="#e9967a">제목</th>
        <th bgcolor="#e9967a">저자</th>
        <th bgcolor="#e9967a">장르</th>
        <th bgcolor="#e9967a">총페이지</th>
        <th bgcolor="#e9967a">가격</th>
        <th bgcolor="#e9967a">재고</th>
        <th bgcolor="#e9967a">출판날짜</th>
        <th bgcolor="#e9967a">내용</th>
        <th bgcolor="#e9967a">키워드</th>
    </tr>--%>


<c:forEach items="${bookList}" var="book">
    <div class="row">
        <div id="imgDivision" class="col s4 center-align">
            <a class="loadAjax" href="viewBook.ing?isbn=${book.isbn}"><img src="../../../imgs/book/${book.isbn}.PNG"></a>
        </div>
        <div class="col s8">
            <div class="leftcol left-align"><h4>${book.title}</h4></div>
            <div class="leftcol left-align"><h5>${book.author}</h5></div>
            <div class="leftcol left-align"><a class="loadAjax" href="selectBook.ing?isbn=${book.isbn}">ISBN: ${book.isbn}</a></div>
            <div class="leftcol left-align">장르: ${book.genre}</div>
            <div class="leftcol left-align">출간일: ${book.publicationDate}</div>
            <div class="leftcol left-align">${book.totalPage}페이지 / ${book.publisherVO.publisherName}  / <span class="right-align">${book.price}원</span></div>
            <div class="row"></div>
            <div class="left-align">키워드: ${book.keyword}</div>
            <div class="row"></div>

            <a class="btn right-align" href="">장바구니에 추가</a>
            <a class="btn right-align" href="">바로 구매</a>
        </div>
    </div>
</c:forEach>

</body>
</html>