
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="../../js/cart.js"></script>
</head>
<body>
    <header>
        <span class="button">
            <input type="button" id="listButton" />
        </span>
        <span class="header_text">Booktrain.ing</span>
        <span class="button">
            <input type="button" id="cartButton" />
            <table id="cartTable"></table>
        </span>
        <span class="button">
            <input type="button" id="searchButton"/>
        </span>
        <span class="button">
            <input type="button" id="memberButton"/>
        </span>
    </header><br/><br/><br/>

<div class="content">
    <a href="/login.ing">로그인</a>
    <br/>
    ${sessionScope.name} 님 로그인
    <br/><br/>
    <a href="/showBook.ing?isbn=2222"><img src="../../imgs/book/tobySpring.png" height="200px" width="200px"></a>

    <div class="content">
        <a href="#">책 입력하기</a> <br/>
        <a href="#">책 목록보기</a> <br/>
        <a href="#">책 삭제하기</a> <br/>
        <a href="#">책 수정하기</a> <br/>
        <a href="publisher/insertPublisher.ing">출판사 입력하기</a> <br/>
        <a href="publisher/listPublisher.ing">출판사 목록보기</a> <br/>
        <%--<a href="publisher/modifyPublisher.ing">출판사 수정하기</a> <br/>
        <a href="publisher/deletePublisher.ing">출판사 삭제하기</a> <br/>--%>
        <a href="/cartList.ing">장바구니 보기</a>
    </div>
</div>
</body>
</html>
