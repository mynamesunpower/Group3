
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
</head>
<body>

    <header>
        <span class="button">
            <input type="button" id="listButton" />
        </span>
        <span class="header_text">Booktrain.ing</span>
        <span class="button">
            <input type="button" id="cartButton" />
        </span>
        <span class="button">
            <input type="button" id="searchButton"/>
        </span>
        <span class="button">
            <input type="button" id="memberButton"/>
        </span>
    </header>

    <div class="content">
        <br/>
        <br/>
        <br/>


        <a href="insertBook.ing">책 입력하기</a> <br/>
        <a href="bookList.ing">책 목록보기</a> <br/>
        <%--<a href="deleteBook.ing">책 삭제하기</a> <br/>--%>
        <%--<a href="modifyBook.ing">책 수정하기</a> <br/>--%>

        <a href="publisher/insertPublisher.ing">출판사 입력하기</a> <br/>
        <a href="publisher/listPublisher.ing">출판사 목록보기</a> <br/>
        <%--<a href="publisher/modifyPublisher.ing">출판사 수정하기</a> <br/>
        <a href="publisher/deletePublisher.ing">출판사 삭제하기</a> <br/>--%>
    </div>



</body>
</html>
