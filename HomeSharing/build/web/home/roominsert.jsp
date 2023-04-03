
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Thêm nhà mới</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>

    </head>

    <body class="app sidebar-mini rtl">

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
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="housemanager?action=roomlist">Danh sách phòng</a></li>
                    <li class="breadcrumb-item">Thêm phòng mới</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thêm phòng mới</h3>
                        <div class="tile-body">
                            <form class="row" action="housemanager?action=insertroom" method="POST" enctype="multipart/form-data">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Số phòng</label>
                                    <input class="form-control" placeholder="Số phòng... *" value="" name="room_number" type="text">
                                </div>
                                <div class="form-group  col-md-3">
                                    <label class="control-label">Tên khách hàng</label>
                                    <input class="form-control" placeholder="Tên khách hàng... " name="cus_name" type="text">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Email</label>
                                    <input class="form-control" placeholder="Email..." value="" name="cus_email" type="text">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Số điện thoại</label>
                                    <input class="form-control" placeholder="Số điện thoại... " value="" name="cus_phone" type="number">
                                </div>
                                
                                <button class="btn btn-save" type="submit">Lưu lại</button>

                                <a class="btn btn-cancel" href="housemanager?action=houselist">Hủy bỏ</a>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>

        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/pace.min.js"></script>
        <script>
            const inpFile = document.getElementById("inpFile");
            const loadFile = document.getElementById("loadFile");
            const previewContainer = document.getElementById("imagePreview");
            const previewContainer = document.getElementById("imagePreview");
            const previewImage = previewContainer.querySelector(".image-preview__image");
            const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
            const object = new ActiveXObject("Scripting.FileSystemObject");
            inpFile.addEventListener("change", function () {
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    previewDefaultText.style.display = "none";
                    previewImage.style.display = "block";
                    reader.addEventListener("load", function () {
                        previewImage.setAttribute("src", this.result);
                    });
                    reader.readAsDataURL(file);
                }
            });


        </script>
    </body>

</html>
