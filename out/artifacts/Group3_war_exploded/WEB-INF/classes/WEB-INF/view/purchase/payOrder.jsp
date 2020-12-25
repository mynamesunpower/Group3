<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-22
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>상품 결제</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript" src="../../../js/order.js"></script>
    <script type="text/javascript" src="../../../js/paymentMethod.js"></script>
</head>
<body>
<h6>결제 내역 확인</h6><br/>
<form>
    <%--결제 후 필요한 항목들 hidden으로 넘겨줌--%>
    <input type="hidden" id="name" name="name" value="${sessionScope.memberName}">
        <input type="hidden" id="tel", name="tel" value="${sessionScope.memberTel}">
        <input type="hidden" id="email" name="email" value="${sessionScope.memberEmail}"/>
        <input type="hidden" id="domain" name="domain" value="${sessionScope.domain}"/>
        <input type="hidden" id="addr1" name="addr1" value="${memberVO.addr1}">
        <input type="hidden" id="addr1" name="addr2" value="${memberVO.addr2}">
        <input type="hidden" id="addr1" name="addr3" value="${memberVO.addr3}">
        <input type="hidden" id="bookTitle" value="${bookTitle}">
        <input type="hidden" id="bookQuantity" value="${bookQuantity}">
        <input type="hidden" id="reciever" value="${receiver}">
        <input type="hidden" id="totalPrice" name="totalPrice" value="${purchaseVO.totalPrice}">

        <div class="row">
        <table id="priceTable">
            <tr>
                <th>주문상품 금액</th>
                <c:set var="price" value="${purchaseVO.totalPrice}"/>   <!-- 총 결제 금액 -->
                <td colspan="2"><fmt:formatNumber value="${purchaseVO.totalPrice}" pattern="#,###"/>원</td>
            </tr>
            <tr>
                <th>쿠폰 할인금액</th>
                <td>0원</td>
                <td>
                    <button class="returnCart cols s2 waves-effect waves-light btn-small white black-text">
                        쿠폰 사용
                    </button>
                </td>
            </tr>
            <tr>
                <th>포인트 사용금액</th>
                <td>0원</td>
                <td>
                    <button class="returnCart cols s2 waves-effect waves-light btn-small white black-text">
                        포인트 확인
                    </button>
                </td>
            </tr>
            <tr>
                <th>총 결제금액</th>
                <td colspan="2"><fmt:formatNumber value="${price}" pattern="#,###"/>원</td>
            </tr>
        </table>
    </div>
    <br/>

    <div class="row">
        <h6>결제 수단선택</h6><br/>
        <table id="paymentTable">
            <tr>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value="card" checked="checked"><span>신용카드</span></label></td>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value="account"><span>계좌이체</span></label></td>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value=""><span>무통장 입금</span></label></td>
            </tr>
            <tr>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value="toss"><span>toss</span></label></td>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value="kakaoPay"><span>kakao pay</span></label></td>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value="payco"><span>payco</span></label></td>
            </tr>
            <tr>
                <td><label><input type="checkbox" class="paymentMethod" name="paymentMethod" value="mobile"><span>핸드폰 결제</span></label></td>
            </tr>
        </table>
    </div>
    <button type="button" id="doPay" class="cols s2 waves-effect waves-light btn-small white black-text">
        결제하기
</button>

</form>
</body>
</html>
