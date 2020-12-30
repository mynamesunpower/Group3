$(function (){

    // 사용하려는 포인트 입력으로 유효성 검증
    $('#use_point').focusout(()=>{
        if(parseInt($('#member_point').text()) < parseInt($('#use_point').val())){
            $('#alert_point').text('! ' + $('#member_point').text() +'point 이하로 입력해주세요' )
            $('#alert_point').css({
                color : 'red'
            })
            return;
        }else if(parseInt($('#use_point').val()) < 2000){
            $('#alert_point').text('2000 Point 이상부터 사용가능합니다.')
            $('#alert_point').css({
                color : 'red'
            })
            return;
        }else if($('#use_point').val()==''){
            $('#alert_point').text('포인트를 입력해주세요')
            $('#alert_point').css({
                color : 'red'
            })
            return;
        }else{
            $('#alert_point').text('')
        }
    })

    // payOrder.jsp에 사용할 포인트 입력
    $('#use_pointBtn').click(()=>{
        let pay_point = parseInt($('#use_point').val())
        let price = $(opener.document).find('#price').val()
        $(opener.document).find('.pay_point').text(parseInt($('#use_point').val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' Point')
        $(opener.document).find('#pay_money').text((price-pay_point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원')
        $(opener.document).find('#save_point').text(((price-pay_point)*0.05).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' Point')

        $(opener.document).find('#pay_point').val($('#use_point').val())
        $(opener.document).find('#totalPrice').val((price-pay_point))
        window.close();
    })

    // 취소버튼
    $('#cancel_point').click(()=>{
        window.close()
    })


})
