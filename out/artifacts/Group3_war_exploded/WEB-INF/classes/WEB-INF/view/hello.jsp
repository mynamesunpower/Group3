
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booktrain.ing - 나만의 작은 공부 서점</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../../css/common.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!--css 드랍다운 구버전-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <!-- JavaScript 드랍다운구버전-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <script src="../../js/hello.js" type="javascript"></script>
</head>
<body>

    <header>
        <span class="button">
            <input type="button" id="listButton" />
        </span>
        <span class="header_text">Booktrain.ing</span>
        <span class="button">
            <input type="button" id="cartButton" />
        </span>
        <span class="button">
            <input type="button" id="searchButton"/>
        </span>
        
        <c:choose> 
            <c:when test="${sessionScope.name eq null}">
        <span class="button">
            <input type="button" id="memberButton" onclick="location.href='/login.ing'"/>
        </span>
            </c:when>
            <c:when test="${sessionScope.name ne null}">

                <div id="container" class="container">
                    <!-- Dropdown Trigger -->
                    <a class='dropdown-button btn blue' href='#' data-activates='dropdown1' id="dropdownbox">
                            ${sessionScope.name}님</a>

                    <!-- Dropdown Structure -->
                    <ul id='dropdown1' class='dropdown-content'>
                        <li><a href="#!" class="blue-text">
                            <a href="/memberupdate.ing" id="mypage" name="mypage">회원정보수정</a>
                        </a></li>
                        <li class="divider"></li>
                        <li><a href="/orderlist.ing" id="orderlist" name="orderlist" class="blue-text">주문목록확인</a></li>
                        <li class="divider"></li>
                        <li><a href="#!" class="blue-text">
                            <a href="/logout.ing" id="logout" name="logout" onclick="alert('로그아웃되었습니다.')">로그아웃</a>
                        </a></li>
                    </ul>
                </div>

        </c:when>
        </c:choose>


            </header>

</body>
</html>
