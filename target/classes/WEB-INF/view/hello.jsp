<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" type="text/css" href="../../css/slide.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.pjax/2.0.1/jquery.pjax.min.js"></script>
    <script src="../../js/index.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <a id="title" href="" class="black-text"><h5>Booktrain.ing</h5></a>
    </div>
    <div class="col s1 m1 l1"></div>
    <div class="col s1 m1 l1"></div>
    <div class="col s4 m2 l2">
        <h5>
            <a class="loadAjax btn-flat tooltipped" href="" data-position="bottom" data-tooltip="장바구니">
                <i class="material-icons black-text">shopping_cart</i>
            </a>
            <a id="search" class="btn-flat tooltipped" data-position="bottom" data-tooltip="통합 검색">
                <i class="material-icons black-text">search</i>
            </a>
            <a class="dropdown-trigger btn-flat white" href="#" data-target="login">
                <i class="material-icons black-text">person</i>
            </a>
            <ul id="login" class="dropdown-content">
                <li><a class="loadAjax" href="login.ing">로그인</a></li>
                <li><a class="loadAjax" href="">회원가입</a></li>
            </ul>
        </h5>
    </div>
</div>
<form id="searchForm" action="./searchBook.ing">
    <div id="searchBox" class="searchBox">
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
                                <select multiple name="sbox" id="sbox">
                                    <option value="TITLE" >제목</option>
                                    <option value="AUTHOR" >작가명</option>
                                    <option value="GENRE">장르</option>
                                    <option value="KEYWORD">키워드</option>
                                </select>
                        <label class="right-align">검색 조건</label>
                    </div>
                    <div class="input-field col s7">
                        <%--<form id="searchForm" action="./searchBook.ing">--%>
                        <input id="icon_prefix" name="keyword" type="text" class="validate">
                        <label for="icon_prefix"><a id="searchAnchor" class="loadAjax"><i
                                id="searchIcon" class="material-icons prefix">search</i></a></label>
</form>
</div>
</div>
<div class="row"></div>
</div>
</div>
</div>
<div class="container">

    <ul id="slide-out" class="sidenav">
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
                <li>
                    <div class="collapsible-header">책</div>
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
            </ul>
        </li>
    </ul>

    <div class="row center-align">
        <!--컨텐츠 부분-->
        <div id="content" class="col s8 offset-s2">

            <!--캐러셀-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- 슬라이더 순서 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- 슬라이더 이미지 부분-->
                <div class="carousel-inner">

                    <div class="item active">
                        <img class="d-block" src="../../imgs/book/s1.png" alt="book1" style="width:100% ;">
                        <div class="carousel-caption">
                            <h3>Book1</h3>
                            <p>감사합니다! Book1</p>
                        </div>
                    </div>

                    <div class="item">
                        <img class="d-block" src="../../imgs/book/tobySpring.png" alt="Book2" style="width:100%;">
                        <div class="carousel-caption">
                            <h3>Book2</h3>
                            <p>Thank you, Book2</p>
                        </div>
                    </div>

                    <div class="item">
                        <img class="d-block" src="../../imgs/book/image.png" alt="Book3" style="width:100%;">
                        <div class="carousel-caption">
                            <h3>Book3</h3>
                            <p>I LOVE Book3</p>
                        </div>
                    </div>

                </div>

                <!-- 좌 우 이동 버튼 -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <br/>
            <br/>
            <br/>

            <!-- 베스트셀러 부분???-->
            <div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top:10px;">
                <tbody>
                <tr>
                    <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">Best!!</td>
                    <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">Best!!</td>
                    <td width="25%" valign="top" style="color:#33afe9; text-align:center;padding:0 9px;">Best!!</td>

                </tr>

                <tr>
                    <td width="25%" height="136" valign="bottom" style="color:#33afe9; text-align:center;padding:0 9px;">
                        <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213773&amp;start=we">
                            <img src="https://image.aladin.co.kr/product/25890/64/coversum/k142737568_1.jpg" alt="">
                        </a>
                    </td>

                    <td width="25%" height="136" valign="bottom" style="color:#33afe9; text-align:center;padding:0 9px;">
                        <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213675&amp;start=we">
                            <img src="https://image.aladin.co.kr/product/25834/32/coversum/k582736433_1.jpg" alt="">
                        </a>
                    </td>

                    <td width="25%" height="136" valign="bottom" style="color:#33afe9; text-align:center;padding:0 9px;">
                        <a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=212627&amp;start=we">
                            <img src="https://image.aladin.co.kr/product/25613/11/coversum/k402735218_1.jpg" alt="">
                        </a>
                    </td>

                </tr>

                <tr>
                    <td width="25%" valign="top" style="text-align:center; padding:5px 9px 0 9px;">&lt;1일 1클래식 1기쁨&gt;<a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213773&amp;start=we"></a></td>
                    <td width="25%" valign="top" style="text-align:center; padding:5px 9px 0 9px;">1페이지 미술 365 (고흐 에디션)<a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=213675&amp;start=we"></a></td>
                    <td width="25%" valign="top" style="text-align:center; padding:5px 9px 0 9px;">&lt;아무도 아닌&gt; 리커버<a href="https://www.aladin.co.kr/events/wevent.aspx?EventId=212627&amp;start=we"></a></td>
                </tr>
                </tbody>
            </table>
            </div>

            <!--이주의 신작-->
            <div style="height:225px;vertical-align:top;">
                <div class="Wtitlebox" style="padding-bottom:8px;">
                    <img  alt="알라딘 스페셜" border="0"></div>


            </div>

        </div>
    </div>
</div>



</body>
</html>
