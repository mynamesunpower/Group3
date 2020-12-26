<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-19
  Time: 오후 6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<html>
<head>
    <title>장바구니 목록</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../../js/cart.js"></script>
</head>
<body>
<div id="cart" class="row">
    <table id="cartTable" , class="highlight centered">
        <thead>
        <tr>
            <th></th>
            <th>상품명</th>
            <th>정가</th>
            <th>수량</th>
            <th>합계</th>
            <th></th>
        </tr>
        </thead>
        <c:forEach var="cart" items="${cart}">
            <form class="cartForm" action="" method="get">

                <tr class="bookList">
                    <input type="hidden" class="isbn" name="isbn" value="${cart.isbn}">
                    <td class="checkedBook">
                        <label>
                            <input class="checkedBook" type="checkbox" name="isbn" value="${cart.isbn}" checked="checked" /><span></span>
                        </label>
                    </td>
                    <%--TODO 책 주소 걸어줄것--%>
                    <input type="hidden" id="title" class="title" name="title" value="${cart.bookVO.title}"/>
                    <td class="bookTitle"><a href="">${cart.bookVO.title}</a></td>

                    <input type="hidden" id="price" value="${cart.bookVO.price}">
                    <td class="price"><fmt:formatNumber value="${cart.bookVO.price}" pattern="#,###"/>원</td>

                    <td class="count">
                        <button type="button"
                                class="plusCount waves-effect waves-light btn-small white black-text btn-flat"><i
                                class="material-icons">arrow_drop_up</i></button>
                        <br/>
                        <span class="quantity">${cart.quantity}</span><br/>
                        <button type="button"
                                class="minusCount waves-effect waves-light btn-small white black-text btn-flat"><i
                                class="material-icons">arrow_drop_down</i></button>
                    </td>
                    <td class="totalPrice"><fmt:formatNumber value="${cart.bookVO.price * cart.quantity}" pattern="#,###"/>원</td>
                    <td>
                        <button type="submit" class="orderBook waves-effect waves-light btn-small white black-text">
                            <i class="material-icons left">credit_card</i>
                            주문
                        </button>
                        <br/><br/>
                        <button type="button" class="deleteBook waves-effect waves-light btn-small white black-text">
                            <i class="material-icons left">close</i>
                            삭제
                        </button>
                    </td>
                </tr>
            </form>
        </c:forEach>
    </table>
</div>
<div class="row">
    <div col col s2 offset s2>
        <button type="button" id = "deleteAll" class="waves-effect waves-light btn-small white black-text">전체삭제
        </button>
    </div>
    <br/>
    <div col col s6 offset-s6>
        <button type="button" id="checkedBook_order" class="waves-effect waves-light btn-small white black-text" >선택상품
            주문
        </button>
    </div>
</div>
</body>
</html>
