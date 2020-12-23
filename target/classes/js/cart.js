$(function(){
    $('#cart').css({ cursor:'pointer'})

    $('#cart').click(() => {
        $('#cartTable').css({
            border : '1'
            })
        let tr = $('<tr/>')
        $('#cartTable').append(tr)
        tr.append('<td>' + 1 + '</td>')
    })


})  // function(){} END