<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-27
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고객센터 페이지</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
        .tabs {
            height: auto;
            white-space: normal;
            border: 1px solid #f0f0f0;
        }

        .tab {
            display: block;
            width: 100%;
            border-bottom: 1px solid #f0f0f0;
        }

        .tab-content {
            height: 400px;
            width: 100%;
            /*background: #fcfcfc;*/
        }

        .indicator {
            display: none;
        }

        /*tabs 부터  .indicator까지 세로로 마테리얼 탭팬으로하기. 이거 안적으면 무조건 가로로..*/
    </style>
    <link rel="shortcut icon" href="../../imgs/favicon.ico">
    <link rel="icon" href="../../imgs/favicon.ico">

    <%--<link rel="stylesheet" type="text/css" href="../../css/customerCenter.css">
    css로하면 안먹혀요. hello에다가도 css햇는데 안먹혀요--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script src="../../js/customerCenter.js" type="text/javascript"></script>
    <%--여기다 아래거 적으면 안먹혀요.탭은 먹히는데--%>
    <script>
        $(document).ready(function () {
            $('.collapsible').collapsible({
                accordion: false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
            });
        });   //탭안에 토글박스 설정해주는 것.
    </script>
</head>
<body>

<h3>FAQ : 자주 묻는 질문</h3>
<h5>직접 문의는 <a class="loadAjax" href="/customerBoard.ing">고객문의 게시판</a>을 이용해주세요.</h5>
<hr>

