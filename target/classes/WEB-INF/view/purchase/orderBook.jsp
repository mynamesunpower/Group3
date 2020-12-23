<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-22
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<head>
    <title>주문</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/j1s/materialize.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="../../../js/order.js"></script>

</head>
<body>
<form>
    <div id="cart" class="row">
        <table id="orderCartTable" class="hilight centerd">
            <thead>
            <tr>
                <th>상품명</th>
                <th>가격 (원)</th>
                <th>수량</th>
            </tr>
            <!-- 주문 요청 책 -->
        <c:forEach var="cart" items="${cart}">
            <tr>
                <td>${cart.bookVO.title}</td>
                <td>${cart.bookVO.price * cart.quantity}</td>
                <td>${cart.quantity}</td>
            </tr>
        </c:forEach>
            </thead>
        </table>
    </div>
    <div class="row">
        <div class="col s3">총 금액 : </div>
        <div class="col s9">적립예정금액 : </div>
    </div>
    <div class="row">
        <div class="col s4 offset-s8">
            <button class="returnCart cols s2 waves-effect waves-light btn-small white black-text" value="장바구니">
                <i class="material-icons left">shopping_cart</i>장바구니로</button>
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
                <td><input type="text"></td>
            </tr>
            <tr>
                <th rowspan="3"><span>*</span>주소</th>
                <td><input type="text" name="addr1"  placeholder="우편번호"></td>
                <td>
                    <button type="button" id = "findAddress"
                            class="cols s2 waves-effect waves-light btn-small white black-text"
                            value="주소찾기" onclick="execPostCode();">주소찾기
                    </button>
                </td>
            </tr>
            <tr>
                <td><input type="text" name="addr2" placeholder="주소"></td>
            </tr>
            <tr>
                <td><input type="text" name="addr3" placeholder="상세주소"></td>
            </tr>
            <tr>
                <th><span>*</span>전화번호</th>
                <td><input type="text" name="tel" value="${sessionScope.memberTel}" ></td>
            </tr>
        </table>
    </div>
    <div class="row">
        <button type="button" class="col s4 offset-s8 waves-effect waves-light btn-small white black-text"><i
                class="material-icons left">credit_card</i>결제하기
        </button>
    </div>
</form>
</body>
</html>
