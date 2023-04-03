<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile Page</title>
        <link href="../css/profile/updateprofile.css" rel="stylesheet" type="text/css"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src=""></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #a6f7cd">
        <form action="editprofile" method="POST">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <span class="logo-font">Home</span>Sharing
                        </div>
                    </div>
                </div>
                <div class="body-main">
                    <nav aria-label="breadcrumb" class="main-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Thay đổi thông tin cá nhân</li>
                        </ol>
                    </nav>
                </div>
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                                        </div>
                                        <%//<h5 class="user-name">${sessionScopeScope.accInfo.username}</h5>
                                        //<h6 class="user-role">${sessionScopeScope.accInfo.role}</h6>%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-2 text-primary">Thay đổi thông tin cá nhân</h6>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="fullName">Họ và tên</label>
                                            <input type="text" class="form-control" name="fullname" id="fullName" value="${sessionScope.accInfo.fullname}" maxlength="50">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail">Email</label>
                                            <input type="email" class="form-control" name="email" id="eMail" value="${sessionScope.accInfo.email}" maxlength="50">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại</label>
                                            <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.accInfo.phone}" maxlength="10">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="sex">Giới tính </label>
                                            <c:if test="${requestScope.accInfo.sex}">
                                                <select class="form-control" id="gender" name="gender">
                                                    <option name="gender" value="1">Nam</option>
                                                    <option name="gender" value="0">Nữ</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${!requestScope.accInfo.sex}">
                                                <select class="form-control" id="gender" name="gender">
                                                    <option name="gender" value="0">Nữ</option>
                                                    <option name="gender" value="1">Nam</option>
                                                </select>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters">

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="Street">Ngày sinh:</label>
                                            <input type="date" class="form-control" name="dob" id="Street" value="${sessionScope.accInfo.dob}">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="ciTy">Địa chỉ</label>
                                            <input type="name" class="form-control" name="address" id="ciTy" value="${sessionScope.accInfo.address}" maxlength="100">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="sTate">CMND/CCCD</label>
                                            <input type="text" class="form-control" name="cccd" id="sTate" value="${sessionScope.accInfo.identity_card_number}" maxlength="20">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    </div>
                                </div>
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button id="submit" name="btn" value="cancel" class="btn btn-secondary">Huỷ</button>
                                            <button id="submit" name="btn" value="update" class="btn btn-primary">Lưu</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <jsp:include page="../../home/footer.jsp"/>
</body>
</html>
