<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-22
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>주문</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/j1s/materialize.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="../../../js/order.js"></script>

</head>
<body>
<div id="cart" class="row">
    <table id="orderCartTable" class="centerd col s9">
        <thead>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
        </tr>
        </thead>
        <!-- 주문 요청 책 -->
        <c:set var="price" value="0"/> <!-- 총 금액 초기회를 위해 -->
        <input type="hidden" id="bookTitle" value="${title}"/>
        <c:choose>
            <c:when test="${cartList ne null}">
                <input type="hidden" id="bookKind" value="${fn:length(cartList)}"/>
                <c:forEach var="list" items="${cartList}">
                    <c:forEach var="cart" items="${list}">
                        <tr>
                            <td>${cart.bookVO.title}</td>
                                <%--가격에 천단위 가격으로 formatting--%>
                            <td><fmt:formatNumber value="${cart.bookVO.price * cart.quantity}" pattern="#,###"/>원</td>

                            <td>${cart.quantity}</td>
                        </tr>
                        <c:set var="price" value="${price+cart.bookVO.price * cart.quantity}"/>
                    </c:forEach>
                    <c:set var="totalPrice" value="${price}"/>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <input type="hidden" id="bookKind" value="1"/>
                <c:choose>
                    <c:when test="${cart==null}">
                        <tr>
                            <td>${bookVO.title}</td>
                                <%--가격에 천단위 가격으로 formatting--%>
                            <td><fmt:formatNumber value="${bookVO.price}" pattern="#,###"/>원</td>
                            <td>1</td>
                        </tr>
                        <c:set var="totalPrice" value="${bookVO.price}"/>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="cart" items="${cart}">
                            <tr>
                                <td>${cart.bookVO.title}</td>
                                    <%--가격에 천단위 가격으로 formatting--%>
                                <td><fmt:formatNumber value="${cart.bookVO.price * cart.quantity}" pattern="#,###"/>원</td>
                                <td>${cart.quantity}</td>
                            </tr>
                            <c:set var="totalPrice" value="${price+cart.bookVO.price * cart.quantity}"/>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </table>
</div>
<br/>
<form id="orderForm" method="post">
    <div class="row">
        <input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}">
        <div id="totalPrice" class="col s3">총 금액 : <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</div>

        <%-- TODO 회원등급에 따라 적립 비율 다르게 해주기--%>
        <input type="hidden" id="point" name="point" value="${totalPrice * 0.05}">
        <div class="col s8">적립예정 포인트 : <fmt:formatNumber value="${totalPrice * 0.05}" pattern="#,###"/> Point</div>
    </div>
    <div class="row">
        <div class="col s4 offset-s6">
            <a href="/cart/cartList.ing" id="returnCart" class="loadAjax waves-effect waves-light btn-small white black-text">
                <i class="material-icons left">shopping_cart</i>장바구니로
            </a>
        </div>
    </div>
    <br/><br/>

    <span>배송지 정보 입력 (* 필수입력 사항)</span><br/><br/>
    <div class="row">
        <table id="deliveredTable" class="hilight centerd">
            <tr>
                <th><span>*</span>주문인</th>
                <td>${sessionScope.memberName}</td>
            </tr>
            <tr>
                <th><span>*</span>받는사람</th>
                <td><input type="text" id="receiver" name="receiver" value="${sessionScope.memberName}"></td>
            </tr>
            <tr>
                <th rowspan="3"><span>*</span>주소</th>
                <td><input type="text" id="addr1" name="addr1" value="${sessionScope.memberAddr1}" placeholder="우편번호"></td>
                <td>
                    <%--TODO 시간나면 JQUERY 형식으로 맞추기--%>
                    <button type="button" id="findAddress"
                            class="cols s2 waves-effect waves-light btn-small white black-text"
                            value="주소찾기" onclick="execPostCode();">주소찾기
                    </button>
                </td>
            </tr>
            <tr>
                <td><input type="text" id="addr2" name="addr2" value="${sessionScope.memberAddr2}" placeholder="주소"></td>
            </tr>
            <tr>
                <td><input type="text" id="addr3" name="addr3" value="${sessionScope.memberAddr3}" placeholder="상세주소"></td>
            </tr>
            <tr>
                <th><span>*</span>전화번호</th>
                <td>${sessionScope.memberTel}</td>
            </tr>
        </table>
    </div>
    <div class="row">
        <div class="col s4 offset-s6">
            <button type="button" id="payOrder" class="waves-effect waves-light btn-small white black-text"><i
                    class="material-icons left">credit_card</i>결제하기
            </button>
        </div>
    </div>
</form>
</body>
</html>
