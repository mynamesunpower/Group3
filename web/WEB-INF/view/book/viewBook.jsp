<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>책 상세정보</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>

<body>
<div class="row">
    <div class="col s6 offset-s3 center-align">
        <img src="../../imgs/book/${viewBook.isbn}.PNG"/><br/><br/>
        <a class="loadAjax" href="genrebookList.ing?genre=${viewBook.genre}">${viewBook.genre}</a>

        <br/><br/><br/>
        <h4>${viewBook.title}</h4>
        <h6 class="no-padding">${viewBook.author}</h6>
        <br/><br/>
        <div class="row">
            <div class="col s2 left-align no-padding">
                출간일<br/>
                출판사<br/>
                페이지<br/>
                키워드<br/>
            </div>
            <div class="col s5 left-align no-padding">
                ${viewBook.publicationDate}<br/>
                ${viewBook.publisherNumber}<br/>
                ${viewBook.totalPage}p<br/>
                ${viewBook.keyword}<br/>
            </div>
        </div>
        <hr/>
        <div class="left-align">
            <h5>내용</h5><br/>
            <p class="viewBookContent">${viewBook.content}</p>
        </div>
        <br/>
        <div class="row">
            <c:if test="${sessionScope.memberName ne null}">
                <a class="loadAjax btn" href="/cart/addCart.ing?isbn=${viewBook.isbn}">장바구니에 추가</a>
            </c:if>
            <a class="loadAjax btn" href="/purchase/orderBook.ing?isbn=${viewBook.isbn}">바로 구매하기</a>
        </div>
    </div>
</div>
</body>
</html>
