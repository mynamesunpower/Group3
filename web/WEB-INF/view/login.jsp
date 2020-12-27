<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Booktrain.ing</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <%--sweetalert css 경고창
    이쁜 alert창인데 한페이지에 맨 마지막에 만든 swal만 작동되는듯(?) --%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../js/login.js" type="text/javascript"></script>


<body>
<section class="container section" id="services">
    <div class="row">
        <div class="col s12">
            <ul class="tabs">
                <li class="tab col s5">
                    <a href="#test1">회원로그인</a></li>

                <li class="tab col s5">
                    <a href="#test2">비회원주문확인</a></li>
            </ul>
        </div>

        <div id="test1" class="col s5">
            <form action="memberlogin.ing" name="memberlogin" id="memberlogin" method="post">
                <input type="text" id="id" name="id" placeholder="ID 입력"
                       oninvalid="swal('아이디를 입력해주세요')" required>
                <input type="text" id="password" name="password" placeholder="비밀번호 입력" required><br/>

                <button class="btn waves-effect waves-light" type="submit" name="action" id="memlogin" name="memlogin">
                    로그인
                </button>
            </form>
            <%-- 회원 로그인확인 form --%>
            <a class="waves-effect waves-light btn" id="memsearchid" name="memsearchid">아이디찾기</a><br/><br/>
            <a class="waves-effect waves-light btn" id="memsearchpass" name="memsearchpass">비밀번호찾기</a><br/><br/>

            <a class="waves-effect waves-light btn" id="memjoin" name="memjoin">회원가입</a>
        </div><!-- 회원로그인 탭 -->


        <div id="test2" class="col s5">
            <input type="text" id="tel" name="tel" placeholder="전화번호 입력">
            <input type="text" id="nonmempassword" name="nonmempassword" placeholder="비밀번호 입력"><br/>
            <a class="waves-effect waves-light btn" id="nonmemsearchpass" name="nonmemsearchpass">비밀번호찾기</a>
        </div><!-- 비회원로그인 탭 -->

    </div><!-- 마테리얼 라이즈 탭 완성 -->
</section>

</body>
</html>
