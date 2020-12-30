<%--
  Created by IntelliJ IDEA.
  User: Yonggwan
  Date: 2020-12-29
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<head>
    <title>리뷰 보기</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../../../css/review.css" rel="stylesheet" type="text/css">
    <!-- Compiled and minified JavaScript -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>
<div class="row">
    <table>
        <c:forEach var="review" items="${reviewList}">
            <c:set var="score" value="${review.score}"></c:set>
            <tr>
                <td>${review.memberVO.name}</td>
                <td>평점 : ${ratingOptions.get(score)}</td>
                <td>${review.content}</td>
                <td>${review.writingTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>