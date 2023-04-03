<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang quản trị</title>
        <!-- Đường dẫn tới các file CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Đường dẫn tới các file JavaScript -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Đường dẫn tới các file JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Đường dẫn tới các file JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>
            /* Thay đổi màu sắc cho header */
            .navbar {
                background-color: #333;
                color: white;
            }

            /* Thay đổi font chữ cho tiêu đề */
            h2 {
                font-family: Arial, Helvetica, sans-serif;
                text-align: center;
                color: #333;
            }

            /* Thay đổi màu sắc và font chữ cho bảng dữ liệu */
            table {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                margin-bottom: 20px;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #333;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <!-- Header của trang -->
        <jsp:include page="header.jsp"></jsp:include>
        <h2 style="text-align: center">Chào mừng đến với HomeSharing</h2>

        <div class="container-fluid">
            <h3>Số lượt truy cập trong tuần qua</h3>
            <div id="donut_chart"></div>
        </div>
        <div class="container-fluid">
            <h3>Doanh thu theo tháng</h3>
            <div id="chart_div"></div>
        </div>
        <div class="container-fluid">
            <h3>Danh sách nhà cho thuê</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tên nhà</th>
                        <th>Số lượng đã thuê</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nhà A</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>Nhà B</td>
                        <td>8</td>
                    </tr>
                    <tr>
                        <td>Nhà C</td>
                        <td>6</td>
                    </tr>
                    <tr>
                        <td>Nhà D</td>
                        <td>5</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Đường dẫn tới file JavaScript của Google Charts -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
            // Load dữ liệu lên biểu đồ
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Tháng', 'Doanh thu (triệu đồng)'],
                    ['Tháng 1', 500],
                    ['Tháng 2', 700],
                    ['Tháng 3', 800],
                    ['Tháng 4', 900],
                    ['Tháng 5', 1000]
                ]);

                var options = {
                    title: 'Doanh thu theo tháng',
                    hAxis: {title: 'Tháng', titleTextStyle: {color: '#333'}},
                    vAxis: {minValue: 0},
                    colors: ['#FFA07A']
                };

                var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
        <!-- Đường dẫn tới file JavaScript của Google Charts -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
            // Load dữ liệu lên biểu đồ
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawDonutChart);

            function drawDonutChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Trang web', 'Số lượt truy cập'],
                    ['Trang chủ', 11],
                    ['Sản phẩm', 2],
                    ['Tin tức', 2],
                    ['Liên hệ', 2]
                ]);

                var options = {
                    title: 'Số lượt truy cập trong tuần qua',
                    pieHole: 0.4,
                    colors: ['#36a2eb', '#ffcd56', '#ff6384', '#4bc0c0']
                };

                var chart = new google.visualization.PieChart(document.getElementById('donut_chart'));
                chart.draw(data, options);
            }
        </script>

    </body>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="assets/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <!-- Data table plugin-->
    <script type="text/javascript" src="assets/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/dataTables.bootstrap.min.js"></script>
</html>