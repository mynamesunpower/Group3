<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-19
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>출판사 목록 보기</title>
</head>
<body>
<table border="1">
    <tr>
        <th>출판사번호</th>
        <th>이름</th>
        <th>주소</th>
        <th>전화번호</th>
        <th>URL</th>
        <th colspan="2"></th>
    </tr>
    <c:forEach var="publisher" items="${publisherList}">
        <tr>
            <td>${publisher.publisherNumber}</td>
            <td>${publisher.publisherName}</td>
            <td>${publisher.address}</td>
            <td>${publisher.tel}</td>
            <td>${publisher.url}</td>
            <td><a href="modifyPublisher.ing?publisherNumber=${publisher.publisherNumber}">수정</a></td>
            <td><a href="deletePublisher.ing?publisherNumber=${publisher.publisherNumber}">삭제</a></td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="insertPublisher.ing"><input type="button" value="출판사 등록"/></a> <br/>
<a href="../start.ing"><input type="button" value="홈으로"/></a>

</body>
</html>
