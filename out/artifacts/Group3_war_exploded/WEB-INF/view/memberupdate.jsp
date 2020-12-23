<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-22
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.

 input태그 'readonly' 는 form 전송이 가능하지만,
'disabled' 는 form 전송시 값이 전달되지 않는다.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원정보수정</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../js/memberupdate.js"></script>
<%--<!-- Compiled and minified CSS -->--%>
<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">--%>
<%--<!-- Compiled and minified JavaScript -->--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>--%>
    <body>
    <form action="updateok.ing" name="userinput" id="userinput">
        아이디       :  <input type="text" name="id" id="id" value="${sessionScope.id}" readonly><br/><br/>
        비밀번호     :  <input type="password" name="pass" id="pass"><br/><br/>
        비밀번호확인 :  <input type="password" name="pass2" id="pass2"><br/><br/>
        이름         :    <input type="text" name="name" id="name"  value="${sessionScope.name}"><br/><br/>
            전화번호     :    <input type="select" name="tel" id="tel" placeholder="-는 빼고 입력해주세요"  value="${sessionScope.tel}"><br/><br/>

            이메일       :    <input type="text" name="email" id="email"  value="${sessionScope.email}">
            <input type="text"  id="domain" name="domain" class="box" value="${sessionScope.email}">

            <select id="emailSelection" name="emailSelection">
                <option value="1" selected="selected">직접입력</option>
                <option value="@gmail.com">@gmail.com</option>
                <option value="@naver.com">@naver.com</option>
                <option value="@nate.net">@nate.com</option>
                <option value="@hanmail.net">@hanmail.net</option>
                <option value="@daum.net">@daum.net</option>
        </select>


        <br/><br/><hr>
        <h1>주소 수정</h1>
        주소<br/>
        <div class="form-group">
            <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호"
                   name="addr1" id="addr1" type="text" readonly="readonly" value="${sessionScope.addr1}">
            <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
        </div>
        <div class="form-group">
            <input class="form-control" style="top: 5px;" placeholder="도로명 주소"
                   name="addr2" id="addr2" type="text" readonly="readonly"  value="${sessionScope.addr2}"/>
        </div>
        <div class="form-group">
            <input class="form-control" placeholder="상세주소"
                   name="addr3" id="addr3" type="text"  value="${sessionScope.addr3}" />
        </div>
        <br/><br/>

        등급   : <input type="text" name="grade" id="grade" value="${sessionScope.grade}" readonly><br/><br/>
        포인트 : <input type="text" name="point" id="point" value="${sessionScope.point}" readonly><br/><br/>

        <input type="submit" name="submit" id="submit" value="수정완료">



</body>
</html>
