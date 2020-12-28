$(function () {
    let rating;
    $('#star_rate a').click(function () {
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        rating = $(this).attr('value')
        return false;
    });

    $('#regist_review').click(() => {
        alert('별점 확인 ' + rating)
        alert($('#review_content').val())
        $.ajax({
            type: 'post',
            url: '/review/registReview.ing',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            data: {
                'orderNumber' : $('#purchase_orderNumber').val(),
                'isbn' : $('#purchaseBook_isbn').val(),
                'content': $('#review_content').val(),
                'score': rating
            }, success: (data) => {

            }, error: (error) => {
                alert("에에에~ 리뷰등록 실패~")
                console.log(error)
            }
        })
    })


}) // function END