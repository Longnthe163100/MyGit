
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home Sharing</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>

        <jsp:include page="menu.jsp"/>

        <!--slider area start-->
        <div class="slider_area slider_style home_three_slider owl-carousel">
            <div class="single_slider" data-bgimg="assets/img/slider/R.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12"></div>
                    </div>
                </div>    
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/R1.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12"></div>
                    </div>
                </div>
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/R2.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--slider area end-->

        <!--banner area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm của chúng tôi</h2>            
                        </div>
                    </div> 
                </div>    
                
            </div>
        </section>
        <div class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/imgproduct/1.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/imgproduct/2.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area bottom">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/imgproduct/3.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--banner area end-->

        <!--product section area start-->
        
        
        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->
        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
