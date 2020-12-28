
$(document).ready(function(){
    $('.tabs').tabs();   ////마테리얼 css 탭

    /*// 이거 페이지는 어디에요?
    $('#memjoin').click(function () {
            location.href='/memberjoin.ing';
        });
    $('#memsearchid').click(function () {
        location.href='/memberIdFind.ing';
    });
    $('#memsearchpass').click(function () {
        location.href='/memberPassFind.ing';
    });*/

    /*$(document).on('click', '#memjoin', function (evt) {
        evt.stopPropagation();
        $.ajax({
            method: "post",
            url: "/memberjoin.ing",
            success : function (data) {
                $('#content').children().remove();
                $('#content').html(data);
            },
            error : function (err) {
                console.log("memjoin err: " + err);
            }
        });
    })

    $(document).on('keydown', '#pass', function (key) {
        if(key.keycode == 13) {
            alert(key.keycode);
            login(evt);
        }
    })

    $(document).on('click', '#memlogin', function (evt) {
        let id = $('#id').val();
        let pass= $('#pass').val();
        if (id == null || pass == null) {
            alert("아이디나 비밀번호를 입력하지 않았습니다.");
        }
        login(evt);
    })

    function login(evt) {
        evt.stopPropagation();

        let queryString = $('#memberlogin').serialize();

        $.ajax({
            method: 'post',
            url: "/memberlogin.ing",
            data: queryString,
            success : function (data) {
                location.replace('/start.ing');
            },
            error : function (err) {
                alert("아이디와 비밀번호가 일치하지 않습니다.");
            }
        });
    }*/

});


