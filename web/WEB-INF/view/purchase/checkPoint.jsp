<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-30
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>포인트 확인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript" src="../../../js/order.js"></script>
    <script type="text/javascript" src="../../../js/checkPoint.js"></script>

</head>
<body>
<div class="row">
    <table>
        <tr>
            <th>내 포인트</th>
            <td id="member_point">${memberVO.point} Point</td>
        </tr>
        <tr>
            <th>사용 포인트</th>
            <td><input type="" id="use_point"></td>
            <td id="alert_point"></td>
        </tr>
        <tr>
            <th colspan="2">※ 포인트는 2천점부터 사용가능합니다.</th>
        </tr>
    </table>
    <button id="use_pointBtn" class="check_point cols s2 waves-effect waves-light btn-small white black-text">
        사용
    </button>
    <button id="cancel_point" class="cancel_point cols s2 waves-effect waves-light btn-small white black-text">
        취소
    </button>
</div>
</body>
</html>
