$(function(){


    $('#cartButton').click(() => {
        alert('카트 클릭')
        $('#cartTable').css({
            border : '1'
            })
        let tr = $('<tr/>')
        $('#cartTable').append(tr)
        tr.append('<td>' + 1 + '</td>')
    })


})  // function(){} END