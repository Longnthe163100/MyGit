<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác thực tài khoản</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link href="http://localhost:9999/HomeSharing/css/auth/verify.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="d-flex align-items-center light-blue-gradient" style="height: 100vh;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card rounded-0 shadow">
                            <div class="card-header">
                                <h3 class="text-center">Xác thực tài khoản</h3>
                            </div>
                            <div class="card-body">
                                <form action="verifycode" method="post">
                                    <div class="form-group">
                                        <label for="authcode">Xác thực tài khoản</label>
                                        <input type="text" name="authcode" class="form-control" id="authcode" placeholder="Nhập code">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block">Gửi</button>
                                    <c:if test="${message == 'fail'}">
                                        <div style="color: red">Code nhập không đúng, vui lòng nhập lại</div>
                                    </c:if>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="./js/auth/verify.js" type="text/javascript"></script>
    </body>
</html> 