$(function () {
    let bookCount;
    let totalPrice;

    // 해당 상품 삭제
    $('#cartTable').on('click', '.deleteBook', function () {
        // $(this).parent().parent().parent().attr('action','/cart/deleteBook.ing').submit();
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
        bookCount = parseInt($(this).parent().children('.quantity').text()) + 1
        totalPrice = (bookCount * parseInt($(this).parent().parent().children('#price').val())).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $.ajax({
            type: 'post',
            url: '/cart/modifyCart.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data: {
                'quantity': bookCount,
                'isbn': $(this).parent().parent().children('.isbn').val()
                // 'isbn='+$(this).parent().parent().children('.isbn').val()+'&quantity='+bookCount
            },
            success: () => {
                $(this).parent().children('.quantity').text(bookCount)
                $(this).parent().parent().children('.totalPrice').text(totalPrice + '원')
            }, error: (error) => {
                console.log(error);
            }
        })
    })

    // 수량 빼기 클릭시
    $('#cartTable').on('click', '.minusCount', function () {
        bookCount = parseInt($(this).parent().children('.quantity').text()) - 1
        if (bookCount == 0) {
            $(this).parent().parent().remove();
        }
        totalPrice = (bookCount * parseInt($(this).parent().parent().children('#price').val())).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $.ajax({
            type: 'post',
            url: '/cart/modifyCart.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data: {
                'quantity': bookCount,
                'isbn': $(this).parent().parent().children('.isbn').val()
            },
            success: () => {
                $(this).parent().parent().children('.totalPrice').text(totalPrice + '원')
                $(this).parent().children('.quantity').text(bookCount)
            }, error: (error) => {
                console.log(error);
            }
        })
    })

    // 1개 상품 주문
    $('#cartTable').on('click', '.orderBook', function () {
        $.ajax({
            type: 'get',
            url: '/purchase/orderBook.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data: {
                'isbn': $(this).parent().parent().children('.isbn').val(),
                'title' : $(this).parent().parent().children('.title').val()
            },
            success: (data) => {
                $('#content').children().remove();
                $('#content').html(data);
            }, error: (error) => {
                alert('상품 주문 실패')
                console.log(error)
            }
        })
    })


    // 체크된 상품 주문
    // $('#checkedBook_order').click(() => {
    $('#checkedBook_order').on('click', ()=>{

        let isbn = new Array();
        let title = new Array();
        let checkBox = $('.checkedBook:checked')

        // 체크된 항목의 isbn값을 얻어옴
        checkBox.each(function (i) {
            let tr = checkBox.parent().parent().parent().eq(i);
            let td = tr.children();
            isbn.push(td.eq(0).val())
            title.push(td.eq(2).val())
        })

        $.ajax({
            type: 'post',
            url: '/purchase/orderBooks.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data :{
                'isbn' : isbn,
                'title' : title
            },
            success: (data) => {
                $('#content').children().remove();
                $('#content').html(data);
            }, error: (error) => {
                alert("상품주문으로 갈수가없어~~")
                console.log(error)
            }
        })

    })

    // 전체삭제
    $('#deleteAll').click(() => {
        $.ajax({
            type: 'post',
            url: '/cart/deleteCartList.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            success: () => {
                $('.bookList').remove();
            }, error: (error) => {
                alert('장바구니 전체삭제 실패')
                console.log(error)
            }
        })
    })


})  // function(){} END

