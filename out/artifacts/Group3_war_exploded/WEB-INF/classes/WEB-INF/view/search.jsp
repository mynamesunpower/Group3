<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-22
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
<div id="searchBox" class="searchBox">
    <div class="row">
        <div class="col s12 m12 z-depth-1">
            <div class="row"></div>
            <div class="row">
                <div class="col s1 push-s11 right-align">
                    <a id="searchBox_close" class="btn-flat tooltipped" data-position="bottom" data-tooltip="닫기"><i class="material-icons">close</i></a>
                </div>
            </div>
            <div class="row"></div>
            <div class="row">
                <div class="input-field col s3 offset-s1">
                    <select multiple>
                        <option value="title">제목</option>
                        <option value="author">작가명</option>
                        <option value="publisher">출판사</option>
                        <option value="keyword">키워드</option>
                    </select>
                    <label class="right-align">검색 조건</label>
                </div>
                <div class="input-field col s7">
                    <form id="searchForm" action="./searchBook.ing">
                        <input id="icon_prefix" name="keyword" type="text" class="validate">
                        <label for="icon_prefix"><a id="searchAnchor" class="loadAjax" href="./searchBook.ing"><i id="searchIcon" class="material-icons prefix">search</i></a></label>
                    </form>
                </div>
            </div>
            <div class="row"></div>
        </div>
    </div>
</div>

</body>
</html>
