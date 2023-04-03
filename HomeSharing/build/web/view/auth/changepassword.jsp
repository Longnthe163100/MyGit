<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Sign Up</title>
        <link href="http://localhost:9999/HomeSharing/css/auth/changepassword.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="d-flex align-items-center light-blue-gradient" style="height: 100vh;">
            <div class="container" >
                <div class="d-flex justify-content-center">
                    <div class="col-md-6">
                        <div class="card rounded-0 shadow">
                            <div class="card-body">
                                <h3>Change Password</h3>
                                <form action="changepassword" method="POST" onsubmit="return checkform()">
                                    <c:if test="${sessionScope.account ne null || verifyemail != 'Success'}">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Mật khẩu hiện tại: <span style="color: red">*</span></label>
                                            <input type="password" class="form-control" id="oldpassword" name="oldpassword" value="${oldpassword}" required>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Mật khẩu mới: <span style="color: red">*</span></label>
                                        <input type="password" class="form-control" id="newpassword" name="newpassword" value="${newpassword}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Nhập lại mật khẩu mới:<span style="color: red">*</span></label>
                                        <input type="password" class="form-control" id="renewpassword" name="renewpassword" value="${renewpassword}" required>
                                    </div>
                                    <c:if test="${verifyforgetpassword == false}">
                                        <div style="color: red">Mật khẩu chỉ chứa khoảng trắng, vui lòng nhập lại</div>
                                    </c:if>
                                    <c:if test="${checkoldpassword == false}">
                                        <div style="color: red">Mật khẩu hiện tại không đúng, vui lòng nhập lại</div>
                                    </c:if>
                                    <div class="form-group">
                                        <div id="checkpassword" style="color: red"></div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="./js/auth/changepassword.js" type="text/javascript"></script>

    </body>
</html>
