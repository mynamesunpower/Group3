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
</head>
<body>
<div class="row">
    <table>
        <tr>
            <th>사용가능 포인트</th>
            <td>${memberVO.point}</td>
        </tr>
        <tr>
            <th>사용 포인트</th>
            <td><input type="text" id="use_point"></td>
        </tr>
        <tr>
            <th colspan="2">※ 포인트는 2천점부터 사용가능합니다.</th>
        </tr>
    </table>
    <button>사용</button>
    <button>취소</button>
</div>
</body>
</html>
