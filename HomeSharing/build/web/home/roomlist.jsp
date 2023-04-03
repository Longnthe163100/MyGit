
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhà đang quản lý</title>
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

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href="login"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="breadcrumb-item" style="border-radius: 10px; border: 2px solid black; background-color: white; width: 80px; height: 30px;
                 box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); text-align: center; line-height: 30px"><a href="home">Trang chủ</a></div>
            <div class="app-sidebar__user"><a href="managerviewprofile?action=viewprofile"><img class="app-sidebar__user-avatar" src="https://bootdey.com/img/Content/avatar/avatar7.png" width="50px" alt="">
                    <div>
                        <p class="app-sidebar__user">Thông tin cá nhân</p>
                    </div>
                </a></div>
            <hr>
            <ul class="app-menu">

                <li><a class="app-menu__item" href="housemanager"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item" href="housemanager?action=houselist"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý nhà</span></a>
                </li>
                <li><a class="app-menu__item" href="housemanager?action=viewbill"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý hóa đơn</span></a></li>
                <li><a class="app-menu__item" href="viewpost"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Bài Viết</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="housemanager?action=roomlist"><b>Danh sách phòng</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="housemanager?action=roominsert" title="Thêm"><i class="fas fa-plus"></i>
                                        Thêm phòng mới</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> In dữ liệu</a>
                                </div>
                            </div>
                            <form action="housemanager?action=updateroom" method="POST">
                                <input  class="form-control" type="text" id="room_id" readonly name="room_id" hidden="" >

                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th>Mã ngôi nhà</th>
                                            <th>Số phòng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Email</th>
                                            <th>Số điện thoại</th>
                                            <th>Trạng thái</th>
                                            <th>Chức năng</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${room}" var="r">
                                            <tr>
                                                <td>${r.house_id}</td>
                                                <td>${r.room_number}</td>
                                                <td>${r.cus_name}</td>
                                                <td>${r.cus_email}</td>
                                                <td>${r.cus_phone}</td>
                                                <td>${r.status == "true" ? "Ðang trống" : "Ðang thuê"}</td>

                                                <td>
                                                    <button onclick="setId(${r.room_id})" class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                                            data-toggle="modal" data-target="#ModalUP${r.room_id}"><i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>

                                            <!--
                                            MODAL
                                            -->

                                        <div class="modal fade" id="ModalUP${r.room_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                             data-keyboard="false">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="form-group  col-md-12">
                                                                <span class="thong-tin-thanh-toan">
                                                                    <h5>Chỉnh sửa thông tin phòng ${r.room_number}</h5>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Tên khách hàng</label>
                                                                <input class="form-control" type="text" name="cus_name${r.cus_name}" value="${r.cus_name}">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Email</label>
                                                                <input class="form-control" type="text" name="cus_email${r.cus_email}" value="${r.cus_email}">
                                                            </div>

                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Số điện thoại</label>
                                                                <input class="form-control" type="number" name="cus_phone${r.cus_phone}" value="${r.cus_phone}">
                                                            </div>
                                                            <br>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Trạng thái</label>
                                                                <br>
                                                                <input type="radio" style="height: 15px; width: 15px" ${r.status?'checked':''} name="status${r.room_id}" value="true">Đang trống   
                                                                <br>
                                                                <input type="radio" style="height: 15px; width: 15px" ${r.status eq false?'checked':''}  name="status${r.room_id}" value="false">Ðang thuê
                                                            </div>
                                                        </div>
                                                        <BR>
                                                        <button class="btn btn-save" type="submit">Lưu lại</button>
                                                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                                        <BR>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--
                                      MODAL
                                        -->
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>



        <!-- Essential javascripts for application to work-->
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
        <script type="text/javascript">
                                                        const setId = (id) => {
                                                            $("#room_id").val(id);
                                                            
                                                        };
                                                        $('#sampleTable').DataTable();
                                                        //Thời Gian
                                                        function time() {
                                                            var today = new Date();
                                                            var weekday = new Array(7);
                                                            weekday[0] = "Chủ Nhật";
                                                            weekday[1] = "Thứ Hai";
                                                            weekday[2] = "Thứ Ba";
                                                            weekday[3] = "Thứ Tư";
                                                            weekday[4] = "Thứ Năm";
                                                            weekday[5] = "Thứ Sáu";
                                                            weekday[6] = "Thứ Bảy";
                                                            var day = weekday[today.getDay()];
                                                            var dd = today.getDate();
                                                            var mm = today.getMonth() + 1;
                                                            var yyyy = today.getFullYear();
                                                            var h = today.getHours();
                                                            var m = today.getMinutes();
                                                            var s = today.getSeconds();
                                                            m = checkTime(m);
                                                            s = checkTime(s);
                                                            nowTime = h + " giờ " + m + " phút " + s + " giây";
                                                            if (dd < 10) {
                                                                dd = '0' + dd
                                                            }
                                                            if (mm < 10) {
                                                                mm = '0' + mm
                                                            }
                                                            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                                            tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                                                                    '</span>';
                                                            document.getElementById("clock").innerHTML = tmp;
                                                            clocktime = setTimeout("time()", "1000", "Javascript");

                                                            function checkTime(i) {
                                                                if (i < 10) {
                                                                    i = "0" + i;
                                                                }
                                                                return i;
                                                            }
                                                        }
        </script>
        <script>
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
        </script>
    </body>

</html>