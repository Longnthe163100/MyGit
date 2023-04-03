<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thông tin bài đăng</title>
        <!-- Thêm Bootstrap và file CSS của bạn vào đây -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <style>
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
                color: #333;
            }
            h1 {
                font-size: 36px;
                margin-top: 30px;
            }
            p {
                font-size: 20px;
                line-height: 1.5;
            }
            .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                margin-top: 30px;
                padding: 30px;
            }
            .col-md-8 {
                margin-bottom: 30px;
            }
            .img-fluid {
                border-radius: 10px;
            }
            .back-button {
                margin-bottom: 30px;
            }
            pre {
/*                overflow-y: auto;
                max-height: 200px;*/
                white-space: pre-wrap; /* giữ nguyên các khoảng trắng và xuống dòng */
                word-wrap: break-word; /* tự động xuống dòng khi độ dài vượt quá khung */
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <!-- Sử dụng Bootstrap để tạo layout cho trang -->
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <a href="${pageContext.request.contextPath}/adminviewpost" class="btn btn-secondary back-button">Trở về</a>
                    <h1>${post_detail.post_title}</h1>
                    <pre class="pre">${post_detail.post_text != null ? post_detail.post_text : ''}</pre>

                    <p>Ngày đăng: ${post_detail.create_date}</p>
                    <p>Địa chỉ: ${post_detail.address}</p>
                    <p>Điện thoại: ${post_detail.phone}</p>
                    <p>Giá: ${post_detail.price}</p>
                </div>
                <div class="col-md-4">
                    <img src="<?php echo $img; ?>" alt="Ảnh bài đăng" class="img-fluid">
                </div>
            </div>
                    <form action="admineditpost" method="get"><button <link rel="stylesheet" href="admineditpost"/>Chỉnh sửa</button></form>
        </div>
    </body>
</html>
