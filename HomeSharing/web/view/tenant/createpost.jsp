<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HOME SHARING</title>
        <link href="../../css/post/styles.css" rel="stylesheet" type="text/css"/>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
    </head>
    <body>
        <!-- Responsive navbar-->
        <%@ include file="header.jsp" %>

        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">CHÀO MỪNG BẠN ĐẾN VỚI BLOG HOME SHARING</h1>
                    <p class="lead mb-0">Blog Home Sharing kết nối muôn nơi</p>
                </div>
            </div>
            <div class="col-md-8 col-md-offset-2">



                <form action="" method="POST">

                    <div class="form-group has-error">
                        <label for="slug">Link <span class="require">*</span> <small>(This field use in url path.)</small></label>
                        <input type="text" class="form-control" name="slug" />
                        <span class="help-block">Field not entered!</span>
                    </div>

                    <div class="form-group">
                        <label for="title">Chủ đề <span class="require">*</span></label>
                        <input type="text" class="form-control" name="title" />
                    </div>

                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea rows="5" class="form-control" name="description" ></textarea>
                    </div>

                    <div class="form-group">
                        <p><span class="require"></span></p>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">
                            POST
                        </button>
                        <button class="btn btn-default">
                            Hủy
                        </button>
                    </div>
                </form>
            </div>
    </body>
</html>
