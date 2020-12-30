<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-29
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객게시판 등록</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).on('click', '#customerReplyBtn', function (evt) {
                evt.stopPropagation();
                evt.preventDefault();

                let content = $("#content");
                let queryString = $('#customerReplyForm').serialize();
                $.ajax({
                    type : 'post',
                    url : 'customerBoard/customerBoardReplyOk.ing',
                    data : queryString,
                    success : function (data) {
                        content.children().remove();
                        content.html(data);
                    },
                    error : function (err) {
                        console.log("게시판 글쓰기 실패"+err);
                    }
                })
            })
        });
    </script>
</head>
<body>

<form id="customerReplyForm" action="customerBoard/customerBoardReplyOk.ing">
    <div class="row">
        <div class="input-field col s6 offset-s2">
            <label for="title">글제목</label>
            <input type="text" id="title" name="title" value=" └ Re ">
        </div>
    </div>

    <div class="row">
        <div class="input-field col s8 offset-s2">
            <label for="content">글내용</label>
            <textarea type="text"  class="materialize-textarea" id="content" name="content"></textarea>
        </div>
    </div>

    <input type="hidden" id="originId" name="originId" value="${param.originId}">
    <input type="hidden" id="articleId" name="articleId" value="${param.articleId}">
    <input type="hidden" id="tel" name="tel" value="${sessionScope.memberTel}">
    <%--<button class="btn waves-effect waves-light" type="submit" name="action">글등록</button>--%>
    <a class="loadAjax btn waves-effect waves-light" id="customerReplyBtn">답글 등록</a>
    <a class="btn waves-effect waves-light loadAjax" href="/start.ing">홈으로</a>
    <a class="btn waves-effect waves-light loadAjax" href="/customerBoard/customerBoardList.ing">목록으로</a>
</form>
</body>
</html>
