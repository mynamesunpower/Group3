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

<h5>도서목록</h5>

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
    </tr>
<c:forEach items="${bookList}" var="book">
    <tr>
        <td><a href="selectBook.ing?isbn=${book.isbn}">${book.isbn}</a></td>
        <td>${book.publisherNumber}</td>
        <td>${book.title}</td>
        <td>${book.author}</td>
        <td>${book.genre}</td>
        <td>${book.totalPage}</td>
        <td>${book.price}</td>
        <td>${book.stock}</td>
        <td>${book.publicationDate}</td>
        <td>${book.content}</td>
        <td>${book.keyword}</td>

    </tr>
</c:forEach>

</table>

</body>
</html>
