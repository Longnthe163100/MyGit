<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://localhost:9999/HomeSharing/css/auth/login.css" rel="stylesheet">
        <script type="text/javascript" src=""></script>
        <link href="http://localhost:9999/HomeSharing/css/auth/login.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
<<<<<<< HEAD
        <style>
            
            .login-box {
    background: url(https://i.imgur.com/73BxBuI.png);
    background-size: cover;
    background-position: center;
    padding: 50px;
    margin: 0 auto;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    -webkit-box-shadow: 0 2px 60px -5px rgba(0, 0, 0, 0.1);
    box-shadow: 0 2px 60px -5px rgba(0, 0, 0, 0.1);
}
            .full-height {
                height: 100vh;
                margin: 0px;
            }
            .container {
                width: 100%;
                margin: auto;
                padding: 0px;
                border: none;
            }
            body {
                margin: 0px;
                border: none;
            }
        </style>


=======
>>>>>>> b685177bdfc71b6d913adc6c543de1cbf917049c
    </head>
    <body oncontextmenu="return false" class="snippet-body">
        <div class="container">
            <div class="login-box full-height">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <a href="home"><span class="logo-font">Home</span>Sharing</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <br>
                        <h3 class="header-title">Đăng Nhập</h3>
                        <form class="login-form" action="login" method ="post" >
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Tài khoản" name="username" value="${username}">
                            </div>
                            <div class="form-group">
                                <input type="Password" class="form-control" placeholder="Mật khẩu" name="password" value="${password}">
                                <a href="forgetpassword" class="forget-password">Quên mật khẩu?</a>
                            </div>
                            <div style="color: red">
                                <c:if test="${message != ''}">
                                    ${message}<br> 
                                </c:if>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-block">Đăng nhập</button>
                            </div>
                            <div class="g-signin2"></div>

                            <button><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/HomeSharing/logingoogle&response_type=code
                                       &client_id=916628674051-cire4q7fcah0m9s95nkolc49dpcjhol5.apps.googleusercontent.com&approval_prompt=force">Login With Google</a></button>

                            <div class="form-group">
                                <div class="text-center">Chưa có tài khoản? <a href="register">Đăng ký</a></div>
                            </div>
                        </form>

                    </div>
                    <div class="col-sm-6 hide-on-mobile">
                        <img src="./assets/img/imglogin/thiet-ke-nha-28.jpg" alt="" style="width: 100%; height: 100%"/>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript"></script>
        <script src="./js/auth/login.js" type="text/javascript"></script>
    </body>
</html>