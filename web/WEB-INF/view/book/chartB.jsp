<%--
  Created by IntelliJ IDEA.
  User: hyeongmin
  Date: 2020-12-28
  Time: 오후 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});//설마 개수가 많아서 안나오는건 아니겠죠 음..
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', '총매출','10대','20대','30대','40대'],${chartB}
                // ['1', 0,0,0,0,0],
                // ['2', 0,0,0,0,0],
                // ['3', 0,0,0,0,0],
                // ['4', 0,0,0,0,0],
                // ['5', 0,0,0,0,0],
                // ['6', 0,0,0,0,0],
                // ['7', 0,0,0,0,0],
                // ['8', 0,0,0,0,0],
                // ['9', 0,0,0,0,0],
                // ['10', 0,0,0,0,0],
                // ['11', 76000,0,52000,24000,0],
                // ['12', 172000,0,72000,100000,0]


                //

                // ['Year', 'Sales','price','moudo','ad','sss'],//개수는 아닌가보네요
                // 왠지 null과 int라 그런거같은데 아까는 됐자나 그치//데이터가 다 null이라 그럴까요?
                // 아. 그럴수잇겟다. 이거 null 들어오는애들 0으로 바꿔보거나 해볼까?어떻게 바꿔야하죠..?
                // ['2004',  1000,      400, 600,  500,    300],
                // ['2005',  1170,      460,   700,    200,    600],
                // ['2006',  660,       1120,  900,    800,    500],
                // ['2007',  1030,      540,   800,    1000,   200]
            ]);

            var options = {
                title: 'Booktrain 월별 매출',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
    </script>
</head>
<body>
<div class="row">
    <div class="col s12">
      <div id="curve_chart" style="width: 900px; height: 500px"></div>
    </div>
</div>
</body>
</html>