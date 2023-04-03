<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HOME SHARING - Chỉnh sửa bài viết</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <style>
            .require {
                color: red;
            }
        </style>
    </head>
    <body>
        <!-- Responsive navbar-->
        <%@ include file="header.jsp" %> <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Chỉnh sửa bài viết</h1>
                    <p class="lead mb-0">Hãy bổ sung các thông tin cho bài post bạn muốn chỉnh sửa</p>
                </div>
            </div>
            <div class="col-md-8 col-md-offset-2">
                <form action="managereditpost" method="post">
                    <div class="form-group">
                        <label for="title">Tiêu đề: <span class="require">*</span></label>
                        <input type="text" class="form-control" name="title" value="${post_detail.post_title}" required maxlength="100"/>
                    </div>

                    <div class="form-group">
                        <label for="description">Mô tả:<span class="require">*</span></label>
                        <textarea rows="10" class="form-control" name="description" required>${post_detail.post_text}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="address">Địa chỉ: <span class="require">*</span></label>
                        <input type="text" class="form-control" name="address" value="${post_detail.address}" required maxlength="100"/>
                    </div>

                    <div class="form-group">
                        <label for="phone">Số điện thoại: <span class="require">*</span></label>
                        <input type="text" class="form-control" name="phone" value="${post_detail.phone}" required maxlength="20"/>
                    </div>

                    <div class="form-group">
                        <label for="price">Giá (VNĐ): <span class="require">*</span></label>
                        <input type="text" class="form-control" name="price" value="${post_detail.price}" required maxlength="100">
                    </div>
                    <div class="form-group">
                        <label for="img">Ảnh</label>
                        <input type="file" class="form-control" name="img"  accept="image/*"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">
                            Lưu
                        </button>
                        <button class="btn btn-default" ><a href="managerviewpostdetail?post_id=${post_detail.post_id}">Hủy</a>
                        </button>
                    </div>
                </form>
            </div>
        </header>
    </body>
</html>