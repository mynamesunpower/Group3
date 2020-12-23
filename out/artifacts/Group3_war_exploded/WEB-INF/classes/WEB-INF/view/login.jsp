
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Booktrain.ing</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../../js/login.js" type="text/javascript"></script>

</head>
<body>
    <div class="row"></div>
    <div class="row"></div>
    <div class="row">
        <div class="col s12">
            <ul class="tabs">
                <li class="tab col s6">
                    <a href="#test1">회원로그인</a></li>

                <li class="tab col s6">
                    <a href="#test2">비회원주문확인</a></li>
            </ul>
        </div>

                <div id="test1" class="col s12">
                    <%-- 회원 로그인확인 form --%>
                    <form action="memberlogin.ing" name="memberlogin" id="memberlogin">
                        <input type="text" id="id" name="id" placeholder="ID 입력">
                        <input type="text" id="pass" name="pass" placeholder="비밀번호 입력"><br/>
                        <input type="button" id="memlogin" name="memlogin" value="로그인">
                    </form>

                    <input type="button" id="memsearchid" name="memsearchid" value="아이디찾기">
                    <input type="button" id="memsearchpass" name="memsearchpass" value="비밀번호찾기"><br/><br/>
                    <input type="button" id="memjoin" class="memjoin" name="memjoin" value="회원가입"/>
                </div><!-- 회원로그인 탭 -->


        <div id="test2" class="col s12">
            <input type="text" id="tel" name="tel" placeholder="전화번호 입력">
            <input type="text" id="nonmempassword" name="nonmempassword" placeholder="비밀번호 입력"><br/>


            <input type="button" id="nonmemsearchpass" name="nonmemsearchpass" value="비밀번호찾기">
        </div><!-- 비회원로그인 탭 -->

    </div><!-- 마테리얼 라이즈 탭 완성 -->


</body>
</html>
