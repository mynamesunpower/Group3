<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-27
  Time: 오후 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>주문 상세</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../../../js/order.js" type="text/javascript"></script>
</head>
<body><br/>
<div class="row">
    <table class="centered col s10">
        <tr>
            <th>상품명</th>
        </tr>
        <table>
            <c:forEach var="detailOrder_list" items="${detailOrder_List}">
                <tr>
                    <th>
                        <a href="">${detailOrder_list.bookVO.title}</a> ${detailOrder_list.purchaseBookVO.quantity}권
                    </th>
                    <td>
                        <c:if test="${purchaseInfo.cancelDate == null}">
                            <a href="/hello.ing" id="write_review"
                               class="col s2 offset-s9 waves-effect waves-light btn-small white black-text">리뷰쓰기
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </table>
    <p>주문인 : ${sessionScope.memberName}</p>
    <p>받는사람 : ${purchaseInfo.receiver}</p>
    <p>배송지 : ${purchaseInfo.shipAddress}</p>
    <p>결제금액 : <fmt:formatNumber value="${purchaseInfo.totalPrice}" pattern="#,###"/>원</p>
    <p>구매일 : ${purchaseInfo.purchaseDate}</p>
    <%--취소날짜가 있다면 보이게 설정--%>
    <c:if test="${purchaseInfo.cancelDate != null}">
        <p>취소일자 : ${purchaseInfo.cancelDate}</p>
    </c:if>
    <br/><br/>

    <%--결제 취소상세화면에서는 안보임--%>
    <c:if test="${purchaseInfo.cancelDate == null}">
        <form action="/purchase/cancelOrder.ing" method="post">
            <input type="hidden" id="orderNumber" name="orderNumber" value="${purchaseInfo.orderNumber}">
            <button type="submit" id="cancel_order"
                    class="col s2 offset-s9 waves-effect waves-light btn-small white black-text">결제취소
            </button>
        </form>
    </c:if>
</div>
</body>
</html>
