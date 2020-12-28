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
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
<script src="../../js/memberjoin.js"></script>
<script type="text/javascript">
$(document).ready(function(){

    let validation = {
            id : false,
            pass : false,
            passEqual : false,
            tel : false,
            jumin : false,
            //email : false,
            name : false
        };

    $(document).on('click', '#memberSubmit', function (evt) {
        evt.stopPropagation();
        evt.preventDefault();

        for (let key in validation) {
            if (validation[key] == false) {
                alert(key + " 입력이 잘못되어 회원가입이 불가합니다.");
                return;
            }
        }

        let queryString = $('#userinput').serialize();
        //alert(queryString);
        $.ajax({
            method: 'post',
            url: "/userok.ing",
            data: queryString,
            success : function (data) {
                $('#content').children().remove();
                $('#content').html(data);
            },
            error : function (err) {
                alert("회원가입 오류, 내용은 다음과 같습니다: " + err);
                location.replace("error.ing");
            }
        })
    })

    $(document).on('focusout', '#id', function () {
        let id = $('#id');
        let idReg = /[a-z0-9]{5,12}/g;
        if(!idReg.test($('#id').val())){
            $('#idCheckResult').text("아이디는 5자 이상 12자 이하의 영문자나 숫자만 가능합니다.");
            validation.id = false;
            return;
        }
        else {
            $.ajax({
                type : 'post',
                url : 'idCheck.ing',
                data : id,
                success : function (data) {
                    let result = data.substring(1, data.length-1);
                    $('#idCheckResult').text(result);
                    validation.id = true;
                },
                error : function (error) {
                    alert("실패");
                    console.log(error);
                }
            });
        }
    });

    $(document).on('focusout', '#pass', function () {
        let pass = $('#pass').val();

        let num = pass.search(/[0-9]/g);
        let eng = pass.search(/[a-z]/ig);
        let spe = pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if(pass.length < 8 || pass.length > 15){
            $('#valiPass').text("8자 이상 15자 이하로 입력해주세요.");
            validation.pass = false;
            return validation.pass;
        }
        else if(pass.search(/\s/) != -1){
            $('#valiPass').text("비밀번호는 공백 없이 입력해주세요.");
            validation.pass = false;
            return validation.pass;
        }
        else if(num < 0 || eng < 0 || spe < 0 ){
            $('#valiPass').text("영문, 숫자, 특수문자가 적어도 하나 이상이어야 합니다.");
            validation.pass = false;
            return validation.pass;
        }
        else {
            $('#valiPass').text("사용 가능한 비밀번호입니다.");
            validation.pass = true;
            return validation.pass;
        }
    });

    $(document).on('focusout', '#pass2', function () {
        let pass2 = $('#pass2').val();

        if ($('#pass').val() !== pass2) {
            $('#valiPassEquals').text("비밀번호가 일치하지 않습니다.");
            validation.passEqual = false;
        }
        else {
            $('#valiPassEquals').text("비밀번호가 일치합니다.");
            validation.passEqual = true;
        }
    });

    $(document).on('focusout', '#tel', function () {
        let tel = $('#tel');
        let telValue = tel.val();
        let telReg = /^[0-9]{10,11}$/;
        if(!telReg.test(telValue)){
            $('#telCheckResult').text("전화번호는 10~11자리 숫자만 입력 가능합니다.");
            $('#tel').val(telValue.replace(/^[0-9]*$/, ""));
            validation.tel = false;
            return;
        }
        else {
            $.ajax({
                type : 'post',
                url : 'telCheck.ing',
                data : tel,
                success : function (data) {
                    let result = data.substring(1, data.length-1);
                    $('#telCheckResult').text(result);
                    validation.tel = true;
                },
                error : function (error) {
                    alert("실패");
                    console.log(error);
                }
            });
        }
    });

    $(document).on('focusout', '#name', function () {
        let name = $('#name');
        let nameReg = /^[가-힣]{2,5}$/;

        if (!nameReg.test(name.val())) {
            $('#valiName').text("이름은 2자 이상 5자 이하 한글만 가능합니다.");
            validation.name = false;
        }
        else {
            $('#valiName').text("");
            validation.name = true;
        }
    });

    $(document).on('focusout', '#jumin2', function () {

        let value = $('#jumin1').val() + "-" + $('#jumin2').val();
        let reg = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

        if(!reg.test(value)) {
            $("#valiJumin").text("올바른 주민번호 형식이 아닙니다.");
            validation.jumin = false;
        } else {
            $("#valiJumin").text("올바른 주민번호 형식입니다.");
            validation.jumin = true;
        }
    })

    $(document).on('focusout', '#email', function () {
        $('#email').val('#email'.val().trim());
    })

    $('select[name=emailSelection]').change(function() {
        if($(this).val()=="1"){
            $('#domain').val("");
            $('#domain').attr("readonly", false);
        } else {
            $('#domain').val($(this).val());
            $("#domain").attr("readonly", true);
        }
    });
});
</script>

