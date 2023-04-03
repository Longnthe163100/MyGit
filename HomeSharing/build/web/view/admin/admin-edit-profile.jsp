<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <form action="admineditprofile" method="POST">
            <div class="container" style="margin-top: 50px">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin" width="280px">
                                        </div>
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
                                            <input type="text" class="form-control" name="fullname" id="fullName" value="${sessionScope.accountViewProfile.fullname}" maxlength="50">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail">Email</label>
                                            <input type="email" class="form-control" name="email" id="eMail" value="${sessionScope.accountViewProfile.email}" maxlength="50" readonly>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại</label>
                                            <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.accountViewProfile.phone}" maxlength="10">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="sex">Giới tính </label>
                                            <select class="form-control" id="gender" name="sex">
                                                <option name="sex" value="${sessionScope.accountViewProfile.sex ? "true":"false"}">${sessionScope.accountViewProfile.sex ? "Nam":"Nữ"}</option>
                                                <option name="sex" value="${!sessionScope.accountViewProfile.sex ? "true":"false"}">${!sessionScope.accountViewProfile.sex ? "Nam":"Nữ"}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters">

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="Street">Ngày sinh:</label>
                                            <input type="date" class="form-control" name="dob" id="Street" value="${sessionScope.accountViewProfile.dob}">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="ciTy">Địa chỉ</label>
                                            <input type="name" class="form-control" name="address" id="ciTy" value="${sessionScope.accountViewProfile.address}" maxlength="100">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="sTate">CMND/CCCD</label>
                                            <input type="text" class="form-control" name="identity_card_number" id="sTate" value="${sessionScope.accountViewProfile.identity_card_number}" maxlength="20">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    </div>
                                </div>
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button id="submit" name="btn" value="cancel" class="btn btn-secondary">Hủy</button>
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
</body>
</html>
