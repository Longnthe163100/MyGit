
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->


        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>

        <div class="offcanvas_menu">
            <div class="canvas_open">
                <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
            </div>
            <div class="offcanvas_menu_wrapper">
                <div class="canvas_close">
                    <a href="javascript:void(0)"><i class="ion-android-close"></i></a>  
                </div>
                <div class="top_right">
                    <ul>
                        <li class="top_links"><a href="#">Tài Khoản của tôi <i class="ion-chevron-down"></i></a>
                            <ul class="dropdown_links">

                                <c:if test="${sessionScope.account == null}">
                                    <li><a href="login">Đăng nhập</a></li>
                                    </c:if>

                                <c:if test="${sessionScope.account != null}">
                                    <li><a href="login">Đăng xuất</a></li>
                                    </c:if>

                            </ul>
                        </li> 
                    </ul>
                </div> 
                <div class="search_bar">
                    <form action="product?action=search" method="POST">
                        <input value="${saa}" name="text" placeholder="Tìm kiếm..."u>
                        <button type="submit">Search</button>
                    </form>
                </div>

                <div id="menu" class="text-left ">
                    <ul class="offcanvas_main_menu">
                        <li class="active">
                            <a href="home">Trang chủ</a>
                        </li>
                        <li class="active">
                            <a href="product">Sản phẩm</a>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="about">Chúng tôi</a>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="contact">Liên hệ</a> 
                        </li>
                        <li class="menu-item-has-children">
                            <a href="viewpost">Bài đăng</a> 
                        </li>
                    </ul>
                </div>
                <div class="offcanvas_footer">
                    <span><a href="#"><i class="fa fa-envelope-o"></i> longnthe163100@fpt.edu.vn</a></span>
                </div>
            </div>
        </div>
        <!--Offcanvas menu area end-->

        <!--header area start-->
        <header class="header_area header_three">
            <!--header top start-->
            <div class="header_top">
                <div class="container-fluid">   
                    <div class="row align-items-center">
                        <div class="col-lg-7 col-md-12">

                        </div>
                        <div class="col-lg-5 col-md-12">
                            <div class="top_right text-right">
                                <ul>

                                    <c:if test="${sessionScope.account != null}">
                                        <li class="top_links"><a href="#">Xin chào<i class="ion-chevron-down"></i></a>
                                            </c:if>
                                            <c:if test="${sessionScope.account == null}">
                                        <li class="top_links"><a href="#">Đăng nhập<i class="ion-chevron-down"></i></a>
                                            </c:if>
                                        <ul class="dropdown_links">
                                            <c:if test="${sessionScope.account != null}">
                                                <li><a href="managerviewprofile?action=viewprofile">Tài khoản của tôi</a></li>
                                                </c:if>

                                            <c:if test="${sessionScope.account != null}">
                                                <li><a href="housemanager">Quản lý nhà</a></li>
                                                </c:if>


                                            <c:if test="${sessionScope.account == null}">
                                                <li><a href="login">Đăng nhập</a></li>
                                                </c:if>

                                            <c:if test="${sessionScope.account != null}">
                                                <li><a href="login">Đăng xuất</a></li>
                                                </c:if>
                                        </ul>
                                    </li> 
                                </ul>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
            <!--header top start-->
            <img src="../assets/img/icon/OIP.jpg" alt=""/>
            <!--header middel start-->
            <div class="header_middel">
                <div class="container-fluid">
                    <div class="middel_inner">
                        <div class="row align-items-center">
                            <div class="col-lg-4">
                                <div class="search_bar">
                                    <form action="product?action=search" method="POST">
                                        <input value="${saa}"  name="text" placeholder="Tìm kiếm..." type="text">
                                        <button type="submit"><img src="assets/img/icon/OIP.jpg" style="height: 20px  " alt=""></button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="logo">
                                    <a href="home"><img src="assets/img/logo/R.png" style="width: 150px; height: 150px" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-4">
                            </div>

                        </div>
                    </div>

                    <div class="horizontal_menu">
                        <div class="left_menu">
                            <div class="main_menu"> 
                                <nav>  
                                    <ul>
                                        <li><a href="home">Trang chủ<i class="fa"></i></a>
                                        </li>
                                        <li class="mega_items"><a href="product">Sản phẩm</a>
                                        </li>
                                    </ul> 
                                </nav> 
                            </div>
                        </div>
                        <div class="right_menu">
                            <div class="main_menu"> 
                                <nav>  
                                    <ul>
                                        <li><a href="about">Chúng tôi</a></li>
                                        <li><a href="contact">Liên hệ</a></li>
                                        <li><a href="viewpost">Bài đăng</a></li>
                                    </ul> 
                                </nav> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--header middel end-->

            <!--header bottom satrt-->
            <div class="header_bottom sticky-header">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="main_menu_inner">
                                <div class="main_menu"> 
                                    <nav>  
                                        <ul>
                                            <li class="active"><a href="home">Trang chủ</a></li>
                                            <li><a href="product">Sản phẩm</a></li>
                                            <li><a href="about">Chúng tôi</a></li>
                                            <li><a href="contact">Liên hệ</a></li>
                                            <li><a href="viewpost">Bài đăng</a></li>
                                        </ul>   
                                    </nav> 
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <!--header bottom end-->
        </header>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Cửa hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--shop  area start-->
        <div class="shop_area shop_reverse">
            <div class="container">
                <div class="shop_inner_area">
                    <div class="row">
                        <div class="col-lg-3 col-md-12">
                            <!--sidebar widget start-->
                            <div class="sidebar_widget">
                                <div class="widget_list widget_categories">
                                    <h2>Danh mục</h2>
                                    <ul>
                                        <li><a href="product">TẤT CẢ</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!--sidebar widget end-->
                        </div>
                        <div class="col-lg-9 col-md-12">
                            <!--shop wrapper start-->
                            <!--shop toolbar start-->
                            <div class="shop_title">
                                <h2>Sản phẩm</h2>
                            </div>
                            <div class="shop_toolbar_wrapper" style="border:none">
                                <div class="dropdown ">
                                    <button style="color: #000; background-color: #ffffff;border:none; font-family: sans-serif;" class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Bộ lọc
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="product?action=sort&type=low">Giá từ thấp đến cao</a>
                                        <a class="dropdown-item" href="product?action=sort&type=high">Giá từ cao xuống thấp</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row shop_wrapper">
                                <c:forEach items="${HouseData}" var="h">
                                    <div class="col-lg-4 col-md-4 col-12 ">
                                        <div class="single_product">
                                            <div class="product_thumb">
                                                <a class="primary_img" href="product?action=housedetail&house_id=${h.house_id}"><img src="${h.img}" alt=""></a>
                                                <div class="quick_button">
                                                    <a href="product?action=housedetail&house_id=${h.house_id}"title="quick_view">Chi tiết</a>
                                                </div>
                                            </div>

                                            <div class="product_content grid_content">
                                                <h3><a href="product?action=housedetail&house_id=${h.house_id}">${h.address}</a></h3>
                                                <span class="current_price">${h.price}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <c:set var="page" value="${page}"/>
                            <div class="shop_toolbar t_bottom" style="border: none;">
                                <div class="pagination">
                                    <ul>
                                        <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="${i==page?"current":""}"><a href="product?page=${i}">${i}</a></li>
                                            </c:forEach>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--shop  area end-->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>