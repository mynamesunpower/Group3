$(document).ready(function () {

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
                for (let key in validation) {
                    validation[key] = false;
                }
                $('#content').children().remove();
                $('#content').html(data);
            },
            error : function (err) {
                for (let key in validation) {
                    validation[key] = false;
                }
                console.log("회원가입 오류, 내용은 다음과 같습니다: " + err);
                location.replace("error.ing");
            }
        })
    });

    $(document).on('click', '#memberModify', function (evt) {
        evt.stopPropagation();
        evt.preventDefault();

        if (validation[pass] == false) {
            alert("비밀번호호 입력이 잘못되어 수정이 불가합니다.");
            return;
        }
        if ($('#email').val().trim() == "" && $('#domain').val().trim() == "") {
            alert("이메일 입력이 잘못되어 수정이 불가합니다.");
            return;
        }

        let queryString = $('#userinput').serialize();
        alert(queryString);
        $.ajax({
            method: 'post',
            url: "/updateok.ing",
            data: queryString,
            success : function (data) {
                for (let key in validation) {
                    validation[key] = false;
                }
                $('#content').children().remove();
                $('#content').html(data);
            },
            error : function (err) {
                for (let key in validation) {
                    validation[key] = false;
                }
                alert("회원수정 오류, 내용은 다음과 같습니다: " + err);
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
        $('#email').val($('#email').val().trim());
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


function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);

            $("[name=addr1]").val(data.zonecode);
            $("[name=addr2]").val(fullRoadAddr);

        }
    }).open();
}//end 주소찾기 api
