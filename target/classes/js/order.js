$(function () {

    $('.returnCart').click(() => {
        $.ajax({
            url: "/cart/cartList.ing",
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            success: () => {
                alert("장바구니로 돌아갑니다.")
            }, error: (error) => {
                alert("장바구니로 돌아갈 수 없습니다.")
                console.log(error)
            }
        })
    })

})  // functioin(){} END