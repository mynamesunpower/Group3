$(function () {
    let bookCount;
    let totalPrice;

    $('#cartTable').on('click', '.deleteBook', function () {
        $('#cartForm').attr('action', '/cart/deleteBook.ing')
        alert($(this).parent().parent().children('.isbn').val() + '삭제')
        $.ajax({
            type: 'post',
            url: "/cart/deleteBook.ing",
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data: {
                'isbn': $(this).parent().parent().children('.isbn').val()
            },
            success: (result) => {
                $(this).parent().parent().remove();
            }, error: (error) => {
                console.log(error)
            }
        })
    })

    // 수량 더하기 클릭시
    $('#cartTable').on('click', '.plusCount', function () {
        $('#cartForm').attr('action', '/cart/modifyCart.ing')
        bookCount = parseInt($(this).parent().children('.quantity').text()) + 1
        totalPrice = bookCount * parseInt($(this).parent().parent().children('.price').text())
        $(this).parent().parent().children('.totalPrice').text(totalPrice)

        $.ajax({
            type: 'post',
            url: '/cart/modifyCart.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data: {
                'quantity': bookCount,
                'isbn': $(this).parent().parent().children('.isbn').val()
            },
            success: () => {

            }, error: (error) => {
                console.log(error);
            }
        })
    })

    // 수량 빼기 클릭시
    $('#cartTable').on('click', '.minusCount', function () {
        $('#cartForm').attr('action', '/cart/modifyCart.ing')
        bookCount = parseInt($(this).parent().children('.quantity').text()) - 1

        if(bookCount == 0){
            $(this).parent().parent().remove();
        }
        totalPrice = bookCount * parseInt($(this).parent().parent().children('.price').text())
        $(this).parent().parent().children('.totalPrice').text(totalPrice)

        $.ajax({
            type: 'post',
            url: '/cart/modifyCart.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data: {
                'quantity': bookCount,
                'isbn': $(this).parent().parent().children('.isbn').val()
            },
            success: () => {

            }, error: (error) => {
                console.log(error);
            }
        })
    })


})  // function(){} END

