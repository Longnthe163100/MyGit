<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Form Đăng ký</title>
        <link href="http://localhost:9999/HomeSharing/css/auth/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <h1 class="text-center mt-5">Đăng ký</h1>
        <form action="register" method="post" onsubmit="return checkform()" class="col-lg-6 mx-auto mt-5">
                <label for="username">Tài khoản:<span style="color:red">*</span></label>
                <input type="text" name="username" id="username" value="${username}" required>
                <c:if test="${checkusername== 'username exist'}">
                    <div style="color: red" >Tài khoản này đã tồn tại, nhập lại tài khoản</div>
                </c:if>
                <label for="password">Mật khẩu: <span style="color:red">*</span></label>
                <input type="password" name="password" id="password" value="${password}" required>
                <label for="repassword">Nhập lại mật khẩu:<span style="color:red">*</span></label>
                <input type="password" name="repassword" id="repassword" value="${repassword}" required>
                <c:if test="${checkpassword== 'password fail'}">
                    <div style="color: red" >Mật khẩu và nhập lại mật khẩu không giống nhau</div>
                </c:if>
                <label for="phone">Số điện thoại:<span style="color:red">*</span></label>
                <input type="text" name="phone" id="phone" value="${phone}" required>
                <div id="checkphone" style="color: red"></div>
                <label for="fullname">Họ và Tên: <span style="color:red">*</span></label>
                <input type="text" name="fullname" id="fullname" value="${fullname}" required>
                <label for="role">Vai trò</label>
                <select name="role" id="role">
                    <option value="2" ${role == '2' ? 'selected' : ''}>Quản lý</option>
                    <option value="3" ${sex == '3' ? 'selected' : ''}>Người thuê</option>
                </select>
                <label for="email">Email:<span style="color:red">*</span></label>
                <input type="email" name="email" id="email" value="${email}" required>
                <c:if test="${checkemail == 'email exist'}">
                    <div style="color: red">Email này đã được đăng ký, vui lòng nhập email khác.</div>
                </c:if>

                <label for="dob">Ngày sinh:<span style="color:red">*</span></label>
                <input type="date" name="dob" id="dob" value="${dob}" required>
                <label for="sex">Giới tính:</label>
                <select name="sex" id="sex">
                    <option value="male" ${sex == 'male' ? 'selected' : ''}>Nam</option>
                    <option value="female" ${sex == 'female' ? 'selected' : ''}>Nữ</option>
                    <option value="other" ${sex == 'other' ? 'selected' : ''}>Khác</option>
                </select>
                <label for="address">Địa chỉ:<span style="color:red">*</span></label>
                <textarea name="address" id="address" required>${address}</textarea>
                <label for="identity_card_number">CCCD:<span style="color:red">*</span></label>
                <input type="text" name="identity_card_number" id="identity_card_number" value="${identity_card_number}" required>
                <input type="submit" value="Submit">
                </br>
                <div id="registersuccess"></div>
                <c:if test="${message == 'success'}">
                    Đăng ký tài khoản thành công!<br> 
                    <a href="login">Login</a> now
                </c:if>
            </form>
            <script src="./js/auth/register.js" type="text/javascript"></script>
    </body>
</html>
