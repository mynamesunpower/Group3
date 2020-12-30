$(function(){

    let isEmail2 = false;
    let isId = false;


    $(document).on('focusout', '#email2', function () {
        $('#email2').val($('#email2').val().trim());
    })

    $(document).on('focusout', '#id2', function () {
        let id = $('#id');
        let idReg = /[a-z0-9]{5,12}/g;
        if(!idReg.test($('#id').val())){
            $('#idCheckResult').text("아이디는 5자 이상 12자 이하의 영문자나 숫자만 가능합니다.");
            isId = false;
            return;
        }
        else {
            $('#idCheckResult').text("올바른 형식의 아이디입니다.");
            isId = true;
        }
    });

    $(document).on('change', '#emailSelection2', function () {
        if ($(this).val() == "1") {
            $('#domain2').val("");
            $('#domain2').attr("readonly", false);
        } else {
            $('#domain2').val($(this).val());
            $("#domain2").attr("readonly", true);
        }

        let email = $('#email2').val() + $('#domain2').val();
        let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        if (!reg.test(email)) {
            $("#valiEmail").text("올바른 이메일 형식이 아닙니다.");
            isEmail2 = false;
        } else {
            $("#valiEmail").text("올바른 이메일 형식입니다.");
            isEmail2 = true;
        }
    })

    $(document).on('focusout', '#domain2', function () {
        let email = $('#email2').val() + $('#domain2').val();
        let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if(!reg.test(email)) {
            $("#valiEmail").text("올바른 이메일 형식이 아닙니다.");
            isEmail2 = false;
        } else {
            $("#valiEmail").text("올바른 이메일 형식입니다.");
            isEmail2 = true;
        }
    })

    $(document).on('click', '#findPassBtn', function (evt) {
        evt.stopPropagation();

        let queryString = $('#memberPassFind').serialize();

        $.ajax({
            method: "post",
            url: "member/memberPassFindOk.ing",
            data: queryString,
            success : function (data) {
                let result = data.trim().replaceAll("\"", "");
                if (result == "실패") {
                    alert("입력한 아이디와 이메일이 올바르지 않습니다.");
                    $('#id2').val("");
                    $('#email2').val("");
                    $('#domain2').val("");
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


}); //end $(function)
