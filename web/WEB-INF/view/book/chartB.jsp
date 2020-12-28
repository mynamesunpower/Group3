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
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', '총매출','20대','30대'],${chartB}

                // ['Year', 'Sales','price','moudo'],
                // ['2004',  1000,      400, 600],
                // ['2005',  1170,      460,   700],
                // ['2006',  660,       1120,  900],
                // ['2007',  1030,      540,   800]
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
<div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>
</html>