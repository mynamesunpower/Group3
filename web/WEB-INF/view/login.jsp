 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <title>Booktrain.ing</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    </head>
<body>

<section class="container section" id="services">
    <div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3">
                <a href="#test1">회원로그인</a></li>

            <li class="tab col s3">
                <a href="#test2">비회원주문확인</a></li>
    </ul>
    </div>

    <div id="test1" class="col s3">
    <input type="text" id="id" name="id" placeholder="ID 입력">
    <input type="text" id="password1" name="password1" placeholder="비밀번호 입력">

    </div><!-- 회원로그인 탭 -->


    <div id="test2" class="col s3">
    <input type="text" id="tel" name="tel" placeholder="전화번호 입력">
    <input type="text" id="password2" name="password2" placeholder="비밀번호 입력">
    </div><!-- 비회원로그인 탭 -->
    </div><!-- 마테리얼 라이즈 탭 완성 -->
</section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            $('.tabs').tabs();
        });
    </script>
    </body>
</html>