<%--sweetalert css 경고창--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<body>
<form action="userok.ing" name="userinput" id="userinput">
    <div class="row">
        <div class="col s8 offset-s2">
            <div class="col s3">
                <div class="row">
                </div>
                <h5>기본 정보 입력</h5>
            </div>
            <div class="col s9 left-align">
                <div class="row">
                    <div class="input-field col s8">
                        아이디: <input type="text" name="id" id="id"><span class="valiText" id="idCheckResult"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        비밀번호: <input type="password" name="pass" id="pass">
                        <span class="valiText" id="valiPass"></span>
                    </div>
                    <div class="input-field col s6">
                        비밀번호 확인: <input type="password" name="pass2" id="pass2">
                        <span class="valiText" id="valiPassEquals"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        전화번호: <input type="text" name="tel" id="tel" placeholder="-는 빼고 입력해주세요">
                        <span class="valiText" id="telCheckResult"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        이름: <input type="text" name="name" id="name">
                        <span class="valiText" id="valiName"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        주민등록번호: <input type="text" name="jumin1" id="jumin1">
                        <span class="valiText" id="valiJumin"></span>
                    </div>
                    <div class="input-field col s6">
                        뒤 번호는 수집하지 않습니다.<input type="text" name="jumin2" id="jumin2" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        이메일: <input type="text" name="email" id="email" value="">
                        <span class="valiText" id="valiEmail"></span>
                    </div>
                    <div class="col s4">
                        @부터 입력해주세요. <input type="text"  id="domain" name="domain" class="box" value="">
                    </div>
                    <div class="col s4">
                        <label>도메인</label>
                        <select class="browser-default" id="emailSelection" name="emailSelection">
                            <option value="1" selected>직접입력</option>
                            <option value="@gmail.com">@gmail.com</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@nate.net">@nate.com</option>
                            <option value="@hanmail.net">@hanmail.net</option>
                            <option value="@daum.net">@daum.net</option>
                        </select>
                        <%--<select id="emailSelection" name="emailSelection">
                            <option value="1" selected="selected">직접입력</option>
                            <option value="@gmail.com">@gmail.com</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@nate.net">@nate.com</option>
                            <option value="@hanmail.net">@hanmail.net</option>
                            <option value="@daum.net">@daum.net</option>
                        </select>--%>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col s8 offset-s2">
            <div class="col s3">
                <div class="row">
                </div>
                <h5>부가 정보 입력</h5>
            </div>
            <div class="col s9 left-align">
                <h6>주소</h6>
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
            </div>
        </div>
    </div>
    <span class="valiText" id="formCheckResult"></span>
    <br/>
<input class="btn" type="button" name="submit" id="memberSubmit" value="등 록">
<input class="btn" type="reset" name="reset" id="reset" value="취 소">


</form>

</body>
</html>
