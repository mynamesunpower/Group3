<%--
  Created by IntelliJ IDEA.
  User: hyeongmin
  Date: 2020-12-26
  Time: 오후 11:41
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
                ['month', '남자', '여자'],
                ['1월',  1000,      400],
                ['2월',  1170,      460],
                ['3월',  660,       1120],
                ['4월',  1030,      540],
                ['5월',  1030,      540],
                ['6월',  1030,      540],
                ['7월',  1030,      540],
                ['8월',  1030,      540],
                ['9월',  1030,      540],
                ['10월',  1030,      540],
                ['11월',  1030,      540],
                ['12월',  1030,      540]


            ]);

            var options = {
                title: 'Booktrain 매출',
                curveType: 'line',
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