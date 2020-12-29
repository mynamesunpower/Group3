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
    <script src="../../js/cart.js" type="text/javascript"></script>
    <script src="../../js/order.js" type="text/javascript"></script>
    <script src="../../js/login.js" type="text/javascript"></script>
    <script src="../../js/paymentMethod.js" type="text/javascript"></script>
    <script type="text/javascript">
        <!-- 캐러셀 js -->
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.carousel');
            var instances = M.Carousel.init(elems);

            $('.carousel.carousel-slider').carousel({
                fullWidth: true,
                indicators: true
            });
        });
    </script>
</head>

<body>

<!-- 헤더 -->
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
            <c:if test="${sessionScope.memberName ne null}">
                <a id="shoppingCart" class="loadAjax btn-flat tooltipped" href="/cart/cartList.ing"
                   data-position="bottom" data-tooltip="장바구니">
                    <i class="material-icons black-text">shopping_cart</i>
                </a>
            </c:if>

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
                        <li><a class="loadAjax btn-flat tooltipped" href="customerCenter.ing" data-position="bottom"
                               data-tooltip="고객센터">고객센터</a></li>
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
                        <li><a class="loadAjax" href="/purchase/orderList.ing?state=결제완료" class="blue-text">주문목록확인</a>
                        </li>
                        <li class="divider"></li>
                        <li><a class="loadAjax btn-flat tooltipped" href="customerCenter.ing" data-position="bottom"
                               data-tooltip="고객센터">고객센터</a></li>
                        <li class="divider"></li>
                        <li><a href="#!" class="blue-text">
                            <a class="loadAjax" href="/logout.ing" id="logout" name="logout"
                               onclick="alert('로그아웃되었습니다.')">로그아웃</a>
                        </a></li>

                    </ul>
                    <%--<input type="button" id="mypage" name="mypage" value="MYPAGE" onclick="location.href='/mypage.ing'">--%>
                    <%--<input type="button" id="logout" name="logout" value="로그아웃" onclick="location.href='/logout.ing'">--%>
                </c:when>
            </c:choose>

        </h5>
    </div>
</div> <!-- 헤더 끝 -->

<!-- 검색 박스 -->
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
</div> <!-- 검색 박스 끝 -->

<!-- 사이드 메뉴 (왼쪽) -->
<ul id="slide-out" class="sidenav">
        <li class="no-padding">
            <ul class="collapsible expandable">

            <c:if test="${sessionScope.memberId.toUpperCase() eq 'ADMIN'}">
                <li>
                    <div class="collapsible-header">책 CRUD</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a class="loadAjax" href="insertBook.ing">책 정보 데이터베이스 입력</a></li>
                            <li><a class="loadAjax" href="rbookList.ing">책 데이터베이스 목록 보기</a></li>
                            <li><a class="loadAjax" href="chartA.ing">장르별 매출 비율</a></li>
                            <li><a class="loadAjax" href="chartB.ing">Booktrain 총 매출</a></li>
                            <li><a class="loadAjax" href="chartC.ing">Booktrain 최근 매출</a></li>
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
                </c:if>

                <li>
                    <div class="collapsible-header">　책</div>
                    <div class="collapsible-body">
                        <ul>
                            <li><a class="loadAjax" href="genrebookList.ing?genre=교육">교육</a></li>
                            <li><a class="loadAjax" href="genrebookList.ing?genre=참고서">참고서</a></li>
                            <li><a class="loadAjax" href="genrebookList.ing?genre=EBS">EBS</a></li>
                            <li><a class="loadAjax" href="genrebookList.ing?genre=어학">어학</a></li>
                            <li><a class="loadAjax" href="genrebookList.ing?genre=자격증">자격증</a></li>
                            <li><a class="loadAjax" href="genrebookList.ing?genre=고시">고시</a></li>
                        </ul>
                    </div>
                </li>
                <li class="no-padding"><a class="loadAjax" href="genrebookList.ing?">베스트셀러</a></li>
                <li class="no-padding"><a class="loadAjax" href="genrebookList.ing?">새로 들어온 책</a></li>
                <li class="no-padding"><a class="loadAjax" href="customerCenter.ing">FAQ</a></li>
                <li class="no-padding"><a class="loadAjax" href="customerBoard.ing">고객 게시판</a></li>
            </ul>
        </li>
    </ul> <!-- 사이드 메뉴 (왼쪽) 끝 -->

