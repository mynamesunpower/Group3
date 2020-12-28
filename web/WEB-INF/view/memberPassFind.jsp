<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-26
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 비밀번호 찾기 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src=../../js/memberIdFind.js type="text/javascript"></script>
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


            $(document).on('click', '#findPassBtn', function (evt) {
                evt.stopPropagation();

                let queryString = $('#memberPassFind').serialize();
                alert(queryString);
                $.ajax({
                    method: "post",
                    url: "/memberPassFindOk.ing",
                    data: queryString,
                    success : function (data) {
                        let result = data.trim().replaceAll("\"", "");
                        if (result == "실패") {
                            alert("입력한 아이디와 이메일이 올바르지 않습니다.");
                            $('#id').val("");
                            $('#email').val("");
                            $('#domain').val("");
                        }
                        else {
                            alert("회원님의 비밀번호를 이메일로 전송해드렸습니다.");
                            location.replace("start.ing");
                        }
                    },
                    error : function (err) {
                        console.log("memberPassFindOK err: " + err);
                    }
                });
            })
        });
    </script>
</head>
<body>
<h5>회원 비밀번호 찾기</h5>
<h6>가입하신 아이디와 이메일을 입력하세요. 이메일로 비밀번호를 발송해드리겠습니다.</h6>
<form id="memberPassFind" action="memberPassFindOk.ing">
    <div class="row">
        <div class="input-field col s6">
            아이디: <input type="text" name="id" id="id">
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
    <input id="findPassBtn" class="btn" type="button" value="비밀번호 찾기">
</form>

</body>
</html>
