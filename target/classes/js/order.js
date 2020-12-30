function execPostCode() {
    new daum.Postcode({
        oncomplete: (data) => {
            let fullRoadAddr = data.roadAddress;
            let extraRoadAddr = '';

            if (data.bname != '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }

            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if (fullRoadAddr !== '') {
                fullRoadAddr += extraRoadAddr;
            }

            $("[name=addr1]").val(data.zonecode);
            $("[name=addr2]").val(fullRoadAddr);

        }
    }).open();
}

$(function () {

    /**
     *  결제확인(payOrder.jsp)로 창으로 넘어가기
     */
    $('#payOrder').click(() => {
        let shipAddress = '['+$('#addr1').val()+'] ' + $('#addr2').val() +' ' + $('#addr3').val()
        $.ajax({
            type: "post",
            url: "/purchase/payOrder.ing",
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            data: {
                'bookTitle': $('#bookTitle').val(),
                'bookKind': parseInt($('#bookKind').val()) - 1,
                'totalPrice': $('#totalPrice').val(),
                'point': parseInt($('#point').val()),
                'receiver': $('#receiver').val(),
                'shipAddress' : shipAddress
            }, success: (data) => {
                $('#content').children().remove();
                $('#content').html(data);
            }, error: (error) => {
                alert("결제 페이지를 못가~")
            }
        })
    })

    // 포인트 확인 & 사용
    $('#check_point').click(()=>{
        alert('포인트 확인클릭')
    })

    // 체크박스 한개만 체크되도록 설정
    $('.paymentMethod').click(function () {
        $('.paymentMethod').prop('checked', false);
        $(this).prop('checked', true);
    })

    // 결제 창 띄우기
    $('#doPay').click(() => {
        // 결제창에 보일 주문상품명
        let payName = $('#bookTitle').val() + ' 외 ' + $('#bookKind').val()

        // 구매가 한종류인 경우 상품명만 명시
        if (parseInt($('#bookKind').val()) == 0) {
            payName = $('#bookTitle').val()
        }

        // 결제시 필요한 데이터
        let data = {
            'name': $('#name').val(),
            'receiver' : $('#receiver').val(),
            'tel': $('#tel').val(),
            'email': $('#email').val() + '' + $('#domain').val(),
            'addr1': $('#addr1').val(),
            'addr2': $('#addr2').val(),
            'addr3': $('#addr3').val(),
            'payName': payName,
            'totalPrice': $('#totalPrice').val(),
        }
        // TODO 시연할때는 주석 풀어주고 밑에 AJAX없애기
        // paymentMethos.js의 kakaoPay함수 호출
        // kakaoPay(data)

        $.ajax({
            type: 'post',
            url: '/purchase/payComplete.ing',
            contentType: 'application/json; charset=utf-8',
            data: {
            }, success: (data) => {
                $('#content').children().remove();
                $('#content').html(data);
            }, error: (error) => {
                alert("결제완료창으로 못갑니당~")
                console.log(error)
            }

        })
    })

    // 주문내역 & 취소내역 클릭시
    $('#order_list').click(()=>{
        $('#stateDay').empty();
        $('#stateDay').append('구매일자')

    })
    $('#cancel_list').click(()=>{
        $('#stateDay').empty();
        $('#stateDay').append('취소일자')
    })


})  // functioin(){} END

