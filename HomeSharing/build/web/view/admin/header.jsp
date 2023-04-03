<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="homeadmin">Trang quản trị</a>
    <!-- Các chức năng của người quản trị -->
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="listaccount">Danh sách tài khoản</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="listhouse">Danh sách nhà</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="listmanager">Quản lý, chủ trọ</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="listtenant">Người thuê</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="adminviewpost">Post</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="adminlistbill">Bill</a>
        </li>
    </ul>
    <!-- Thông tin người dùng -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Admin
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="right: 0;left: auto">
                <a class="dropdown-item" href="adminviewprofile">Chỉnh sửa thông tin</a>
                <a class="dropdown-item" href="changepassword">Đổi mật khẩu</a>

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout">Đăng xuất</a>
            </div>
        </li>
    </ul>
</nav>

