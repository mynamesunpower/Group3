<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-21
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8"); // post방식 한글깨짐 처리%>
<html>
<head>
    <title>회원가입페이지</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
    //아이디 유효성검사.
$(document).ready(function () {
    $('#id').keyup(function(){
        $.ajax({
            type : 'post',
            async : true,
            url : 'idCheck.ing',
            contentType : 'application/x-www-form-urlencoded;charset=utf-8',
            data : {
                'id' : $('#id').val() // 보내는 데이터 를 보냈으니 중복여부는 돌아왔을텐데
            }, // 뭘 해도 에러넹
            success : function (result) {
                alert(result); // 요고 확인해보죵죵 이거 에러만뜸
               $('#idCheckResult').text(result); // 성공했을 때
            },
            error : function (err) {
                alert("dddddddd");
                console.log(err);
            }
        });
    })//
});

</script>
<%--<script src="../../js/memberjoin.js"></script>--%>

<%--sweetalert css 경고창--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<body>
    <form action="userok.ing" name="userinput" id="userinput" method="post">
        <h1>기본 정보 입력</h1>
        아이디 : <input type="text" name="id" id="id" required>
        <span id="idCheckResult" style="width:150px; color:red"></span>
        <br/><br/>

        비밀번호 : <input type="password" name="password" id="password"
                      required><br/><br/>

        비밀번호확인 : <input type="password" name="password2" id="password2"
                        required><br/><br/>

    이름 : <input type="text" name="name" id="name"
                required><br/><br/>

    전화번호 : <input type="select" name="tel" id="tel" placeholder="-는 빼고 입력해주세요"
                  required><br/><br/>

    주민등록번호 : <input type="text" name="jumin1" id="jumin1"
                    required>
    -
    <input type="text" name="jumin2" id="jumin2"
           required><br/><br/>

    이메일 : <input type="text" name="email" id="email" value=""
                 required>
    <input type="text" id="domain" name="domain" class="box" value=""
           required>

    <select id="emailSelection" name="emailSelection">
        <option value="1" selected="selected">직접입력</option>
        <option value="@gmail.com">@gmail.com</option>
        <option value="@naver.com">@naver.com</option>
        <option value="@nate.net">@nate.com</option>
        <option value="@hanmail.net">@hanmail.net</option>
        <option value="@daum.net">@daum.net</option>
    </select>


    <br/><br/>
    <hr>
    <h1>부가 정보 입력</h1>
    주소<br/>
    <div class="form-group">
        <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1"
               id="addr1" type="text" required>
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기
    </button>
    </div>
    <div class="form-group">
        <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2"
               id="addr2" type="text" required/>
    </div>
    <div class="form-group">
        <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"/>
    </div>
    <br/><br/>
    <input type="submit" name="submit" id="submit" value="등 록">
    <input type="reset" name="reset" id="reset" value="취 소">
</form>

</body>
</html>
