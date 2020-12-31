<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-29
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).on('click', '#customerModifyBtn', function (evt) {
                evt.stopPropagation();
                evt.preventDefault();

                let content = $("#content");
                let queryString = $('#customerModifyForm').serialize();
                $.ajax({
                    type : 'post',
                    url : $(this).attr('href'),
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

<%--${param.articleId}  값이 넘어옴 글번호--%>


<form id="customerModifyForm" action="customerBoard/customerBoardUpdateOk.ing">
<div class="row">
    <div class="input-field col s6 offset-s2">
        <label for="title">글제목</label>
        <input type="text" id="title" name="title" required>
    </div>
</div>

<div class="row">
    <div class="input-field col s8 offset-s2">
        <label for="content">글내용</label>
        <textarea type="text"  class="materialize-textarea" id="content" name="content"></textarea>
    </div>
</div>
    <input type="hidden" id="articleId" name="articleId" value="${param.articleId}">
<%--<button class="btn waves-effect waves-light" type="submit" name="action">글수정완료</button>--%>
    <a class="btn waves-effect waves-light loadAjax blue lighten-4" id="customerModifyBtn" href="customerBoard/customerBoardUpdateOk.ing">수정하기</a>
    <a class="btn waves-effect waves-light loadAjax" href="/booktrain.ing">홈으로</a>
    <a class="btn waves-effect waves-light loadAjax" href="/customerBoard/customerBoardList.ing">목록으로</a>
</form>


</body>
</html>
