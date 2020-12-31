<script type="text/javascript" src="https://www.google.com/jsapi"></script>


google.load('visualization', '1', {

    'packages' : [ 'corechart' ]

});

google.setOnLoadCallback(drawChart2);
// 차트 그리기 함수
function drawChart2() {
    //json 데이터 받아로기
    // dataType : "json" 결과값이 json 형식
    // async :false  비동기식 옵션을 끔(동기식)
    // ajax 는 비동기식이다. 즉 기본값이 비동기식 true 이다
    // 즉 차트가 그려지기 전에는 다른 작업은 하지 못한다.
    //responseText  : 서버의 응답 텍스트
    var jsonData = $.ajax({

        url : "list.ing",

        dataType : "json",

        async : false

    }).responseText;
    alert(jsonData);
    //json 데이터를 데이터 테이블로 변환
    var data = new google.visualization.DataTable(jsonData);

    // 차트 그리기 (PieChart, LineChart, ColumnChart)
    var chart = new google.visualization.PieChart(document

        .getElementById('chart_div'));

    //draw(데이터, 옵션)
    chart.draw(data, {
        width : 400,
        height : 240
    });

}

<div id="chart_div">

</div>

