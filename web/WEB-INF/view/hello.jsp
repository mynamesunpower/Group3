<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
<%--<<<<<<< HEAD--%>
    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
    <%--<script type="text/javascript" src="../../js/cart.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
    <%--<header>--%>
        <%--<span class="button">--%>
            <%--<input type="button" id="listButton" />--%>
        <%--</span>--%>
        <%--<span class="header_text">Booktrain.ing</span>--%>
        <%--<span class="button">--%>
            <%--<input type="button" id="cartButton" />--%>
            <%--<table id="cartTable"></table>--%>
        <%--</span>--%>
        <%--<span class="button">--%>
            <%--<input type="button" id="searchButton"/>--%>
        <%--</span>--%>
        <%--<span class="button">--%>
            <%--<input type="button" id="memberButton"/>--%>
        <%--</span>--%>
    <%--</header><br/><br/><br/>--%>

<%--<div class="content">--%>
    <%--<a href="/login.ing">로그인</a>--%>
    <%--<br/>--%>
    <%--${sessionScope.name} 님 로그인--%>
    <%--<br/><br/>--%>
    <%--<a href="/showBook.ing?isbn=2222"><img src="../../imgs/book/tobySpring.png" height="200px" width="200px"></a>--%>

    <%--<div class="content">--%>
        <%--<a href="#">책 입력하기</a> <br/>--%>
        <%--<a href="#">책 목록보기</a> <br/>--%>
        <%--<a href="#">책 삭제하기</a> <br/>--%>
        <%--<a href="#">책 수정하기</a> <br/>--%>
        <%--<a href="publisher/insertPublisher.ing">출판사 입력하기</a> <br/>--%>
        <%--<a href="publisher/listPublisher.ing">출판사 목록보기</a> <br/>--%>
        <%--&lt;%&ndash;<a href="publisher/modifyPublisher.ing">출판사 수정하기</a> <br/>--%>
        <%--<a href="publisher/deletePublisher.ing">출판사 삭제하기</a> <br/>&ndash;%&gt;--%>
        <%--<a href="cart/cartList.ing">장바구니 보기</a>--%>
    <%--</div>--%>
<%--</div>--%>
<%--=======--%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.pjax/2.0.1/jquery.pjax.min.js"></script>
    <script src="../../js/index.js" type="text/javascript"></script>
</head>
<body>

<div class="container">
    <div id="header" class="row center-align valign-wrapper">
        <div class="col s1 m1 l1">
            <a data-target="slide-out" class="sidenav-trigger">
                <h5><i class="material-icons black-text">menu</i></h5>
            </a>
        </div>
        <div class="col s1 m1 l1"></div>
        <div class="col s1 m1 l1"></div>
        <div class="col s1 m1 l1"></div>
        <div class="col s4 m4 l4">
            <a id="title" href="" class="black-text"><h5>Booktrain.ing</h5></a>
        </div>
        <div class="col s1 m1 l1"></div>
        <div class="col s1 m1 l1"></div>
        <div class="col s4 m2 l2">
            <h5>
            <a href="" id="btn_cart">
                <i class="material-icons black-text">shopping_cart</i>
            </a>
            <a href="" id="btn_search">
                <i class="material-icons black-text">search</i>
            </a>
            <a href="" id="btn_login">
                <i class="material-icons black-text">person</i>
            </a>
            </h5>
        </div>
    </div>

    <ul id="slide-out" class="sidenav">
        <li class="no-padding">
            <ul class="collapsible expandable">
                <li>
                    <div class="collapsible-header">책 CRUD</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a href="#">책 정보 데이터베이스 입력</a></li>
                            <li><a href="#">책 데이터베이스 목록 보기</a></li>
                            <li><a href="#">책 데이터베이스 수정하기</a></li>
                            <li><a href="#">책 데이터베이스 삭제하기</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header">출판사 CRUD</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a class="loadAjax" href="publisher/insertPublisher.ing">출판사 정보 데이터베이스 입력</a></li>
                            <li><a class="loadAjax" href="publisher/listPublisher.ing">출판사 데이터베이스 목록 보기</a></li>
                            <li><a href="#">출판사 데이터베이스 수정하기</a></li>
                            <li><a href="#">출판사 데이터베이스 삭제하기</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </ul>

    <div class="row center-align">
        <div id="content" class="col s8 offset-s2">
            컨텐츠 부분
        </div>
    </div>
</div> <!-- end of container (마지막 div) -->
<%--=======--%>
    <%--<div class="content">--%>
        <%--<br/>--%>
        <%--<br/>--%>
        <%--<br/>--%>


        <%--<a href="insertBook.ing">책 입력하기</a> <br/>--%>
        <%--<a href="bookList.ing">책 목록보기</a> <br/>--%>
        <%--&lt;%&ndash;<a href="deleteBook.ing">책 삭제하기</a> <br/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="modifyBook.ing">책 수정하기</a> <br/>&ndash;%&gt;--%>

        <%--<a href="publisher/insertPublisher.ing">출판사 입력하기</a> <br/>--%>
        <%--<a href="publisher/listPublisher.ing">출판사 목록보기</a> <br/>--%>
        <%--&lt;%&ndash;<a href="publisher/modifyPublisher.ing">출판사 수정하기</a> <br/>--%>
        <%--<a href="publisher/deletePublisher.ing">출판사 삭제하기</a> <br/>&ndash;%&gt;--%>
    <%--</div>--%>



<%-->>>>>>> origin/hyeongmin--%>
</body>
</html>
