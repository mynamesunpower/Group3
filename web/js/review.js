$(function () {
    let rating;
    $('#star_rate a').click(function () {
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        rating = $(this).attr('value')
        return false;
    });

    $('#regist_review').click(() => {
        $.ajax({
            type: 'post',
            url: '/review/registReview.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            data: {
                'orderNumber': $('#purchase_orderNumber').val(),
                'isbn': $('#purchaseBook_isbn').val(),
                'content': $('#review_content').val(),
                'score': rating
            }, success: (data) => {
                $('#content').children().remove();
                $('#content').html(data);
            }, error: (error) => {
                alert("에에에~ 리뷰등록 실패~")
                console.log(error)
            }
        })
    })

    // 리뷰 페이징 처리
    $('#review_table').pageMe({
        pagerSelector: $('#review_page'),
        activeColor: 'blue',
        prevText:'Anterior',
        nextText:'Siguiente',
        showPrevNext:true,
        hidePageNumbers:false,
        perPage:5
    });

}) // function END