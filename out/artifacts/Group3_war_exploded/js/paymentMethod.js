// 결제 방식들을 담아둘 파일

    function kakaoPay(data) {
        IMP.init('imp06146117')
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            // 가맹점에서 생성/관리하는 고유 주문번호
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : data.payName,
            amount : data.totalPrice,
            buyer_email : data.email,
            buyer_name : data.name,
            buyer_tel : data.tel,
            buyer_addr : data.addr2 + data.addr3,
            buyer_postcode : data.addr1
        }, (rsp)=> {
            if ( rsp.success ) {
                // TODO 완성되면 msg 지워주기
                var msg = '결제가 완료되었습니다.';
                msg += '결제 금액 : ' + rsp.paid_amount;

                // 결제가 성공하면 해당 url 요청
                $.ajax({
                    type: 'post',
                    url: '/purchase/payComplete.ing',
                    contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                    data: {
                        'totalPrice' : parseInt($('#totalPrice').val()),
                        'payPoint' :  parseInt($('#pay_point').val()),
                        'point' : parseInt($('#totalPrice').val())*0.05
                    }, success: (data) => {
                        $('#content').children().remove();
                        $('#content').html(data);
                    }, error: (error) => {
                        alert("결제완료창으로 못갑니당~")
                        console.log(error)
                    }

                })
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                return;
            }

            alert(msg);

        })
    }