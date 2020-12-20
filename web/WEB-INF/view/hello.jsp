<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.pjax/2.0.1/jquery.pjax.min.js"></script>
    <script src="../../js/index.js" type="text/javascript"></script>
</head>
<body>

<div class="container">
    <div id="header" class="row center-align valign-wrapper">
        <div class="col s1 m1 l1">
            <a data-target="slide-out" class="sidenav-trigger">
                <h5><i class="material-icons black-text">menu</i></h5>
            </a>
        </div>
        <div class="col s1 m1 l1"></div>
        <div class="col s1 m1 l1"></div>
        <div class="col s1 m1 l1"></div>
        <div class="col s4 m4 l4">
            <a id="title" href="" class="black-text"><h5>Booktrain.ing</h5></a>
        </div>
        <div class="col s1 m1 l1"></div>
        <div class="col s1 m1 l1"></div>
        <div class="col s4 m2 l2">
            <h5>
            <a href="" id="btn_cart">
                <i class="material-icons black-text">shopping_cart</i>
            </a>
            <a href="" id="btn_search">
                <i class="material-icons black-text">search</i>
            </a>
            <a href="" id="btn_login">
                <i class="material-icons black-text">person</i>
            </a>
            </h5>
        </div>
    </div>

    <ul id="slide-out" class="sidenav">
        <li class="no-padding">
            <ul class="collapsible expandable">
                <li>
                    <div class="collapsible-header">책 CRUD</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a href="#">책 정보 데이터베이스 입력</a></li>
                            <li><a href="#">책 데이터베이스 목록 보기</a></li>
                            <li><a href="#">책 데이터베이스 수정하기</a></li>
                            <li><a href="#">책 데이터베이스 삭제하기</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header">출판사 CRUD</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a class="loadAjax" href="publisher/insertPublisher.ing">출판사 정보 데이터베이스 입력</a></li>
                            <li><a class="loadAjax" href="publisher/listPublisher.ing">출판사 데이터베이스 목록 보기</a></li>
                            <li><a href="#">출판사 데이터베이스 수정하기</a></li>
                            <li><a href="#">출판사 데이터베이스 삭제하기</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </ul>

    <div class="row center-align">
        <div id="content" class="col s8 offset-s2">
            컨텐츠 부분
        </div>
    </div>
</div> <!-- end of container (마지막 div) -->
</body>
</html>
