<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="http://localhost:9999/HomeSharing/css/auth/forgetpassword.css" rel="stylesheet" type="text/css"/>
        <title>Forget password</title>
    </head>
    <body>
        <div class="d-flex align-items-center light-blue-gradient" style="height: 100vh;">
            <div class="container" >
                <div class="d-flex justify-content-center">
                    <div class="col-md-7">
                        <div class="card rounded-0 shadow">
                            <div class="card-body">
                                <h3>Quên mật khẩu</h3>
                                <form action="forgetpassword" method="POST" onsubmit="return checkemail()">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Nhập email:</label>
                                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Nhập email" name="email"  value="${email}">
                                        <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ gửi mã code xác nhận tới email của bạn.</small>
                                    </div>
                                    <div style="color: red">
                                        <c:if test="${failemail == 'Not found email'}">
                                            ${message}<br>
                                        </c:if>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Gửi</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
