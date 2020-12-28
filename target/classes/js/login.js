
$(document).ready(function(){
    $('.tabs').tabs();   ////마테리얼 css 탭

    // 이거 페이지는 어디에요?
    $('#memjoin').click(function () {
            location.href='/memberjoin.ing';
        });
    $('#memsearchid').click(function () {
        location.href='/memberIdFind.ing';
    });
    $('#memsearchpass').click(function () {
        location.href='/memberPassFind.ing';
    });
//여기에없어서?없어도갠차나
});


