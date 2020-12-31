$(function(){
    let isEmail = false;
    let isTel = false;

    $(document).on('focusout', '#email2', function () {
        $('#email2').val($('#email2').val().trim());
    })

    $(document).on('focusout', '#tel2', function () {
        let tel = $('#tel2');
        let telValue = tel.val();
        let telReg = /^[0-9]{10,11}$/;
        if(!telReg.test(telValue)){
            $('#telCheckResult').text("전화번호는 10~11자리 숫자만 입력 가능합니다.");
            isTel = false;
            return;
        } else {
            $('#telCheckResult').text("올바른 형식의 전화번호입니다.");
            isTel = true;
        }
    })

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
            isEmail = false;
        } else {
            $("#valiEmail").text("올바른 이메일 형식입니다.");
            isEmail = true;
        }
    })

    $(document).on('focusout', '#domain2', function () {
        let email = $('#email2').val() + $('#domain2').val();
        let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if(!reg.test(email)) {
            $("#valiEmail").text("올바른 이메일 형식이 아닙니다.");
            isEmail = false;
        } else {
            $("#valiEmail").text("올바른 이메일 형식입니다.");
            isEmail = true;
        }
    })

    $(document).on('click', '#findIdBtn', function (evt) {
        evt.stopPropagation();
        evt.preventDefault();

        let queryString = $('#memberIdFind').serialize();

        $.ajax({
            method: "post",
            url: "member/memberIdFindOk.ing",
            data: queryString,
            success : function (data) {
                let result = data.trim().replaceAll("\"", "");
                if (result == "실패") {
                    alert("입력한 전화번호와 이메일이 올바르지 않습니다.");
                    $('#tel2').val("");
                    $('#email2').val("");
                    $('#domain2').val("");
                }
                else {
                    alert("회원님의 아이디는 " + result + " 입니다. 다시 로그인해주세요.");
                    location.replace("booktrain.ing");
                }
            },
            error : function (err) {
                console.log("memberIdFindOK err: " + err);
            }
        });
    })


}); //end $(function)
