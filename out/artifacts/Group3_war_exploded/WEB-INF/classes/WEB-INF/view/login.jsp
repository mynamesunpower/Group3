<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Booktrain.ing</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style type="text/css">
        #login_body {
            position: absolute;
            left: 50%;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <%--sweetalert css 경고창
    이쁜 alert창인데 한페이지에 맨 마지막에 만든 swal만 작동되는듯(?) --%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
$(document).ready(function () {
    $('.tabs').tabs();
});
    </script>

</head>
<body id="login_body">
<div class="row"></div>

<div class="row">
</div>
<div class="row">
    <div class="col s8 offset-s2">
        <ul class="tabs">

            <li class="tab col s4 offset-s2">
                <a href="#test1" font-size="14px">회원 로그인</a></li>

            <li class="tab col s4">
                <a href="#test2" font-size="14px">비회원 주문확인</a></li>
        </ul>
    </div>


    <div id="test1" class="col s8 offset-s2">
        <%-- 회원 로그인확인 form --%>
        <div class="row">
            <div class="col s8 offset-s2">
                <form action="memberlogin.ing" name="memberlogin" id="memberlogin">
                    <input type="text" id="id" name="id" placeholder="ID 입력">
                    <input type="password" id="pass" name="password" placeholder="비밀번호 입력">
                    <div class="row center-align">
                        <a id="memlogin" class="waves-effect waves-light btn">로그인</a>
                        <a id="memjoin" name="memjoin" class="waves-effect waves-light btn memjoin">회원가입</a>
                        <a id="memsearchid" href="/memberIdFind.ing" name="memsearchid" class="loadAjax waves-effect waves-light btn">아이디 찾기</a>
                        <a id="memsearchpass" href="/memberPassFind.ing" name="memsearchpass" class="loadAjax waves-effect waves-light btn">비밀번호 찾기</a>
                    </div>
                </form>
            </div>
        </div>
    </div> <!-- 회원로그인 탭 -->

    <div id="test2" class="col s8 offset-s2">
        <div class="row">
            <br/> 비회원 주문과정에 입력한 전화번호와 비밀번호를 입력합니다.
            <br/> 입력 예시) 031-2222-2222 / 123456
            <div class="col s8 offset-s2">
                <input type="text" id="tel" name="tel" placeholder="전화번호 입력">
                <input type="password" id="nonmempassword" name="nonmempassword" placeholder="비밀번호 입력"><br/>
                <a id="nonmemlogin" class="waves-effect waves-light btn">비회원 주문찾기</a>
                <a id="nonmemsearchpass" name="nonmemsearchpass" class="waves-effect waves-light btn">비밀번호 찾기</a>
            </div>
        </div>
    </div><!-- 비회원로그인 탭 -->

</div><!-- 마테리얼 라이즈 탭 완성 -->


</body>
</html>
