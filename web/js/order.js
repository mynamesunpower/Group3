function execPostCode(){
    alert('주소찾기')
    new daum.Postcode({
        oncomplete: (data)=>{
            let fullRoadAddr = data.roadAddress;
            let extraRoadAddr = '';

            if(data.bname != '' && /[동|로|가]$/g.test(data.bname)){
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

            $("[name=addr1]").val(data.zonecode);
            $("[name=addr2]").val(fullRoadAddr);

        }
    }).open();
}

$(function () {

    $('#returnCart').click(() => {
        $.ajax({
            url: "/cart/cartList.ing",
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            success: (data) => {
                alert("장바구니로 돌아갑니다.")
                $('#content').children().remove();
                $('#content').html(data);
            }, error: (error) => {
                alert("장바구니로 돌아갈 수 없습니다.")
                console.log(error)
            }
        })
    })

    $('#payOrder').click(()=>{
        let orderForm = $('#orderForm').serialize();
        $.ajax({
            type:"post",
            url:"/purchase/payOrder.ing",
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            data : {
                // orderForm
                'totalPrice' : $('#totalPrice').val(),
                'point' : parseInt($('#point').val()),
                'receiver' : $('#receiver').val(),
                'addr1' : $('#addr1').val(),
                'addr2' : $('#addr2').val(),
                'addr3' : $('#addr3').val()
            },success:(data)=>{
                $('#content').children().remove();
                $('#content').html(data);
            },error:(error)=> {
                alert("결제 페이지를 못가~")
            }
        })
    })

    // 체크박스 한개만 체크되도록 설정
    $('.paymentMethod').click(function(){
            $('.paymentMethod').prop('checked',false);
            $(this).prop('checked',true);
    })

    // 결제 창 띄우기
    $('#doPay').click(()=>{
            let data = {
            'name' : $('#name').val(),
                'tel' : $('#tel').val(),
                'addr1' : $('#addr1').val(),
                'addr2' : $('#addr2').val(),
                'addr3' : $('#addr3').val(),
                'totalPrice' : $('#totalPrice').val(),
            }
            // paymentMethos.js kakaoPay함수 호출
            kakaoPay(data)
        $.ajax({

        })
    })



})  // functioin(){} END

