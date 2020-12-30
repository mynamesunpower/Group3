<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-26
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디찾기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src=../../../js/memberIdFind.js type="text/javascript"></script>
</head>

<h5>회원 아이디 찾기</h5>
<h6>가입하신 전화번호와 이메일을 입력하세요.</h6>
<form id="memberIdFind" action="memberIdFindOk.ing">
    <div class="row">
        <div class="input-field col s6">
            전화번호: <input type="text" name="tel" id="tel2" placeholder="-는 빼고 입력해주세요">
            <span class="valiText" id="telCheckResult"></span>
        </div>
    </div>
    <div class="row">
        <div class="col s4">
            이메일: <input type="text" name="email" id="email2" value="">
            <span class="valiText" id="valiEmail"></span>
        </div>
        <div class="col s4">
            @부터 입력해주세요. <input type="text"  id="domain2" name="domain" class="box" value="">
        </div>
        <div class="col s4">
            <label>도메인</label>
            <select class="browser-default" id="emailSelection2" name="emailSelection">
                <option value="1" selected>직접입력</option>
                <option value="@gmail.com">@gmail.com</option>
                <option value="@naver.com">@naver.com</option>
                <option value="@nate.net">@nate.com</option>
                <option value="@hanmail.net">@hanmail.net</option>
                <option value="@daum.net">@daum.net</option>
            </select>
        </div>
    </div>
    <input id="findIdBtn" class="btn" type="button" value="ID 찾기">
</form>
</body>
</html>
