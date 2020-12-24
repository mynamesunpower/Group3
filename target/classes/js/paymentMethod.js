// 결제 방식들을 담아둘 파일

function kakaoPay(data) {
    IMP.init('imp06146117')

    IMP.request_pay({
        pg : 'inicis',
        pay_method : 'card',
        // 가맹점에서 생성/관리하는 고유 주문번호
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '주문명:결제테스트',
        amount : data.totalPrice,
        buyer_email : 'sssw0101@naver.com',
        buyer_name : data.name,
        buyer_tel : data.tel,
        buyer_addr : data.addr2 + data.addr3,
        buyer_postcode : data.addr1
    }, (rsp)=> {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            return;
        }

        alert(msg);

    })
}