<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>책 상세정보</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/css/materialize.min.css">
    <link href="../../../css/review.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <%--<script src="https://cdn.rawgit.com/Dogfalo/materialize/fc44c862/dist/js/materialize.min.js"></script>--%>
    <script src="https://cdn.rawgit.com/pinzon1992/materialize_table_pagination/f9a8478f/js/pagination.js"></script>
    <script src="../../../js/review.js" type="text/javascript"></script>
    <%--<script type="text/javascript">--%>
    <%--$(function(){--%>
    <%--// 리뷰 페이징 처리--%>
    <%--$('#review_table').pageMe({--%>
    <%--pagerSelector: $('#review_page'),--%>
    <%--activeColor: 'blue',--%>
    <%--prevText:'Anterior',--%>
    <%--nextText:'Siguiente',--%>
    <%--showPrevNext:true,--%>
    <%--hidePageNumbers:false,--%>
    <%--perPage:5--%>
    <%--});--%>

    <%--})// function(){} END--%>
    <%--</script>--%>
</head>

<body>
<div class="row">
    <div class="col s8 offset-s2 center-align">
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
        <hr/>
        <div class="row">
            <c:if test="${sessionScope.memberName ne null}">
                <a class="loadAjax btn" href="/cart/addCart.ing?isbn=${viewBook.isbn}">장바구니에 추가</a>
            </c:if>
            <a class="loadAjax btn" href="/purchase/orderBook.ing?isbn=${viewBook.isbn}">바로 구매하기</a>
        </div>
        <div class="row">
            <table id="review_table">
                <c:forEach var="review" items="${reviewList}">
                    <c:set var="score" value="${review.score}"></c:set>
                    <tr>
                        <td>${review.memberVO.name}</td>
                        <td>${ratingOptions.get(score)}</td>
                        <td>${review.content}</td>
                        <td>${review.writingTime}</td>
                        <c:if test="${review.purchaseVO.memberTel eq sessionScope.memberTel}">
                            <td><a href="/review/deleteReview.ing?isbn=${review.isbn}&reviewNumber=${review.reviewNumber}" class="loadAjax deleteBook waves-effect waves-light btn-small white black-text">
                                <i class="material-icons left">close</i>삭제</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
            <br/>
            <div class="center text-center">
                <span class="left"></span>
                <ul class="pagination pager" id="review_page"></ul>
            </div>
            <c:if test="${sessionScope.memberName != null && reviewVO.orderNumber != null}">
                <p id="star_rate">
                    <a href="#" value="1">★</a>
                    <a href="#" value="2">★</a>
                    <a href="#" value="3">★</a>
                    <a href="#" value="4">★</a>
                    <a href="#" value="5">★</a>
                </p>
                <form action="/review/registReview.ing">
                    <input type="hidden" id="purchaseBook_isbn" value="${reviewVO.isbn}"/>
                    <input type="hidden" id="purchase_orderNumber" value="${reviewVO.orderNumber}"/>
                    <textarea id="review_content" placeholder="리뷰를 작성해주세요 50자이내"></textarea>
                </form>
                <button type="button" id="regist_review">등록</button>
            </c:if>
        </div>

    </div>
</div>
</body>
</html>
