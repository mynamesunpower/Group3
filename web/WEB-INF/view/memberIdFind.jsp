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
    <script type="text/javascript">
        $(document).ready(function () {
            $('select[name=emailSelection]').change(function() {
                if($(this).val()=="1"){
                    $('#domain').val("");
                } else {
                    $('#domain').val($(this).val());
                    $("#domain").attr("readonly", true);
                }
            });

            $(document).on('focusout', '#email', function () {
                $('#email').val($('#email').val().trim());
            })

            $(document).on('focusout', '#tel', function () {
                let tel = $('#tel');
                let telValue = tel.val();
                let telReg = /^[0-9]{10,11}$/;
                if(!telReg.test(telValue)){
                    $('#telCheckResult').text("전화번호는 10~11자리 숫자만 입력 가능합니다.");
                    $('#tel').val(telValue.replace(/^[0-9]*$/, ""));
                    return;
                }
            });

            $(document).on('click', '#findIdBtn', function (evt) {
                evt.stopPropagation();

                let queryString = $('#memberIdFind').serialize();

                $.ajax({
                    method: "post",
                    url: "/memberIdFindOk.ing",
                    data: queryString,
                    success : function (data) {
                        let result = data.trim().replaceAll("\"", "");
                        if (result == "실패") {
                            alert("입력한 전화번호와 이메일이 올바르지 않습니다.");
                            $('#tel').val("");
                            $('#email').val("");
                            $('#domain').val("");
                        }
                        else {
                            alert("회원님의 아이디는 " + result + " 입니다. 다시 로그인해주세요.");
                            location.replace("start.ing");
                        }
                    },
                    error : function (err) {
                        console.log("memberIdFindOK err: " + err);
                    }
                });
            })

        });
    </script>
    <%--<script src=../../js/memberIdFind.js type="text/javascript"></script>--%>
</head>

<h5>회원 아이디 찾기</h5>
<h6>가입하신 전화번호와 이메일을 입력하세요.</h6>
<form id="memberIdFind" action="memberIdFindOk.ing">
    <div class="row">
        <div class="input-field col s6">
            전화번호: <input type="text" name="tel" id="tel" placeholder="-는 빼고 입력해주세요">
            <span class="valiText" id="telCheckResult"></span>
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
        </div>
    </div>
    <input id="findIdBtn" class="btn" type="button" value="ID 찾기">
</form>
</body>
</html>
