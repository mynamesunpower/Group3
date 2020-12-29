<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-26
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>전체 주문 내역</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../../../js/order.js"></script>
</head>
<body><br/>
<div class="row">
            <a id = "order_list" class="loadAjax col s2" href="/purchase/orderList.ing?state=결제완료">주문내역 확인  </a></li>
            <a id = "cancel_list" class="loadAjax col s2" href="/purchase/orderList.ing?state=결제취소">주문취소 확인</a></li>
</div>

    <div class="row">
        <table class="centered">
            <thead>
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>주문인</th>
                <th>받는사람</th>
                <th>결제금액</th>
                <%--TODO 취소와 구매목록 누를때마다 그에 맞게 변경해줄것--%>
                <th id="stateDay">구매일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="orderList" items="${orderList}">
                <c:forEach var="list" items="${orderList}">
                    <tr>
                        <td><a class="loadAjax"
                               href="/purchase/detailOrderList.ing?orderNumber=${list.orderNumber}&state=${list.state}">${list.orderNumber}</a>
                        </td>
                        <td>${list.bookVO.title}</td>
                        <td>${list.memberVO.name}</td>
                        <td>${list.receiver}</td>
                        <td><fmt:formatNumber value="${list.totalPrice}" pattern="#,###"/>원</td>

                        <%----%>
                        <c:choose>
                            <c:when test="${list.cancelDate == null}">
                                <td>${list.purchaseDate}</td>
                            </c:when>
                            <c:otherwise>
                                <td>${list.cancelDate}</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
        <br/><br/><br/>
        <a href="/start.ing">메인 화면으로</a>
    </div>

</body>
</html>