<!--<div class="container">-->
    <div class="row">
        <div class="col s4">
            <ul class="tabs">
                <li class="tab"><a class="active" href="#test1">배송문의</a></li>
                <li class="tab"><a href="#test2">반품/교환/환불</a></li>
                <li class="tab"><a href="#test3">주문결제</a></li>
                <li class="tab"><a href="#test4">회원서비스</a></li>
            </ul>
        </div>

        <div class="col s8">
            <%--배송문의 첫번째 탭--%>
            <div id="test1" class="col tab-content">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><h5> [배송] 주문한 상품은 언제 받을 수 있을까요?</h5></div>
                        <div class="collapsible-body left-align">
                            BookTrain.ing은 고객님께서 주문하신 상품을 실제 받아보실 수 있는 날짜를 예상해서 알려 드리고 있습니다.<br/><br/>
                            주문 전<br/>
                            각 상품 상세페이지에서 배송지를 입력하시면 배송예상일정과 도착예상일을 알 수 있습니다.<br/><br/>
                            고객님께서 주문하신 상품을 실제 받으시는 날은 "출고예상일+배송일"입니다.<br/><br/>
                            출고예상일은 주문하신 상품을 확인, 포장하여 발송하는 날을 의미합니다.<br/>
                            (출고예상일은 상품에 따라 준비기간이 다르며 업체의 재고가 원활한 경우 안내된 일정보다 단축될 수 있습니다. )<br/>
                            배송일은 택배나 우편을 통해 고객님께 실제 배달이 이루어지는 기간을 말합니다.<br/><br/>
                            주문 후<br/><br/>
                            [마이페이지] > [주문내역/배송조회]에서 주문번호를 클릭하면, 도착예상일 확인이 가능합니다.<br/><br/>
                            ※참고사항<br/>
                            도서산간지역은 근무일 기준 3일 이내입니다.<br/>
                            연휴/공휴일이 있을 경우 해당기간 제외 후 배송 기간을 산정합니다.<br/>
                            택배사 사정이나 기상악화의 경우는 배송일이 다소 변경될 수 있습니다.
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[배송] 몇시까지 주문하면 배송이 되나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            지역별 총알배송 시간 안내입니다.<br/><br/>
                            1.서울, 부산<br/>
                            당일배송 : 월~금요일 자정부터 오후 3시까지, 토요일 오후 12시까지 주문 시<br/><br/>
                            2.수도권, 인천<br/>
                            당일배송 : 월~금요일 자정부터 오후 1시까지, 토요일 오후 12시까지 주문 시<br/><br/>
                            3.대구<br/>
                            당일배송 : 월~금요일 자정부터 오후 16시까지 주문 시, 토요일 오후 12시까지 주문 시<br/><br/>
                            4.경산, 구미<br/>
                            당일배송 : 월~금요일 자정부터 오후 1시까지 주문 시, 토요일 오후 12시까지 주문 시<br/><br/>
                            5.울산, 창원, 진해, 김해, 포항<br/>
                            당일배송 : 월~금요일 자정부터 오후 12시까지, 토요일 자정부터 오전 11시까지 주문 시<br/><br/>
                            6.대전, 광주, 청주, 천안, 아산<br/>
                            당일배송 : 월~금요일 자정부터 오후 12시까지, 토요일 오전 11시까지 주문 시<br/><br/>
                            7.원주, 춘천<br/>
                            당일배송 : 월~토요일 자정부터 오전 11시까지 주문 시<br/><br/>
                            ※ 그 외 지역은 하루배송만 가능합니다.(월~금요일 자정부터 18시까지 주문 시)<br/><br/>
                            ※ 참고사항<br/>
                            - 사무실 지역은 야간 배송으로 인해 익일 배송 될 수 있습니다.<br/>
                            - 총알배송(당일/하루배송)서비스는 주문량에 따라 주문 가능 시간의 마감이 조정 될 수 있습니다.<br/>
                            - 주말 (토요일 당일배송 가능시간 이후~일요일 24시(자정) 전)주문 시 일반 배송으로 도착 예상일은 화요일입니다.<br/>
                            - 주문시간은 최종 결제완료시간이며, 무통장주문은 입금확인 완료시간을 기준으로 합니다.</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[배송지연 보상제] 배송지연 보상제는 무엇인가요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            배송지연보상제도는 당일/하루 배송지연보상과 도서품절 보상 두 가지입니다.<br/><br/>
                            -당일/하루 배송지연보상 : BookTrain.ing에서 주문하신 당일/하루 배송 상품이 주문완료 시점에 안내된 <br/>
                            도착예상일보다 지연된 경우 주문 건당 BookTrain포인트 2,000원을 보상해 드리는 제도입니다.<br/>
                            (단, 주문취소/반품 처리한 주문 건 제외)<br/><br/>
                            -도서 품절 보상 : BookTrain.ing에서 배송하는 도서(잡지, 중고도서, 직수입도서 제외)가 일시품절, 품절, <br/>
                            절판, 판매금지, 미출간 상태로 변경된 경우, 주문취소 후 품절 상품별로 상품금액에 따라 <br/>
                            BookTrain포인트 1,000원, 500원을 보상해 드리는 제도입니다.</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[배송] 부분 출고란 무엇인가요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            부분 출고란, 전체 주문 중 상품출발 예상일이 지나도 일부 상품이 확보되지 못하는 경우 재고가 확보된
                            상품을 먼저 발송하는 제도입니다.<br/>

                            부분 출고 후, 미 발송된 상품은 추후 확보 되는대로 바로 발송해 드리며 만약 확보가 어려울 경우
                            안내와 함께 환불됩니다. (부분 출고 시 추가되는 비용은 당사에서 부담합니다.)</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[배송] 배송 방법에는 어떤 것이 있나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            배송 방법에는 크게 국내 배송과 해외 배송으로 나누어집니다.<br/><br/>
                            ●국내 배송<br/>
                            1.일반 택배<br/>
                            주문하신 상품을 일반적으로 택배 서비스를 이용하여 배송<br/><br/>
                            2.안심 택배<br/>
                            부재중이거나 또는 범죄예방을 위해 집에서 택배물건을 받지 않기를 원하는 시민들이 설치된 무인택배 보관함에서 시간과 장소에 구애받지 않고 택배 물건을 찾아갈 수 있도록
                            하는 서비스<br/><br/>
                            3.편의점 택배<br/>
                            고객이 지정한 편의점으로 배송되어 원하는 시간에 수령가능(일부지역 제외)<br/><br/>
                            4.중고매장 픽업<br/>
                            결제하신 상품을 YES24 중고매장에서 수령하는 서비스<br/><br/>
                            ※ 단, 도서산간지역과 사서함 주소지는 우체국택배로 발송 됩니다.<br/><br/>
                            ●해외 배송<br/><br/>
                            1.DHL<br/>
                            국제공항우편인 DHL를 통해 배송<br/><br/>
                            2.EMS<br/>
                            우체국 항공택배인 EMS를 통해 배송</p></div>
                    </li>
                </ul>
            </div><!-- end  배송문의 첫번째 탭 -->

            <%--반품/교환/환불 두번째 탭--%>
            <div id="test2" class="col tab-content">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><h5>[교환] 다른상품으로 교환 가능하나요?</h5></div>
                        <div class="collapsible-body left-align"><p>다른상품으로는 교환이 불가합니다.<br/>
                            상품을 잘못 구매하셨을 경우 반품 후 새로 재 주문 해주세요.</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[환불] 반품완료 후 어떻게 환불 받을 수 있나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            물류센터 도착 후 검수 작업이 완료되면 환불이 진행됩니다.<br/>
                            반품 완료 시점에 메일이 발송되며 마이페이지>반품/교환 신청 및 조회 에서  주문내역 선택 후 환불금액을 확인 할 수 있습니다.<br/><br/>
                            1. 신용카드 결제<br/>
                            반품 환불의 경우 반품 확정된 익일 영업일 기준 3-5일 이후 해당 카드 사에서 취소 확인이 가능합니다.<br/><br/>
                            반송료가 발생하는 반품의 경우,<br/>
                            고객센터를 통한 반품 접수 시  카드 부분취소로 환불되며,<br/>
                            홈페이지를 통한 반품 접수 시 재 승인으로 환불됩니다.<br/>
                            (일부 재 승인이 불가한 카드는 예치금으로 환불)<br/><br/>
                            반송료가 발생하지 않는 반품의 경우,<br/>
                            전체 환불 시, 고객센터 접수와 홈페이지 접수 모두 동일하게 카드 전체 취소가 됩니다.<br/>
                            부분 환불 시, 고객센터를 통한 반품 접수는 카드 부분취소로 환불되며,<br/>
                            홈페이지를 통한 반품 접수는 재 승인으로 환불됩니다.<br/>
                            (일부 재 승인이 불가한 카드는 예치금으로 환불)<br/><br/>
                            2. 무통장 입금, 실시간계좌이체<br/>
                            고객센터를 통한 반품과 홈페이지를 통한 반품 모두 동일하게 입력해주신 고객님 명의 계좌번호로  환불이 진행됩니다.(단, 고객님 명의의 계좌가 아닌 경우 환불접수가 불가능합니다.)<br/><br/>
                            3.휴대폰 결제<br/>
                            이동통신사 정책에 따라 휴대폰결제 취소는 해당 월내에만 가능합니다.<br/>
                            반송료가 발생하는 반품의 경우,<br/>
                            고객센터를 통한 전체반품은 예치금으로 환불되고,<br/>
                            홈페이지를 통한 전체 반품은 휴대폰결제 재 승인이 됩니다.<br/>
                            반송료가 발생하지 않는 경우,<br/>
                            고객센터를 통한 반품과 홈페이지를 통한 반품 모두 휴대폰 전체 승인 취소가 됩니다.<br/><br/>
                            ※ 익월 취소 시(반품이 다음달에 확인 되는 경우)에는 YES24 예치금으로 환불됩니다.<br/>
                            (통신사 정책에 따라 승인취소 불가능) 단, 예치금 -> 계좌환불접수 시 환불 시기는 결제 익월 28일 이후입니다.</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[반품] 마음에 들지 않아 반품하는 경우는 어떻게 하나요?</h5></div>
                        <div class="collapsible-body left-align"><p>반품을 원하실 경우  출고완료 후 10일 이내 주문 상품에 대해 신청이 가능하며, <br/>
                            홈페이지 또는 고객만족센터를 통하여 접수 가능합니다.<br/><br/>

                            보낸주신 상품은 반품 담당자의 검수 후  환불처리 되며, <br/>
                            상품 하자가 아닌 단순 변심에 의한 반품일 경우 반송 비는 고객님께서 부담하셔야합니다.<br/>
                            -반품 주소 -<br/>
                            (10846) 경기도 파주시 탄현면 금승리 583-5번지 YES24 물류센타 내 반품 담당자 앞<br/>
                            (10846) 경기도 파주시 탄현면 월롱산로 294-58 YES24 물류센타 내 반품 담당자 앞<br/>
                            ※사서함, 군부대, 도서산간 지역 등은 지정택배로 반품이 불가능하오니 신청 후 상품을 직접 반품해주시기 바랍니다. <br/>
                            (상품파손, 오배송의 경우 반품 배송비는 고객센터로 연락 주시면 환불해 드리겠습니다.)</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[반품] 반품이 가능한 경우와 불가능한 경우에는 어떤 것이 있나요?</h5></div>
                        <div class="collapsible-body left-align">
                            <p>반품이 가능한 경우<br/>
                            1) 파본/오발송/배송지연 으로 인한 반품의 경우<br/>
                            2) 변심으로 인한 반품의 경우 출고 완료 후 10일 이내 접수하실 수 있으며 훼손되지 않은 경우 가능합니다. 이때 발생되는 택배비용은 고객님께서 부담 하셔야 합니다.<br/>
                            3) 오발송/파본의 경우 (문제점 발견이 단기간에 어려운 파본의 경우,  30일(늦어도 수령일로부터 3개월) 이내에만 접수 가능합니다.<br/>
                            4) 직수입양서/직수입일서는 취소 수수료(20%)를 부담해야 합니다.<br/><br/>
                            반품이 불가능한 경우<br/>
                            1) 상품을 이미 사용하신 경우,비닐 포장이 되어있는 상품을 개봉하신 경우,상품에 손상이 있는 경우 반품이 불가합니다.<br/>
                            2) 만화책, 잡지, CD/LP, DVD/Blu-ray, 비디오, 소프트웨어 등은 반품이 불가능합니다.<br/>
                            3) 출고완료 후 10일이 경과한 상품은 반품이 불가능합니다.<br/><br/>
                            ※ 주의사항<br/>
                            업체에서 직접 배송되는 상품은 1:1 친절상담 또는 고객센터로 문의해 주십시오.</p></div>
                    </li>
                </ul>
            </div><!-- end  반품/교환/환불 두번째 탭 -->

            <%--주문결제 세번째 탭--%>
            <div id="test3" class="col tab-content">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                    <div class="collapsible-header"><h5>[무통장입금] 무통장입금로 결제할 경우, 언제 입금 확인이 되나요?</h5></div>
                    <div class="collapsible-body left-align"><p>
                        가상계좌로 입금한 내역은 결제 후 실시간으로 입금완료 확인이 가능합니다.<br/><br/>
                        단, 은행업무 마감시간은 이체 및 입금확인이 불가능합니다.<br/>
                        ※ 은행 마감 시간 : 22:00~24:00<br/>
                        (은행별 차이가 있을 수 있음)
                    </p></div>
                    </li>
                        <li>
                        <div class="collapsible-header"><h5>[취소] 신용카드 결제 후, 부분 취소는 어떻게 하나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            홈페이지 통해 직접 부분취소 하는 경우에는 신용카드 재승인으로 처리 되며,<br/>
                            고객센터를 통한 부분취소 시에는 신용카드 부분 취소가 됩니다.(일부카드는 예치금으로 환불)<br/><br/>
                            환불 방법은 아래와 같습니다.<br/>
                            1) 마이페이지 > 주문내역 > 주문내역/배송조회 메뉴 확인<br/>
                            2) 주문내역/배송조회 페이지의 주문한 내역을 확인하고 주문번호를 클릭<br/>
                            3) 취소하려는 상품 우측의 체크박스에 선택을 체크하고 [주문취소]를 클릭<br/>
                            4) 부분 취소 시 취소 수량을 변경하고 [주문취소/재결제] 버튼 클릭<br/><br/>
                            ※ 유의 사항<br/>
                            - 카드사에서 취소 처리 되는 시점에 카드사에서 취소 문자가 전송됩니다.<br/>
                            (단, 카드사 문자 신청한 경우만 전송)<br/>
                            - 모바일에서는 전체 취소만 가능하며, 상품별 부분취소는 PC웹을 이용해주세요.<br/>
                            - 주문취소는 상품별로 주문상태에 따라 가능합니다.(출고작업중 단계 취소 불가)<br/>
                        </p></div>
                        </li>

                        <li>
                        <div class="collapsible-header"><h5>[휴대폰 결제] 휴대폰 결제를 사용할 수 없는 경우도 있나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            아래의 경우 휴대폰 결제를 사용할 수 없습니다.<br />
                            미성년자 명의의 휴대폰 (SKT, KT는 만 19세 미만, LGT는 만 20세 미만)<br />
                            사업자 폰, 미납 상태인 폰, 정액요금제 가입폰, 외국인 폰인 경우,<br />
                            LGT의 경우 신규가입 또는 번호이동 개통 후 60일간은 휴대폰 이용 금액을 월 5만원 한도로 제한하고 있습니다.<br/>
                            단, 미성년자 요금제 이용 시 통신사별 제약이 다릅니다.<br />
                            - SKT : 결제 불가능<br />
                            - KT와 LGT : 가입자가 성인인 경우 가능<br />

                        </p></div>
                        </li>
                        <li>
                        <div class="collapsible-header"><h5>[결제일반] 소비자 피해보상 보험(서울보증 보험)은 언제 신청하며, 어떻게 확인할 수 있나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            소비자 피해보상 보험에 대한 안내는 다음과 같습니다.<br /><br />
                            1. 소비자피해보상보험 신청<br />
                            “전자상거래 등에서의 소비자보호에 관한 법률”에 따라,<br />
                            무통장입금, 계좌이체, 예치금, 가족계좌(복합결제 포함)<br />
                            서울 보증 보험㈜이 제공하는 소비자 피해보상 보험에 가입할 수 있도록 서비스하고 있습니다.<br />
                            이는[결제하기] 페이지에서 피해보상 보험 가입을 신청할 수 있으며,<br />
                            보험증서를 발급 받기 위해 고객님의 성명, 생년월일, 성별을 입력하셔야 합니다.<br /><br />
                            2. 보험가입 여부 확인<br />
                            소비자피해보상보험은 고객님께서 선택할 경우 결제완료시간을 기준으로 신청되며,<br />
                            신청여부의 조회 및 확인은 유앤아워스 홈페이지에서 확인이 가능합니다.<br /><br />
                            ※ 피해보상보험내역 조회 : http://www.unours.co.kr/sgic/ > 고객지원 > 구매상품 보헙가입 확인<br />
                        </p></div>
                        </li>
                        <li>
                        <div class="collapsible-header"><h5>[무통장입금] 무통장입금(은행송금)은 어떻게 하나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            무통장 입금을 통한 결제 방법은 다음과 같습니다.<br /><br />
                            저희 BookTrain에서는 무통장 입금(은행송금)을 통해 주문대금을 결제할 수 있습니다.<br />
                            결제단계에서 무통장 입금 > 입금은행 선택 후 입금자 이름을 입력하여 [동의합니다] 체크 후 결제하기를 클릭하면 주문이 완료 됩니다.<br />
                            이후 고객님 주문만의 고유 가상계좌가 발급되며, 입금을 해주시면 됩니다.<br /><br />
                            ※무통장 입금을 선택하여 주문하실 경우 알림톡을 통해 계좌 정보를 안내해드립니다.<br />
                        </p></div>
                        </li>
                </ul>
            </div><!-- end  주문결제 세번째 탭 -->

            <%--회원서비스 네번째 탭--%>
            <div id="test4" class="col tab-content">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><h5>[회원정보] 개인정보 유효기간제 가 무엇인가요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            '정보통신망 이용 촉진 및 정보보호 등에 관한 법률’에 따라 1년 이상 서비스를 이용하지 않은 계정은 장기 휴면 회원으로 전환됩니다.<br /><br />
                            휴면 회원으로 전환되더라도 로그인을 하면 정상 회원으로 서비스를 이용하실 수 있습니다. <br /><br />
                            단, 개인 정보 유효 기간을 마이페이지>회원정보관리에서 별도 설정한 경우는 선택한 기간까지 정상 회원으로 유지됩니다.<br /><br />
                            (1년, 3년, 5년, 10년, 탈퇴 시까지 중 선택 가능합니다.)</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[로그인] 비밀번호 변경은 어떻게 하나요 ?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            회원정보수정 > 비밀번호 입력 후 기본 입력 사항 화면에서<br />
                            숨은 정보 보기 해지 후 비밀번호 변경이 가능합니다.<br /><br />
                            ※ 숨은 정보 보기는 "생년월일" 또는 "이메일"로 인증 후 해지가 가능합니다.<br /><br />
                            보안정책 강화로 인하여 영문 대/소문자가 구분되며,<br />
                            영문 대/소문자, 숫자, 특수문자 조합 중 2가지 이상으로 조합 후 변경이 가능합니다.<br />
                            비밀번호 변경 시 로그인되어있던 모든 기기에서 자동 로그아웃됩니다.<br /><br />
                            ※유의사항※<br />
                            아이디 및 아이디를 포함한 문자 /숫자는 비밀번호로 사용 불가<br />
                            특수문자는 !@#$%^&*()-_사용 가능<br />
                            동일한 문자(숫자), 연속적인 숫자 4자 이상 사용 불가 예)1234,1111, aaaa<br />
                            생년월일, 전화번호와 동일한 번호는 사용 자제</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[회원정보] 회원 회원탈퇴 후 개인정보는 언제 삭제되나요?</h5></div>
                        <div class="collapsible-body left-align"><p>
                            회원탈퇴 즉시 회원의 개인정보는 삭제됩니다.<br />
                            단, 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에 의거,
                            다음과 같이 거래 관련 확인이 필요한 주문정보(배송정보포함)는 5년간 데이터로 보관되며 이후 파기됩니다.<br /><br />
                            ① 표시, 광고에 관한 기록<br />
                            -보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률   -보존 기간 : 6개월<br /><br />
                            ② 계약 또는 청약철회 등에 관한 기록<br />
                            -보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률   -보존 기간 : 5년<br /><br />
                            ③ 대금결제 및 재화등의 공급에 관한 기록<br />
                            -보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률   -보존 기간 : 5년<br /><br />
                            ④ 소비자의 불만 또는 분쟁처리에 관한 기록<br />
                            -보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률   -보존 기간 : 3년</p></div>
                    </li>
                    <li>
                        <div class="collapsible-header"><h5>[회원] 성인 인증 제한 나이는 어떻게 되나요?</h5></div>
                        <div class="collapsible-body left-align"><p>Booktrain.ing에서는 연19세 이상만 성인인증이 가능합니다.<br /><br />
                            "연19세"란 만19세에 도달하는 해에 1월 1일을 맞이한 사람을 의미합니다.<br />
                            예를 들어 2017년에는 1998년 12월 31일 생까지 연19세가 되어 성인으로 간주하게 됩니다.<br />
                            19세 미만은 청소년으로 간주하여 성인인증을 할 수 없으므로 성인물(만화, DVD/Blu-ray등)을 구매할 수 없습니다.<br /><br />
                            ※ 참고로 청소년보호법 제2조 1항에는 "청소년"이라 함은 만 19세 미만의 자를 말합니다.<br />
                            다만, 만 19세에 도달하는 해의 1월 1일을 맞이한 자를 제외한다. 라고 되어 있습니다.</p></div>
                    </li>
                </ul>
            </div><!-- end  회원서비스 네번째 탭 -->

        </div><!-- end  <div class="col s8">  -->
    </div><!-- end <div class="row"> -->

<!--</div> end <div class="col s8">  세로탭 끝-->


</body>
</html>
