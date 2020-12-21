$(function(){


    $('#cartTable').on('click', '.deleteBook', function(){
        $('#cartForm').attr('action','deleteBook.ing')
        $.ajax({
            url: "deleteBook.ing",
            contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글 처리
            data : {
                'isbn' : $(this).parent().parent().find('.isbn').val()
            },
            success : (result) =>{
                $(this).parent().parent().remove();
            },error : (error)=>{
                console.log(error)
            }
        })
    })

    // 수량 더하기 클릭시
    $('#cartTable').on('click', '.plusCount', function(){
        let bookCount = parseInt($(this).parent().text())
        let price = parseInt($(this).parent().siblings('.price').text())/bookCount  // 권당 가격
        let amountPrice = parseInt($(this).parent().siblings('.price').text())  // 총 가격
        bookCount += 1
        amountPrice += price
        alert('총 가격 : ' + amountPrice)
        $(this).parent().html('<input type="button" class="plusCount" value="+">'+ bookCount+'<input type="button" class="minusCount" value="-">')
        $(this).parent().siblings('.price').text(amountPrice+ '원')
    })

    // 수량 빼기 클릭시
    $('#cartTable').on('click', '.minusCount', function(){
        let bookCount = parseInt($(this).parent().text())
        let price = parseInt($(this).parent().siblings('.price').text())/bookCount
        let amountPrice = parseInt($(this).parent().siblings('.price').text())  // 총 가격
        bookCount -= 1
        amountPrice -= price
        if (bookCount == 0){
            $(this).parent().parent().remove();
        }
        $(this).parent().html('<input type="button" class="plusCount" value="+">'+ bookCount+'<input type="button" class="minusCount" value="-">')
        $(this).parent().siblings('.price').text(amountPrice + '원')
    })


})  // function(){} END

