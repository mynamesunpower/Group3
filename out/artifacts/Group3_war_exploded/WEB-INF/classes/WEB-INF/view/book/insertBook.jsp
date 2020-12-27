<%--
  Created by IntelliJ IDEA.
  User: hyeongmin
  Date: 2020-12-18
  Time: 오후 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insertBook.jsp</title>
</head>
<body>

<H5>도서 정보 입력</H5>
<HR/>
<div class="col s8 offset-2 center-align">
<form action="insertBook_success.ing" name="insertBook" id="insertBook">

<table border="2">
    <tr>
        <td bgcolor="#fafad2" width="70">ISBN</td>
        <td><input type="text" name="isbn" id="Isbn"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">출판사번호</td>
        <td><input type="text" name="publisherNumber" id="Publisher_number"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">제목</td>
       <td><input type="text" name="title" id="Title"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">저자</td>
        <td><input type="text" name="author" id="Author"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">장르</td>
        <td><input type="text" name="genre" id="Genre"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">총페이지</td>
        <td><input type="text" name="totalPage" id="Total_page"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">가격</td>
        <td><input type="text" name="price" id="Price"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">재고</td>
        <td><input type="text" name="stock" id="Stock"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">출판날짜</td>
        <td> <input type="date" name="publicationDate" id="Publication_date"></td>
    </tr>
    <tr>
        <td bgcolor="#fafad2">내용</td>
        <td><textarea type="text" cols="40" rows="10" name="content" id="Content"></textarea></td>
    </tr>
    <%--<tr>--%>
        <%--<td bgcolor="#fafad2">이미지</td>--%>
        <%--<td><input type="text" name="bookimage" id="BookImage"></td>--%>
    <%--</tr>--%>
    <tr>
        <td colspan="2" align="center"><input type="submit" value="도서 등록" /></td>
    </tr>
<%--출판사번호: <input type="text" name="Publisher_number" id="Publisher_number"><br/>--%>
<%--장르: <input type="text" name="Genre" id="Genre"><br/>--%>
<%--총페이지:<input type="text" name="Total_page" id="Total_page"><br/>--%>
<%--가격: <input type="text" name="Price" id="Price"><br/>--%>
<%--제목: <input type="text" name="Title" id="Title"><br/>--%>
<%--재고: <input type="text" name="Stock" id="Stock"><br/>--%>
<%--저자: <input type="text" name="Author" id="Author"><br/>--%>
<%--출판날짜: <input type="date" name="Publication_date" id="Publication_date"><br/>--%>
<%--내용: <input type="text" name="Content" id="Content"><br/>--%>
<%--키워드: <input type="text" name="Keyword" id="Keyword"><br/>--%>

<%--<input type="submit" name="confirm" id="confirm" value="도서 등록">--%>
</table>
</form>
</div>

</body>
</html>
