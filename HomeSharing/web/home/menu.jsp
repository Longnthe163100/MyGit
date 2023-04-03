
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
                <input value="${search}" name="text" placeholder="Tìm kiếm...">
                <button type="submit">Search</button>
            </form>
        </div>

        <div id="menu" class="text-left">
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
                                <input name="text" placeholder="Tìm kiếm..." type="text">
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