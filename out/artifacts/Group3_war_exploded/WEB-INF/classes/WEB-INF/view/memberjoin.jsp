<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-21
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>회원가입페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../js/memberjoin.js"></script>
<script type="text/javascript">
$(document).ready(
    $(document).on('click', '#memberSubmit', function (evt) {
        evt.stopPropagation();
        let queryString = $('#userinput').serialize();

        $.ajax({
            method: 'post',
            url: "/userok.ing",
            data: queryString,
            success : function (data) {
                $('#content').children().remove();
                $('#content').html(data);
            },
            error : function (err) {
                console.log(err);
            }
        });
    })
);
</script>


<body>
<form action="userok.ing" name="userinput" id="userinput">
<h1>기본 정보 입력</h1>

아이디       :  <input type="text" name="id" id="id"><br/><br/>
비밀번호     :  <input type="password" name="pass" id="pass"><br/><br/>
비밀번호확인 :  <input type="password" name="pass2" id="pass2"><br/><br/>
이름         :    <input type="text" name="name" id="name"><br/><br/>
전화번호     :    <input type="select" name="tel" id="tel" placeholder="-는 빼고 입력해주세요"><br/><br/>
주민등록번호   : <input type="text" name="jumin1" id="jumin1">
        -
        <input type="text" name="jumin2" id="jumin2"><br/><br/>

                이메일       :    <input type="text" name="email" id="email" value="">
                    <input type="text"  id="domain" name="domain" class="box" value="">

                    <select id="emailSelection" name="emailSelection">
                        <option value="1" selected="selected">직접입력</option>
                        <option value="@gmail.com">@gmail.com</option>
                        <option value="@naver.com">@naver.com</option>
                        <option value="@nate.net">@nate.com</option>
                        <option value="@hanmail.net">@hanmail.net</option>
        <option value="@daum.net">@daum.net</option>
    </select>


    <br/><br/><hr>
    <h1>부가 정보 입력</h1>
        주소<br/>
    <div class="form-group">
        <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
        <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    </div>
    <div class="form-group">
        <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
    </div>
    <div class="form-group">
        <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
    </div>

    <br/><br/>
<input type="button" name="submit" id="memberSubmit" value="등 록">
<input type="reset" name="reset" id="reset" value="취 소">

</form>
</body>
</html>
