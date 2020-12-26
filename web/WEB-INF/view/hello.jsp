<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" type="text/css" href="../../css/slide.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="../../js/index.js" type="text/javascript"></script>
    <script src="../../js/hello.js" type="javascript"></script>
    <script src="../../js/cart.js" type="text/javascript"></script>
    <script src="../../js/order.js" type="text/javascript"></script>
    <script src="../../js/paymentMethod.js" type="text/javascript"></script>
    <script type="text/javascript">

        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.carousel');
            var instances = M.Carousel.init(elems);
        });
    </script>
</head>

<body>

<div id="header" class="row center-align">
    <div class="col s1 m1 l1">
        <a data-target="slide-out" class="sidenav-trigger btn-flat tooltipped" data-position="bottom" data-tooltip="메뉴">
            <h5><i class="material-icons black-text">menu</i></h5>
        </a>
    </div>
    <div class="col s1 m1 l1"></div>
    <div class="col s1 m1 l1"></div>
    <div class="col s1 m1 l1"></div>
    <div class="col s4 m4 l4">
            <a id="title" href="/start.ing" class="black-text"><h5>Booktrain.ing</h5></a>
    </div>
    <div class="col s1 m1 l1"></div>
    <div class="col s1 m1 l1"></div>
    <div class="col s4 m2 l2">
        <h5>
            <a id="shoppingCart" class="loadAjax btn-flat tooltipped" href="/cart/cartList.ing" data-position="bottom" data-tooltip="장바구니">
                <i class="material-icons black-text">shopping_cart</i>
            </a>
            <a id="search" class="btn-flat tooltipped" data-position="bottom" data-tooltip="통합 검색">
                <i class="material-icons black-text">search</i>
            </a>
            <c:choose>
                <c:when test="${sessionScope.memberName eq null}">
                    <a id="dropdownbox2" class="dropdown-trigger btn-flat" data-target="dropdown2">
                        <i class="material-icons black-text">account_box</i> </a>

                    <ul id="dropdown2" class="dropdown-content">
                        <li><a class="loadAjax" href="/login.ing">로그인</a></li>
                        <li class="divider"></li>
                        <li><a class="loadAjax" href="/memberjoin.ing">회원가입</a></li>
                    </ul>

                    <%--<a class="loadAjax btn-flat tooltipped" href="login.ing" data-position="bottom" data-tooltip="로그인">
                        <i class="material-icons black-text">account_box</i>
                    </a>--%>
                </c:when>
                <c:when test="${sessionScope.memberName ne null}">
                    <!-- Dropdown Trigger -->
                    <a id="dropdownbox" class='dropdown-trigger btn blue' data-target='dropdown1'>
                            ${sessionScope.memberName}님</a>

                    <!-- Dropdown Structure -->
                    <ul id='dropdown1' class='dropdown-content'>
                        <li><a href="#!" class="blue-text">
                            <a class="loadAjax" href="/memberupdate.ing" id="mypage" name="mypage">회원정보수정</a>
                        </a></li>
                        <li class="divider"></li>
                        <li><a href="#!" class="blue-text">주문목록확인</a></li>
                        <li class="divider"></li>
                        <li><a href="#!" class="blue-text">
                            <a class="loadAjax" href="/logout.ing" id="logout" name="logout" onclick="alert('로그아웃되었습니다.')">로그아웃</a>
                        </a></li>
                    </ul>
                    <%--<input type="button" id="mypage" name="mypage" value="MYPAGE" onclick="location.href='/mypage.ing'">--%>
                    <%--<input type="button" id="logout" name="logout" value="로그아웃" onclick="location.href='/logout.ing'">--%>
                </c:when>
            </c:choose>
        </h5>
    </div>
</div>

<div id="searchBox" class="searchBox">
    <form id="searchForm" action="./searchBook.ing">
        <div class="row">
            <div class="col s12 m12 z-depth-1">
                <div class="row"></div>
                <div class="row">
                    <div class="col s1 push-s11 right-align">
                        <a id="searchBox_close" class="btn-flat tooltipped" data-position="bottom" data-tooltip="닫기"><i
                                class="material-icons">close</i></a>
                    </div>
                </div>
                <div class="row"></div>
                <div class="row">
                    <div class="input-field col s3 offset-s1">
                        <select name="sbox" id="sbox">
                            <option value="" disabled selected></option>
                            <option value="title">제목</option>
                            <option value="author">작가</option>
                            <option value="genre">장르</option>
                            <option value="keyword">키워드</option>
                        </select>
                        <label class="right-align">검색 조건</label>
                    </div>
                    <div class="input-field col s7">
                        <%--<form id="searchForm" action="./searchBook.ing">--%>
                        <input id="icon_prefix" name="keyword" type="text" class="validate">
                        <label for="icon_prefix"><a id="searchAnchor" class="loadAjax"><i
                                id="searchIcon" class="material-icons prefix">search</i></a></label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
    <ul id="slide-out" class="sidenav manager">
        <li class="no-padding">
            <ul class="collapsible expandable">
                <li>
                    <div class="collapsible-header">책 CRUD</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a class="loadAjax" href="insertBook.ing">책 정보 데이터베이스 입력</a></li>
                            <li><a class="loadAjax" href="rbookList.ing">책 데이터베이스 목록 보기</a></li>
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

    <div class="container">
        <div class="row center-align">
            <div id="content" class="col s12">
                <div class="row">
                    <div class="col s6 offset-s3">
                        <div class="carousel">
                            <h5>새로 들어온 책</h5>
                            <a class="carousel-item" href="#one!"><img src="../../imgs/book/s1.png">book1</a>
                            <a class="carousel-item" href="#two!"><img src="../../imgs/book/s2.png">book2</a>
                            <a class="carousel-item" href="#three!"><img src="../../imgs/book/s3.png"></a>
                            <a class="carousel-item" href="#four!"><img src="../../imgs/book/s3.png"></a>
                            <a class="carousel-item" href="#five!"><img src="../../imgs/book/s3.png"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
