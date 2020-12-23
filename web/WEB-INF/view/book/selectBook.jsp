<%--
  Created by IntelliJ IDEA.
  User: hyeongmin
  Date: 2020-12-19
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>selectBook</title>
</head>
<body>
<h2>도서정보</h2><hr/>

<!--도서목록보기-->
<a class="loadAjax" href="bookList.ing">도서목록</a>&nbsp;&nbsp;&nbsp;

<!--도서삭제하기-->
<a class="loadAjax" href="deleteBook_success.ing?isbn=${selectBook.isbn}">도서삭제</a>
<br/>
<br/>

<!--도서정보 업데이트하기-->
<form action="updateBook.ing" method="post">
    <input name="isbn" type="hidden" value="${selectBook.isbn}" />
    <table border="2" >
        <tr>
            <td bgcolor="#ffebcd" width="70">ISBN</td>
            <td align="left">${selectBook.isbn}</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">출판사번호</td>
            <td align="left">${selectBook.publisherNumber}</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">제목</td>
            <td align="left">${selectBook.title}</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">저자</td>
            <td align="left">${selectBook.author}</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">장르</td>
            <td align="left">${selectBook.genre }</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">총페이지</td>
            <td align="left">${selectBook.totalPage}</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">가격</td>
            <td align="left"><input type="text" name="price" value="${selectBook.price }"></td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">재고</td>
            <td align="left"><input name="title" type="text" value="${selectBook.stock }"></td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">출판날짜</td>
            <td align="left">${selectBook.publicationDate }</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">내용</td>
            <td align="left"><textarea name="content" cols="40" rows="10">${selectBook.content }</textarea></td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">키워드</td>
            <td align="left">${selectBook.keyword}</td>
        </tr>
        <tr>
            <td bgcolor="#ffebcd">책 이미지</td>
            <td align="left"><input name="title" type="text" value="${selectBook.bookimage}"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="도서 정보수정" /></td>
        </tr>
    </table>
</form>
<hr/>


</body>
</html>