<!-- 페이지 컨텐츠 (내용) -->
    <div class="container">
        <div class="row center-align">
            <div id="content" class="col s12"> <!-- 여기부터 내용 -->

                <!-- 새로 들어온 책 캐러셀 -->
                <div class="row">
                    <div class="col s12">
                        <div class="carousel">
                            <h5>새로 들어온 책</h5>
                            <c:forEach items="${carouselBook}" var="book">
                                <a class="loadAjax carousel-item" href="viewBook.ing?isbn=${book.isbn}"><img src="../../imgs/book/${book.isbn}.PNG">${book.title}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div> <!-- 새로 들어온 책 캐러셀 끝 -->

                <div class="row"> <!-- 전체 베스트셀러 (매출액순) -->
                    <div class="col s12">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top:10px;">
                            <th>전체 베스트셀러</th> <br/><br/>
                            <tbody>
                                <tr>
                                    <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">Best 1</td>
                                    <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">Best 2</td>
                                    <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">Best 3</td>
                                </tr>

                                <tr>
                                <c:forEach items="${bestBook}" var="bbook">
                                    <td width="25%" height="136" valign="bottom" style="color:#33afe9; text-align:center;padding:0 9px;">
                                        <a class="loadAjax" href="viewBook.ing?isbn=${bbook.isbn}">
                                            <img src="../../imgs/book/${bbook.isbn}.PNG" alt="">
                                        </a>
                                    </td>
                                </c:forEach>
                                </tr>

                                <tr>
                                <c:forEach items="${bestBook}" var="bbook">
                                <td width="25%" valign="top" style="text-align:center; padding:5px 9px 0 9px;">&lt;${bbook.title}&gt;<a href=""></a></td>
                                </c:forEach>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div> <!-- 전체 베스트셀러 (매출액순) 끝 -->

                <div class="row"> <!-- 30대가 가장 많이 구매한 도서 (매출액순) -->
                    <div class="col s12">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top:10px;">
                            <th>30대가 가장 많이 구매한 도서</th> <br/><br/>
                            <tbody>
                            <tr>
                                <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">10대 HOT!!!</td>
                                <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">20대 HOT!!!</td>
                                <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">30대 HOT!!!</td>

                            </tr>

                            <tr>
                                <td width="25%" height="136" valign="bottom" style="color:#33afe9; text-align:center;padding:0 9px;">
                                    <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213773&amp;start=we">
                                        <img src="https://image.aladin.co.kr/product/25890/64/coversum/k142737568_1.jpg"
                                             alt="">
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <c:forEach items="${bestBook}" var="bbook">
                                    <td width="25%" valign="top" style="text-align:center; padding:5px 9px 0 9px;">
                                        &lt;${bbook.title}&gt;<a
                                            href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213773&amp;start=we"></a>
                                    </td>
                                </c:forEach>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div> <!-- 30대가 가장 많이 구매한 도서 (매출액순) 끝 -->

                <!-- 이번 달의 신작 -->
                <div class="row">
                    <div class="col s12">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top:10px;">
                            <th>이주의신작!</th>
                            <br/><br/>
                            <tbody>
                            <tr>
                                <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">10대
                                    HOT!!!
                                </td>
                                <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">20대
                                    HOT!!!
                                </td>
                                <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">30대
                                    HOT!!!
                                </td>

                            </tr>

                            <tr>
                                <td width="25%" height="136" valign="bottom"
                                    style="color:#33afe9; text-align:center;padding:0 9px;">
                                    <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213773&amp;start=we">
                                        <img src="https://image.aladin.co.kr/product/25890/64/coversum/k142737568_1.jpg" alt="">
                                    </a>
                                </td>

                                <td width="25%" height="136" valign="bottom"
                                    style="color:#33afe9; text-align:center;padding:0 9px;">
                                    <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213675&amp;start=we">
                                        <img src="https://image.aladin.co.kr/product/25834/32/coversum/k582736433_1.jpg" alt="">
                                    </a>
                                </td>

                                <td width="25%" height="136" valign="bottom"
                                    style="color:#33afe9; text-align:center;padding:0 9px;">
                                    <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=212627&amp;start=we">
                                        <img src="https://image.aladin.co.kr/product/25613/11/coversum/k402735218_1.jpg" alt="">
                                    </a>
                                </td>

                            </tr>

                            <tr>
                                <c:forEach items="${hotBook}" var="hot">
                                    <td width="25%" valign="top" style="text-align:center; padding:5px 9px 0 9px;">
                                        &lt;${hot.title}&gt;<a
                                            href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213773&amp;start=we"></a>
                                    </td>
                                </c:forEach>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div> <!-- 이번 달의 신작 끝 -->

            </div> <!-- 내용은 이 div 안에 들어갈 것 -->

        </div>

                <br/><br/><br/>
        </div>
    </div>
</div>

<!-- footer -->
<footer class="page-footer no-padding">
    <div class="container">
        <div class="row"></div>
        <div class="row">
            © 2020 Copyright by Booktrain.ing
            <span class="grey-text text-lighten-4 right">3조 김태양, 김용관, 박상연, 김형민</span>
        </div>
        <div class="row"></div>
    </div>
</footer> <!-- footer 끝 -->

</body>
</html>
