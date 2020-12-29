<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-26
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 비밀번호 찾기 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src=../../js/memberIdFind.js type="text/javascript"></script>
</head>
<body>
회원 비밀번호 찾기 페이지<br/>
회원 비밀번호 찾기 페이지<br/>
회원 비밀번호 찾기 페이지<br/>
회원 비밀번호 찾기 페이지<br/>
회원 비밀번호 찾기 페이지<br/>

<form action="memberPassFindOk.ing">
    전화번호 : <input type="text" id="tel" name="tel" placeholder="-를 빼고 입력해주세요."><br/><br/>
    이메일 : <input type="text" name="email" id="email" value="" required>
    <input type="text" id="domain" name="domain" class="box" value="" required>

    <select id="emailSelection" name="emailSelection">
        <option value="1" selected="selected">직접입력</option>
        <option value="@gmail.com">@gmail.com</option>
        <option value="@naver.com">@naver.com</option>
        <option value="@nate.net">@nate.com</option>
        <option value="@hanmail.net">@hanmail.net</option>
        <option value="@daum.net">@daum.net</option>
    </select>

    <input type="submit" value="찾기">
</form>

<a href="/customerBoardUpdate.ing/">글수정</a>

</body>
</html>
